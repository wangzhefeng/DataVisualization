library(ggplot2)
library(plotly)

# A Hello World Figure
p = plot_ly(x = rnorm(1000), y = rnorm(1000),
            mode = 'markers')
p
plotly_POST(p)
#################################################################
# Basic Charts 
## line plots
p = plot_ly(x = c(1, 2, 3), y = c(5, 6, 7), 
            type = 'scatter',
            mode = 'lines')
p
plotly_POST(p)

## Scatter Plots
p = plot_ly(x = c(1, 2, 3), y = c(5, 6, 7),
            type = 'scatter',
            mode = 'markers')
p
plotly_POST(p)

## Bar Charts 
p = plot_ly(x = c(1, 2, 3), y = c(5, 6, 7), 
            type = 'bar', 
            mode = 'markers')
p
plotly_POST(p)

## Bubble Charts(气泡图)
p = plot_ly(x = c(1, 2, 3), y = c(5, 6, 7),
            type = 'scatter',
            mode = 'markers', 
            size = c(1, 5, 10),
            marker = list(
                color = c('red', 'blue', 'green')
            ))
p
plotly_POST(p)

## Heatmaps
p = plot_ly(z = volcano, 
            type = 'heatmap')
p
plotly_POST(p)

## Area Plots
p = plot_ly(x = c(1, 2, 3), y = c(5, 6, 7), 
            type ='scatter', 
            mode = 'line', 
            fill = 'tozeroy')
p
plotly_POST(p)
#############################################################
# Layout
## Legends
set.seed(123)
x = 1:100
y1 = 2*x + rnorm(100)
y2 = -2*x + rnorm(100)

p = plot_ly(x = x, y = y1,
            type = 'scatter') %>%
    add_trace(x = x, y = y2) %>%
    layout(legend = list(x = 0.5, 
                         y = 1, 
                         bgcolor = '#F3F3F3'))
p 
plotly_POST(p)

## Axex
set.seed(123)
x = 1:100
y1 = 2*x + rnorm(100)
y2 = -2*x + rnorm(100)

xaxis_template = list(
    showgrid = T,   # 是否显示网格
    zeroline = T,   # 是否显示坐标轴Y轴
    nticks = 20,    # 坐标轴刻度间隔调节
    showline = T,   # 是否显示图像外边框
    title = 'X-AXIS',# 坐标轴标记名
    mirror = 'all') # 
yaxis_template = list(
    showgrid = T, 
    zeroline = T,
    nticks = 20,
    showline = T,
    title = 'Y-AXIS',
    mirror = 'all')
p = plot_ly(x = x, y = y1, 
            type = 'scatter') %>%
    add_trace(x = x, y = y2) %>%
    layout(xaxis = xaxis_template,
           yaxis = yaxis_template,
           legend = list(x = 0.8, y = 0.8,
                         bgcolor = '#F3F3F3'))
p
plotly_POST(p)
###################################
# Statistic Charts
## Histograms
x = rchisq(100, 5, 0)
p = plot_ly(x = x, 
            type ='histogram')
p
plotly_POST(p)

## Box Plots 
p = plot_ly(y = rnorm(50), 
            type = 'box') %>%
    add_trace(y = rnorm(50, 1))
p
plotly_POST(p)

## 2d-Histogram
p = plot_ly(x = rnorm(1000, sd = 2), y = rnorm(1000, sd = 5),
            type = 'histogram2d')
p

plot_ly(x = rnorm(1000, sd = 10), 
        y = rnorm(1000, sd = 5),
        type = 'histogram2d')
plotly_POST(p)

#######################################################
# Maps 
## Bubble Map
p = plot_ly(type = 'scattergeo',
            lon = c(-73.5, 151.2),
            lat = c(45.5, -33.8),
            marker = list(
                color = c('red', 'blue'),
                size = c(30, 50),
                mode = 'markers')
            )
p
plotly_POST(p)
## Choropleth Map
p = plot_ly(type = 'choropleth',
            locations = c('AZ', 'CA', 'VT'),
            locationmode = 'USA-states',
            colorscale = 'Viridis',
            z = c(10, 20, 40)) %>%
    layout(geo = list(scope = 'usa'))
p
plotly_POST(p)
## Scatter Map 
p = plot_ly(type = 'scattergeo',
            lon = c(42, 39),
            lat = c(12, 22),
            text = c('Rome', 'Greece'),
            mode = 'markers')
p
plotly_POST(p)

###############################################################
# 3D Charts 
## 3D Surface Plots
p = plot_ly(type = 'surface',
            z = ~ volcano)
p
plotly_POST(p)
## 3D line PLots
p = plot_ly(type = 'scatter3d', 
            x = c(9, 8, 5, 1),
            y = c(1, 2, 4, 8),
            z = c(11, 8, 15, 3),
            mode = 'lines')
p
plotly_POST(p)

## 3D Scatter Plots 
p = plot_ly(type = 'scatter3d', 
            x = c(9, 8, 5, 1),
            y = c(1, 2, 4, 8),
            z = c(11, 8, 15, 3),
            mode = 'markers')
p
plotly_POST(p)

################################################################################
# Figure Hierarchy
# p = plot_ly()-------------------------------------------
#           data = data.frame()           数据
#           x = ~ c()                       X轴数据
#           y = ~ c()                       Y轴数据
#           z = ~ c()                       Z轴数据
#           name = ''                     坐标轴(图例)标签
#           type = ''
#           mode = ''
#           orientation = 'h'
#           marker = list()
#               color = ''
#               line = list()
#                   color = ''
#                   width = number
#           color = c()                   颜色
#           text = c()                    标签
#           size = c()                    尺寸
#           colorscale = 'string'/c()      
#               markers = list()
#                   color = 'string'
#                   symbol = list()
#               line = list()
#                   color = 'string'
#                   width = number
#     add_trace()-------------------------------------------
#           
#     add_bars()
#           y = ~c()
#           name = ''
#     layout()--------------------------------------------------
#           title = 'string'             标题
#           xaxis = list()               X轴
#               title = ''
#           yaxis = list()               Y轴
#               titel = ''
#           zaxis = list()               Z轴
#               title = ''
#           barmode = ''
#           scenelist()                  
#               xaxis = list()           
#               yaxis = list()
#               zaxis = list()
#           geo = list()
#           legend = list()             图例
#     add_annotations = list()        
#==========================================
#     c() = array
#     list() = list
#     'string' = string
#     123 = number
    