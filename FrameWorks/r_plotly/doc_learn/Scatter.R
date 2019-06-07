#########################################################
#                Scatter and line plot
#########################################################
library(plotly)
packageVersion('plotly')
#========================================================
#                   A Example 
#========================================================
## Styled Scatter Plot
p5 = plot_ly(data = iris, 
             x = ~Sepal.Length, 
             y = ~Petal.Length, 
             marker = list(size = 10, 
                           color = 'rgba(255, 182, 193, 0.9)', 
                           line = list(color = 'rgba(152, 0, 0, 0.8)', 
                                       width = 2))) %>%
    layout(title = 'Styled Scatter', 
           xaxis = list(zeroline = FALSE), 
           yaxis = list(zeroline = FALSE))
p5
#========================================================
#                 Basic scatter plot
#========================================================
p1 = plot_ly(data = iris, 
             x = ~ Sepal.Length, 
             y = ~ Petal.Length)
p1
p2 = plot_ly(data = iris, 
             x = ~ Sepal.Length, 
             y = ~ Petal.Length, 
             type = 'scatter', 
             mode = 'marker')
p2
p3 = plot_ly(data = iris, 
             x = ~ Sepal.Length, 
             y = ~ Petal.Length) %>%
    add_trace(type = 'scatter', 
              mode = 'marker')
p3
p4 = plot_ly(data = iris, 
             x = ~ Sepal.Length, 
             y = ~ Petal.Length) %>%
    add_trace(type = 'scatter') %>%
    layout(title = 'Scatter Plot', 
           xaxis = list(zeroline = F),
           yaxis = list(zeroline = F))
p4
#========================================================================
#                         Markers and Lines
#========================================================================
## Plotting Markers and Lines
data = data.frame(x = 1:100, 
                  trace_0 = rnorm(100, mean = 5),
                  trace_1 = rnorm(100, mean = 0),
                  trace_2 = rnorm(100, mean = -5))

p6 = plot_ly(data = data, 
             x = ~x) %>%
    add_trace(y = ~ trace_0, name = 'trace 0', mode = 'markers') %>%
    add_trace(y = ~ trace_1, name = 'trace 1', mode = 'lines') %>%
    add_trace(y = ~ trace_2, name = 'trace 2', mode = 'lines+markers') %>%
    layout(title = 'Scatter with Markers and Lines')
p6
#=======================================================================
#                            Color 
#=======================================================================

## Qualitative Colorscales
p7 = plot_ly(data = iris, 
             x = ~ Sepal.Length, y = ~ Petal.Length, 
             color = ~Species)
p7
## ColorBrewer Palette Names
p8 = plot_ly(data = iris, 
             x = ~ Sepal.Length, y = ~ Petal.Length, 
             color = ~ Species, colors = 'Set1')
p8
## Custom Color Scales
pal = c('red', 'blue', 'green')
p9 = plot_ly(data = iris, 
             x = ~ Sepal.Length, y = ~ Petal.Length, 
             color = ~ Species, colors = pal)
p9

pal = setNames(pal, c('setosa', 'versicolor',  'virginica')) 
p10 = plot_ly(data = iris, 
              x = ~ Sepal.Length, y = ~ Petal.Length, 
              color = ~ Species, colors = pal)
p10

#===========================================================
#                       Mapping Data to Symbols
#===========================================================
p11 = plot_ly(data = iris, 
              x = ~ Sepal.Length, y = ~ Petal.Length, 
              type = 'scatter', mode = 'markers', 
              symbol = ~ Species, symbols = c('circle', 'o', 'x'),
              color = ~ I('black'), 
              marker = list(size = 10))
p11

p12 = plot_ly(data = iris, 
              x = ~ Sepal.Length, y = ~ Petal.Length, 
              type = 'scatter', mode = 'markers', 
              symbol = ~ Species, symbols = c('circle', 'o', 'x'),
              color = ~ Species, colors = 'Set1', 
              marker = list(size = 10))
p12
#===========================================================
#                 Adding Color and Size Mapping
#===========================================================
data2 = diamonds[sample(nrow(diamonds), 1000), ]
p13 = plot_ly(data = data2, 
              x = ~ carat, y = ~ price, 
              color = ~ carat, size = ~ carat)
p13
#===========================================================
#                  Data Labels on Hover
#===========================================================
p14 = plot_ly(data = data2, 
              x = ~ carat, y = ~ price,
              color = ~ carat, size = ~ carat,
              text = ~ paste('Price: ', price, '$<br>Cut: ', cut))
p14




