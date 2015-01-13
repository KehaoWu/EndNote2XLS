\name{EndNote2XLS}
\alias{EndNote2XLS}
\title{
Convert files from Chinese reference database to txt.
}
\description{
Oh, this is a tiny tool just used to convert file format. It is so easy. Welcome to enlarge it.
}
\usage{
EndNote2XLS(files = NULL,combine = F)
}
\arguments{
  \item{files}{
A vector contained your file names.
}
  \item{Combine}{
TRUE or FALSE with default value is FALSE. Use it to specify whether you want to combine such files.
}
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
#1. if you want to combine such files:
files = dir()  #To get all file names in your current work directory.
EndNote2XLS(files,combine=T)

#2. if you do not want to combine such files:
files = dir()  #To get all file names in your current work directory.
EndNote2XLS(files)
}

