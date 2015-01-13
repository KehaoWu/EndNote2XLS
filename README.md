# Endnote2XLS
#### 中文版-使用说明
##### 新版本特性
1. 自动识别是否是CBM文件，无需指定选项
2. 可选择是否合并输出文件

##### 如何使用
1. 需先安装devtools(仅安装一次):  
> install.packages("devtools")

2. 安装R包(仅安装一次)：
> devtools::install_github("KehaoWu/Endnote2XLS")

3. 加载R包
> library(Endnote2XLS)

4. 如果不需要合并输出结果
   files=dir()的作用是获取当前工作路径下的所有文件名，前提是该工作路径下只含有你需要转换的文件
> files = dir() <br>
> Endnote2XLS(files)

5. 如果需要合并输出结果
   files=dir()的作用是获取当前工作路径下的所有文件名，前提是该工作路径下只含有你需要转换的文件
> files = dir() <br>
> Endnote2XLS(files,combine=T)

6. 所有来自CBM、CNKI等网站的文件导出不需要做任何其他的调整，可以直接用于格式转换

7. 转换后文件导入Excel时不要选择用空格分隔
