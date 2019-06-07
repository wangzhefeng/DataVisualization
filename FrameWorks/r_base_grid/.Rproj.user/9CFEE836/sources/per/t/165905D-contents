#=====================================================
# Color
color() # 657 colors
rainbow(7)
heat.colors(7)
terrain.colors(7, alpha = 1)
topo.colors(7, alpha = 1)
cm.colors(7, alpha = 1)
#--------------------
barplot(rep(1, 7), col = rainbow(7), 
        main = "barplot(rep(1, 7), col = rainbow(7))")
barplot(rep(1, 7), col = heat.colors(7), 
        main = "barplot(rep(1, 7), col = heat.colors(7))")
barplot(rep(1, 7), col = terrain.colors(7, alpha = 1), 
        main = "barplot(rep(1, 7), col = terrain.colors(7, alpha = 1))")
barplot(rep(1, 7), col = topo.colors(7, alpha = 1), 
        main = "barplot(rep(1, 7), col = topo.colors(7, alpha = 1))")
barplot(rep(1, 7), col = cm.colors(7, alpha = 1), 
        main = "barplot(rep(1, 7), col = cm.colors(7, alpha = 1))")
par(mfrow = c(2, 2))
#-------------------
plot(women, col = 'red')

plot(women, col = 554)

plot(women, col = '#FF0000')

myColor = rgb(red = 255, green = 0, blue = 0, max = 255)
plot(women, col = myColor)

plot(women, 
     main = 'Height VS Weight Scatter',
     col.main = 'green',
     sub = 'data source: women dataset',
     col.sub = 'blue',
     col = 'red', 
     fg = 'blue', bg = 'green', 
     col.axis = 'grey', col.lab = 'yellow')
#=====================================================
# text
plot(0:4, type = "n", axes = F, xlab = NA, ylab = NA)
type = c("moren", "cuti", "xieti", "cuxieti")
for(i in 1:4) {
  text(2, 5 - i, 
       labels = paste0("font=", i, ":", type[i]), 
       font = i)
}

plot(0:5, type = "n", axes = F, xlab = NA, ylab = NA)
size = c(0.5, 0.8, 1, 1.5, 2)
for(i in 1:5) {
  text(2, i, 
       labels = paste0("cex=", size[i], ":", "fangda", size[i], "bei"), 
       cex = size[i])
}
#=====================================================
# point
plot(1, col = "white", 
     xlim = c(1, 7), ylim = c(1, 5), 
     main = "Point pch=", xlab = NA, ylab = NA)

for(i in c(0:25)) {
  x = (i %/% 5) * 1 + 1
  y = 6 - (i %% 5) - 1
  if(length(which(c(21:25) == i) >= 1)) {
    points(x, y, pch = i, col = "blue", bg = "yellow", cex = 2)
  } else {
    points(x, y, pch = i, cex = 2)
  }
  text(x + 0.2, y, labels = i)
} 

#=====================================================
# scatter plot
par(mfrow = c(1, 2))
plot(x = rnorm(10))
plot(women)
par(mfrow = c(1, 1))
#=====================================================
# scatter plot matrix
plot(iris[, 1:4], main = 'Scatter plot use plot() function')
pairs(iris[, 1:4], main = 'Scatter plot use pairs() function')
pairs(~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
      data = iris[, 1:4], 
      main = 'Scatter plot use pairs() function')
#=====================================================
# ballon plot
library(tidyverse)
diamonds1 = diamonds[sample(1:nrow(diamonds), 500), ]
attach(diamonds1)
volumn = x * y * z
size = (volumn - min(volumn)) / (max(volumn) - min(volumn))
plot(carat, price, cex = size * 3)

#
x = rnorm(10)
y = rnorm(10)
r = abs(rnorm(10))
symbols(x, y, r, bg = rainbow(10))

#=====================================================
# line plot
type = c('l', 'b', 'c', 'o', 's', 'S')
par(mfrow = c(2, 3))
for(i in type) {
  plot(1:10, type = i, main = paste0("type=", i))
}
par(mfrow = c(1, 1))


#=====================================================
# bar plot
par(mfrow = c(1, 2))
for(i in c(FALSE, TRUE)) {
  barplot(VADeaths, horiz = i, beside = TRUE, col = rainbow(5))
}
par(mfrow = c(1, 1))

barplot(VADeaths, horiz = FALSE, beside = TRUE, col = rainbow(5), legend.text = rownames(VADeaths))
#=====================================================
# pie plot 
pie(table(mtcars$cyl), labels = c('si', 'liu', 'ba'))

#=====================================================
# histogram plot and density plot
data(economics, package = "ggplot2")
par(mfrow = c(2, 2))
hist(x = economics$psavert, 
     breaks = 8, 
     xlab = 'personal psavert', 
     ylab = 'freq',
     col = 'blue',
     main = 'personal psavert histogram plot(less breaks)')
hist(x = economics$psavert, 
     breaks = 30, 
     xlab = 'personal psavert', 
     ylab = 'freq',
     col = 'blue',
     main = 'personal psavert histogram plot(more breaks)')
hist(x = economics$uempmed,
     breaks = 8, 
     xlab = 'uempmed average time in one week',
     ylab = 'freq',
     col = 'green',
     main = 'uempmed average time in one week(less breaks)')
hist(economics$uempmed, 
     breaks = 30, 
     xlab = 'uempmed average time in one week',
     ylab = 'freq',
     col = 'green',
     main = 'uempmed average time in one week(more breaks)')
par(mfrow = c(1, 1))


# density plot
plot(density(economics$psavert), col = 'red')
rug(economics$psavert, col = 'green')


#==========================================================
# Q-Q plot
qqnorm(economics$psavert)


#==========================================================
# box plot
boxplot(iris$Sepal.Length ~ iris$Species, col = rainbow(3))
#===========================================================
# stem and leaf plot
stem(mtcars$wt)
#===========================================================
# dot plot
dotchart(x = mtcars$mpg, labels = rownames(mtcars))
#===========================================================
# mosaic plot
ftable(Titanic)
mosaicplot(Titanic)

library(vcd)
mosaic(Titanic, shade = TRUE, legend = TRUE)
