# Endnote2XLS
<pre>
Oh, this is a tiny tool just used to convert file format. 
It is so easy. Welcome everyone to add content.
<h7>中文版</h7>
<h8>如何使用？</h8>
1、需先安装devtools(仅安装一次):  
<blockquote>install.packages("devtools")</blockquote>
2、安装R包(仅安装一次)：
<blockquote>devtools::install_github("KehaoWu/Endnote2XLS")</blockquote>
3、加载R包
<blockquote>library(Endnote2XLS)</blockquote>
4、对于非CBM的Endnote格式文件转换方法：
<blockquote>files = c("wanfang.txt","vp.txt")
EndNote2XLS(files)</blockquote>
5、对于CBM的文本文件格式转换方法：
<blockquote>files = c("CBM.txt")
EndNote2XLS(files,CBM=TRUE)</blockquote>

<h7>English-Version</h7>
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


</pre>