library(ggplot2)
library(plotly)
library(gcookbook)
library(gridExtra)
library(dplyr)
########################## 基本条形图 #########################
## 知识点总结：
# (1) 默认y轴(连续)为每个X变量(类别)对应的Y变量的值; 
# (2) 要将y轴显示为X变量(连续)的个数, 即count(X), 则不需要将y映射到数据,
#且用默认的geom_bar()或geom_bar(stat = 'count')
# (3) 

####################### Parameter ##############################
geom_bar(mapping = NULL, 
         data = NULL, 
         stat = "count", position = "stack", ...,
         fil = '',
         colour = '',
         width = NULL, binwidth = NULL, 
         na.rm = FALSE, 
         show.legend = NA, 
         inherit.aes = TRUE)
stat_count(mapping = NULL,
           data = NULL, 
           geom = "bar", position = "stack", ..., 
           width = NULL, 
           na.rm = FALSE, 
           show.legend = NA, 
           inherit.aes = TRUE)
# geom_bar(stat = '')
# geom_bar(stat = '', fill = '', color = '')
# 




#################################################################

##################################################################
#   geom_bar() or geom_bar(stat = 'count') or geom_histogram()
##################################################################
# 1. 如果x轴为离散变量
p1 = ggplot(data = diamonds, aes(x = cut)) +
    geom_bar()
p1

# or

# 好像geom_bar(stat = 'bin')不能用了, 改为geom_bar(stat = 'count')
p11 = ggplot(data = diamonds, aes(x = cut)) +
    geom_bar(stat = 'count')
p11


# 2. 如果x轴为连续变量, 则变为直方图
p2 = ggplot(data = diamonds, aes(x = carat)) +
    geom_bar()
p2

p21 = ggplot(data = diamonds, aes(x = carat)) +
    geom_bar(stat = 'count')
p21

p22 = ggplot(data = diamonds, aes(x = carat)) + 
    geom_histogram()
p22

##############################################################
#----------------- geom_bar(stat = 'identity') ---------------
##############################################################
# 1. 如果x轴为离散变量
str(pg_mean)
p1 = ggplot(data = pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = 'identity')
p1


# 2. 如果x轴为连续变量(注意下面两个图的差别)
str(BOD)
p2 = ggplot(data = BOD, aes(x = Time, y = demand)) + 
    geom_bar(stat = 'identity')
p2 # Time = 6对应一个空Bar

p21 = ggplot(data = BOD, aes(x = factor(Time), y = demand)) +
    geom_bar(stat = 'identity')
p21 # Time = 6没有任何东西

grid.arrange(p2, p21, ncol = 2)

#####################################################################
##                   geom_bar(stat = '', fill = '', colour = '')
#####################################################################

p1 = ggplot(data = pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = 'identity', fill = 'lightblue')
p1

p11 = ggplot(data = pg_mean, aes(x = group, y = weight)) +
    geom_bar(stat = 'identity', fill = 'lightblue', colour = 'black')
p11


############################# 有问题, 不能运行#######################
## ggplot(aes(fill = ))
## geom_bar(position = 'dodge')

p12 = ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(position = 'dodge')
p12

p13 = ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
    geom_bar(position = 'dodge', colour = 'black') +
    scale_fill_brewer(palette = 'Pastel1')
p13

p14 = ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultival)) +
    geom_bar(position = 'dodge', colour = 'black') +
    scale_fill_manual(palette = 'Pastel1')
p14
######################################################################

?reorder
?rank

upc = uspopchange %>%
    filter(rank(Change) > 40)
p1 = ggplot(data = upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) +
    geom_bar(stat = 'identity', colour = 'black') +
    scale_fill_manual(values = c('#669933', '#FFCC66')) +
    xlab('Stata')
p1
