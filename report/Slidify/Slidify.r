install.packages("installr")   #下载并安装installr包
library(installr)              #装载installr包
install.RStudio()              #下载并安装RStudio IDE
install.Rtools()               #你需要Rtools来构建自己的包
install.git()                  #git提供了代码的版本控制功能
################################################################
## Slidify Using

install.packages("rmarkdown")
install.packages("knitr")
install.packages('devtools')
library(devtools)

# install slidify packages
install_github('slidify', 'ramnathv')
install_github("ramnathv/slidify ")
install_github('slidifyLibraries', 'ramnathv')

# do it
#######################################
library(slidify)
author("My_Slidify1")
slidify("index.Rmd")
library(shiny)
browseURL("index.html")
######################################

# publish
publish(user = "Wangzf", repo = "Exercise_First", host = 'github')
publish('mydeck', host = 'dropbox')

#######################################
# zhong wen you hua 
library(devtools)
install_github("lchiffon/slidify")
install_github('slidifyLibraries', 'ramnathv')
## install_github("ramnath/slidifyLibraries")