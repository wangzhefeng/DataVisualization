# ======================================================================
# scatterD3
# ======================================================================
if(!require(scatterD3)) install.packages("scatterD3")
mtcars$names = rownames(mtcars)
mtcars
scatterD3(data = mtcars, x = wt, y = mpg, 
          lab = names,
          col_var = cyl, col_lab = "Cylinders",
          xlab = "Weight", ylab = "Mpg", 
          symbol_var = am, symbol_lab = "Manual transmission")
# ======================================================================
# timevis
# ======================================================================
if(!require(timevis)) install.packages("timevis")
data = data.frame(id = 1:4,
                  content = c("Thing 1", "Thing 2", "Thing 3", "Thing 4"),
                  start = c("2017-11-01", "2017-11-07", "2017-11-15", "2017-11-30 12:00:00"), 
                  end = c(NA, NA, "2017-11-20", NA))
timevis(data)

# ======================================================================
# rpivotTable
# ======================================================================
if(!require(rpivotTable)) devtools::install_github(c("ramnathv/htmlwidgets", "smartinsightsfromdata/rpivotTable"))
mtcars$vs = factor(ifelse(mtcars$vs == 0, "zidong", "shoudong"))
colnames(mtcars)[8] = "chuangshu"
rpivotTable(mtcars)

