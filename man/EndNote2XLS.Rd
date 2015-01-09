\name{EndNote2XLS}
\alias{EndNote2XLS}
\title{
Convert files from Chinese reference database to txt.
}
\description{
Oh, this is a tiny tool just used to convert file format. It is so easy. Welcome to enlarge it.
}
\usage{
EndNote2XLS(files = NULL, CBM = F, XLSFile = NULL)
}
\arguments{
  \item{files}{
A vector contained your file names.
}
  \item{CBM}{
TRUE or FALSE. Use it to specify whether your file come from CBM database.
}
  \item{XLSFile}{
Not available.
}
}
\details{
}
\value{
No value will output.
}
\author{
KeHao Wu
KeHao Wu<Kehao.wu@gmail.com>
}

\examples{
#Example:
#1. Endnote file format:
files = c("wanfang.txt","vp.txt")  #Your file description will be specified like this.
EndNote2XLS(files)

#2. CBM file format:
files = c("CBM.txt") #Your file description will be specified like this.
EndNote2XLS(files,CBM=TRUE)
}

