#library(WriteXLS)
EndNote2XLS = function(files=NULL,CBM=F,XLSFile=NULL)
{
  if(is.null(files))
  {
    cat("Please specify your file names.\n")
  }
  for(file in files)
  {
    cat("Process file",file,"...\n")
    if(is.null(XLSFile))
      outfile = paste(file,".txt",sep="")
    if(!file.exists(file))
    {
      cat("File",file,"is not exist and skip it...\n")
      assign(x = file,value = data.frame())
      next
    }
    content = readLines(con = file)
    
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
        Result[index,match(x = first,table = Labels)] = second
      }
      setTxtProgressBar(pb,index)
    }
    if(is.null(XLSFile))
      write.table(x = Result,file = outfile,quote = F,sep = "\t",col.names = T,row.names = F)
    else
      assign(x = file,value = as.data.frame(Result),envir = .GlobalEnv)
    cat("\n")
  }
  if(!is.null(XLSFile))
    WriteXLS(x = files,ExcelFileName = XLSFile)
}

