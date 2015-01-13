trans = function(content)
{
  CBM = FALSE
  if(grepl(pattern = "^[0-9]",perl = T,x = content[1]))
    CBM = TRUE
  content = content[!grepl(pattern = "^%\\+",x = content)]
  if(CBM)
  {
    content = content[grepl(pattern = "^[0-9]|:",perl = T,x = content)]
    Start = (1:length(content))[grepl(pattern = "^[0-9]",perl = T,x = content)]
    Labels = unlist(lapply(X = content[-Start],FUN = function(line)unlist(strsplit(x = line,split = ":"))[1]))
  }else{
    content = content[!grepl(pattern = "^%\\+",x = content)]
    content = content[grepl(pattern = "^%",x = content)]
    Start = (1:length(content))[grepl(pattern = "%0",x = content)]
    Labels = unlist(lapply(X = content,FUN = function(line)unlist(strsplit(x = line,split = "\\s"))[1]))
  }
  
  Stop = c(Start[-1]-1,length(content))
  
  
  Labels = Labels[!is.na(Labels)]
  Labels = unique(Labels)
  
  Result = matrix(data = "",nrow = length(Start),ncol = length(Labels))
  colnames(Result) = Labels
  pb = txtProgressBar(min = 1,max = length(Start),style = 3)
  for(index in 1:length(Start))
  {
    subContent = content[Start[index]:Stop[index]]
    for( line in subContent)
    {
      if(line == "")
        next
      if(CBM)
        line_split = unlist(strsplit(x = line,split = ":"))
      else
        line_split = unlist(strsplit(x = line,split = "\\s"))
      first = line_split[1]
      second = paste(line_split[-1],collapse = " ")
      cIndex = match(x = first,table = Labels)
      Result[index,cIndex] = gsub(pattern = "^\\s+",replacement = "",x = paste(Result[index,cIndex],second),perl = T)
    }
    setTxtProgressBar(pb,index)
  }
  return(Result)
}

Endnote2XLSSingle = function(files=NULL)
{
  if(is.null(files))
  {
    stop("Error: Please specify your file names.\n")
  }
  for(file in files)
  {
    cat("Process file",file,"...\n")
    outfile = paste(file,".txt",sep="")
    if(!file.exists(file))
    {
      cat("File",file,"is not exist and skip it...\n")
      assign(x = file,value = data.frame())
      next
    }
    content = readLines(con = file,encoding = "UTF-8")
    Result = trans(content)
    write.table(x = Result,file = outfile,quote = F,sep = "\t",col.names = T,row.names = F,fileEncoding = "UTF-8")
    cat("\n")
  }
}

Endnote2XLSCombine = function(files=NULL)
{
  if(is.null(files))
  {
    stop("Error: Please specify your file names.\n")
  }
  firstLine = NULL
  for(file in files)
  {
    if(!file.exists(file))
    {
      cat("File",file,"is not exist and skip it...\n")
      next
    }
    firstLine = c(firstLine,readLines(file,1,encoding = "UTF-8"))
  }
  isCBM = unlist(lapply(firstLine,FUN = function(line){
    grepl(pattern = "^[0-9]|:",perl = T,x = line)
  }))
  
  ##non-CBM
  if(any(!isCBM))
  {
    content = NULL
    
    for(file in files[!isCBM])
    {
      cat("Merge file",file,"...\n")
      if(!file.exists(file))
      {
        cat("File",file,"is not exist and skip it...\n")
        next
      }
      content = c(content,readLines(file,encoding = "UTF-8"))
    }
    cat("Process non-CBM files ...\n")
    Result = trans(content)
    outfile = paste(dirname(files[!isCBM][1]),"Endnote2XLS.txt",sep="/")
    write.table(x = Result,file = outfile,quote = F,sep = "\t",col.names = T,row.names = F,fileEncoding = "UTF-8")
    cat("\n")
  }
  if(any(isCBM))
  {
    content = NULL
    
    for(file in files[isCBM])
    {
      cat("Merge file",file,"...\n")
      if(!file.exists(file))
      {
        cat("File",file,"is not exist and skip it...\n")
        next
      }
      content = c(content,readLines(file,encoding = "UTF-8"))
    }
    cat("Process CBM files ...\n")
    Result = trans(content)
    outfile = paste(dirname(files[!isCBM][1]),"Endnote2XLS.CBM.txt",sep="/")
    write.table(x = Result,file = outfile,quote = F,sep = "\t",col.names = T,row.names = F,fileEncoding = "UTF-8")
    cat("\n")
  }
}
Endnote2XLS = function(files=NULL,combine=F)
{
  if(combine)
    Endnote2XLSCombine(files)
  else
    Endnote2XLSSingle(files)
}

