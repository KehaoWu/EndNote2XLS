# Endnote2XLS
## 中文版-使用说明
*需先安装devtools(仅安装一次):  
<blockquote>install.packages("devtools")</blockquote>
*安装R包(仅安装一次)：
<blockquote>devtools::install_github("KehaoWu/Endnote2XLS")</blockquote>
*加载R包
<blockquote>library(Endnote2XLS)</blockquote>
*对于非CBM的Endnote格式文件转换方法：
<blockquote>files = c("wanfang.txt","vp.txt")
EndNote2XLS(files)</blockquote>
*对于CBM的文本文件格式转换方法：
<blockquote>files = c("CBM.txt")
EndNote2XLS(files,CBM=TRUE)</blockquote>
*对于

<h5>English-Version</h5>
<h8>How to use it?</h8>
1.install package: devtools(just once):  
<blockquote>install.packages("devtools")</blockquote>
2.install Endnote2XLS(just once))：
<blockquote>devtools::install_github("KehaoWu/Endnote2XLS")</blockquote>
3、load R package
<blockquote>library(Endnote2XLS)</blockquote>
4、For files from non-CBM：
<blockquote>files = c("wanfang.txt","vp.txt")
EndNote2XLS(files)</blockquote>
5、For files from CBM:
<blockquote>files = c("CBM.txt")
EndNote2XLS(files,CBM=TRUE)</blockquote>
