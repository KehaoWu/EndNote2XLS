# Endnote2XLS
#### 中文版-使用说明
1. 需先安装devtools(仅安装一次):  
> install.packages("devtools")

2. 安装R包(仅安装一次)：
> devtools::install_github("KehaoWu/Endnote2XLS")

3. 加载R包
> library(Endnote2XLS)

4. 对于非CBM的Endnote格式文件转换方法：
> files = c("wanfang.txt","vp.txt")<br>
> EndNote2XLS(files)

5. 对于CBM的文本文件格式转换方法：
> files = c("CBM.txt")<br>
> EndNote2XLS(files,CBM=TRUE)

6. 所有来自CBM、CNKI等网站的文件导出不需要做任何其他的调整，可以直接用于格式转换

7. 多个文件可以先通过Windows的DOS命令来合并，以下命令在Windows下完成
> copy * new.txt

8. 转换后文件导入Excel时不要选择用空格分隔

#### English-Version</h5>
1. install package: devtools(just once)
> install.packages("devtools")

2. install Endnote2XLS(just once))
>devtools::install_github("KehaoWu/Endnote2XLS")

3. load R package
> library(Endnote2XLS)

4. For files from non-CBM
> files = c("wanfang.txt","vp.txt")<br>
> EndNote2XLS(files)

5. For files from CBM
> files = c("CBM.txt")<br>
> EndNote2XLS(files,CBM=TRUE)

