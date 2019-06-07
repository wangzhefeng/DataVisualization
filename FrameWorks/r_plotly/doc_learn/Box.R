#################################################################
##                      Box plot in R
#################################################################
library(plotly)
# Sys.setenv("plotly_username"="zfwang")
# Sys.setenv("plotly_api_key"="nVfgG8nQ9TryDkGoBTeX")
# plotly_POST(p, filename = "r-docs/midwest-boxplots")


## First box plot
p1 = plot_ly(data = midwest, x = ~ percollege, color = ~ state, type = 'box')
p2

## 
