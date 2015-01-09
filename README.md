# Endnote2XLS
<pre>
Oh, this is a tiny tool just used to convert file format. It is so easy. Welcome to make it perfect.
<h2>English-Version</h2>
<h3>How to use it?</h3>
1.install package: devtools(just once):  
  install.packages("devtools")
2.install Endnote2XLS(just once))：
  devtools::install_github("KehaoWu/Endnote2XLS")
3、load R package
  library(Endnote2XLS)
4、For files from non-CBM：
  files = c("wanfang.txt","vp.txt")
  EndNote2XLS(files)
5、For files from CBM:
  files = c("CBM.txt")
  EndNote2XLS(files,CBM=TRUE)

<h2>中文本</h2>
<h3>如何使用？</h3>
1、需先安装devtools(仅安装一次):  
install.packages("devtools")
2、安装R包(仅安装一次)：
devtools::install_github("KehaoWu/Endnote2XLS")
3、加载R包
library(Endnote2XLS)
4、对于非CBM的Endnote格式文件转换方法：
files = c("wanfang.txt","vp.txt")
EndNote2XLS(files)
5、对于CBM的文本文件格式转换方法：
files = c("CBM.txt")
EndNote2XLS(files,CBM=TRUE)
</pre>