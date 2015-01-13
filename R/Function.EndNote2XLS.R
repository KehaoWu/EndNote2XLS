Endnote2XLS = function(files=NULL,merge=F)
{
  if(is.null(files))
  {
    stop("Error: Please specify your file names.\n")
  }
  outfileMerge = paste(dirname(files[1]),"Endnote2XLS.txt",sep="/")
  outfileMergeCBM = paste(dirname(files[1]),"Endnote2XLS.CBM.txt",sep="/")
  first = TRUE
  firstCBM = TRUE
  print(outfileMerge)
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
    CBM = FALSE
    if(grepl(pattern = "^[0-9]",perl = T,x = content[1]))
      CBM = TRUE
    
    if(CBM)
    {
      content = content[grepl(pattern = "^[0-9]|:",perl = T,x = content)]
      Start = (1:length(content))[grepl(pattern = "^[0-9]",perl = T,x = content)]
      Labels = unlist(lapply(X = content[-Start],FUN = function(line)unlist(strsplit(x = line,split = ":"))[1]))
    }else{
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
    if(!merge)
      write.table(x = Result,file = outfile,quote = F,sep = "\t",col.names = T,row.names = F,fileEncoding = "UTF-8")
    else
    {
      if(CBM)
      {
        if(firstCBM)
        {
          write.table(x = Result,file = outfileMergeCBM,quote = F,sep = "\t",col.names = T,row.names = F,fileEncoding = "UTF-8")
          firstCBM = FALSE
        }else{
          write.table(x = Result,file = outfileMergeCBM,quote = F,sep = "\t",col.names = F,row.names = F,fileEncoding = "UTF-8",append = T)
        }
      }else{
        if(first)
        {
          write.table(x = Result,file = outfileMerge,quote = F,sep = "\t",col.names = T,row.names = F,fileEncoding = "UTF-8")
          first = FALSE
        }else{
          write.table(x = Result,file = outfileMerge,quote = F,sep = "\t",col.names = F,row.names = F,fileEncoding = "UTF-8",append = T)
        }      }
    }
    cat("\n")
  }
}

