##############################################################
##                    Pie Charts in R
#############################################################
library(plotly)
packageVersion('plotly')
#============================================================
#                     Basic Pie Chart
#============================================================
# data
USPersonalExpenditure = data.frame('Categorie' = rownames(USPersonalExpenditure), 
                                   USPersonalExpenditure)
data = USPersonalExpenditure[, c("Categorie", 'X1960')]
data
sapply(data, class)
# plot
p1 = plot_ly(data = data, labels = ~ Categorie, values = ~ X1960, type = 'pie') %>%
    layout(title = 'United States Personal Expenditures by Categories in 1960',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p1
#============================================================
#                     Styled Pie Chart
#============================================================
# data
data

# plot
colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 
            'rgb(144,103,167)', 'rgb(171,104,87)', 
            'rgb(114,147,203)')
p3 = plot_ly(data = data, labels = ~ Categorie, values = ~ X1960, type = 'pie',
             # 图中文本显示的信息
             textposition = 'inside', 
             textinfo = 'label+percent', 
             insidetextfont = list(color = '#FFFFFF'), 
             # 图中交互模式下显示的文本信息
             hoverinfo = 'text', text = ~ paste('$', X1960, ' billions'),
             # 图的整体颜色(填充)、线条(颜色，宽度)设置
             marker = list(colors = colors, 
                           line = list(color = '#FFFFFF', width = 1)),
             # 是否显示图例
             showlegend = FALSE) %>%
    # 标题、坐标轴设置
    layout(title = 'United States Personal Expenditures by Categories in 1960', 
           xaxis = list(showgrid = FALSE,       # 是否显示背景网络格
                        zeroline = FALSE,       # 是否显示坐标轴线
                        showticklabels = FALSE  # 是否显示坐标轴标签
                        ), 
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p3


# 我们看一下坐标轴设置的不同之处
p3 = plot_ly(data = data, labels = ~ Categorie, values = ~ X1960, type = 'pie',
             # 图中文本显示的信息
             textposition = 'inside', 
             textinfo = 'label+percent', 
             insidetextfont = list(color = '#FFFFFF'), 
             # 图中交互模式下显示的文本信息
             hoverinfo = 'text', text = ~ paste('$', X1960, ' billions'),
             # 图的整体颜色(填充)、线条(颜色，宽度)设置
             marker = list(colors = colors, 
                           line = list(color = '#FFFFFF', width = 1)),
             # 是否显示图例
             showlegend = FALSE) %>%
    # 标题、坐标轴设置
    layout(title = 'United States Personal Expenditures by Categories in 1960', 
           xaxis = list(showgrid = T,       # 是否显示背景网络格
                        zeroline = T,       # 是否显示坐标轴线
                        showticklabels = T  # 是否显示坐标轴标签
           ), 
           yaxis = list(showgrid = T, zeroline = T, showticklabels = T))
p3
#============================================================
#                     Subplots
#============================================================
library(dplyr)

p4 = plot_ly() %>%
    add_pie(data = count(diamonds, cut), labels = ~ cut, values = ~ n,
            name = 'Cut', domain = list(x = c(0, 0.4), y = c(0.4, 1))) %>%
    add_pie(data = count(diamonds, color), labels = ~cut, values = ~n,
            name = "Color", domain = list(x = c(0.6, 1), y = c(0.4, 1))) %>%
    add_pie(data = count(diamonds, clarity), labels = ~cut, values = ~n,
            name = "Clarity", domain = list(x = c(0.25, 0.75), y = c(0, 0.6))) %>%
    layout(title = "Pie Charts with Subplots", showlegend = F,
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p4

#============================================================
#                     Donut Pie
#============================================================
# Get Manufacturer
mtcars$manuf <- sapply(strsplit(rownames(mtcars), " "), "[[", 1)

p5 <- mtcars %>%
    group_by(manuf) %>%
    summarize(count = n()) %>%
    plot_ly(labels = ~manuf, values = ~count) %>%
    add_pie(hole = 0.6) %>%
    layout(title = "Donut charts using Plotly",  showlegend = F,
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p5