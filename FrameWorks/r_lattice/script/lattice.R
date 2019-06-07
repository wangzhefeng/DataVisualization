# lattice
if(!require(lattice)) install.packages('lattice')
names(trellis.par.get())

# scatter plot 
data = data.frame(x = seq(0, 14),
                  y = seq(1:15),
                  z = rep(c('a', 'b', 'c'), times = 5))
xyplot(y ~ x, data = data)
show.settings()

# trellis parameter setting
op = trellis.par.get()
trellis.par.get('axis.text')
trellis.par.set(list(axis.text = list(cex = 1.5, col = 'blue')))
xyplot(y ~ x, data = data)
trellis.par.set(op)
show.settings()

#  setting
op = trellis.par.get()
xyplot(y ~ x, groups = z, data = data)
mysetting = trellis.par.get()
mysetting$superpose.symbol$col
mysetting$superpose.symbol$pch
mysetting$superpose.symbol$pch = 1:10
mysetting$superpose.symbol$col = 'black'
trellis.par.set(mysetting)
xyplot(y ~ x, groups = z, data = data)
trellis.par.set(op)

# condition variable
xyplot(y ~ x|z, data = data, layout = c(3, 1))

# panel.abline()
mypanel = function(...) {
  panel.abline(a = 1, b = 1)
  panel.xyplot(...)
}

xyplot(y ~ x|z, data = data, layout = c(3, 1), panel = mypanel)

# group variable
densityplot(~ mpg, data = mtcars, 
            lty = 1:2, col = 1:2, lwd = 2,
            groups = factor(am), 
            main = list("MPG Distribution by Tranamission Type", cex = 1.5),
            xlab = "Miles per Gallon",
            key = list(column = 2, 
                       space = "bottom",
                       title = "Transmission (0 = automatic, 1 = manual)",
                       text = list(levels(factor(mtcars$am))),
                       lines = list(lty = 1:2, col = 1:2, lwd = 2)))


# position setting
graph1 = xyplot(mpg ~ wt, data = mtcars, 
                xlab = "Weight", 
                ylab = "Miles Per Gallon")
displacement = equal.count(mtcars$disp, number = 3, overlap = 0)
graph2 = xyplot(mpg ~ wt|displacement, data = mtcars, layout = c(3, 1),
                xlab = "Weight", 
                ylab = "Miles Per Gallon")
plot(graph1, split = c(1, 1, 2, 1))
plot(graph2, split = c(2, 1, 2, 1), newpage = FALSE)

plot(graph1, position = c(0, 0, 0.5, 1))
plot(graph2, position = c(0.5, 0, 1, 1), newpage = FALSE)


# bar chart






