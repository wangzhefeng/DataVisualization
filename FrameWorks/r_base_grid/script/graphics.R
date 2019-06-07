# 第一章


#====================================================
#           传统绘图系统
#====================================================
# 第二章

# plot
## 散点图
plot(pressure)
plot(pressure$temperature, pressure$pressure)
plot(pressure ~ temperature, data = pressure)
## 散点图变形
set.seed(123)
y <- rnorm(20)
plot(y, type = "p") # point
plot(y, type = "l") # line
plot(y, type = "b") # both
plot(y, type = "h") # histgoram
## "lm"对象
lmfit <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)
par(mfrow = c(2, 2))
plot(lmfit)
## "agnes"对象
subset <- sample(1:150, 20)
cS <- as.character(Sp <- iris$Species[subset])
cS[Sp == "setosa"] <- "S"
cS[Sp == "versicolor"] <- "V"
cS[Sp == "virginica"] <- "g"
library(cluster)
ai = agnes(iris[subset, 1:4])
plot(ai, labels = cS)

# 单变量绘图
var <- iris$Sepal.Length
plot(var)
plot(factor(var))
plot(table(var))
barplot(var)
pie(1:5)
dotchart(rnorm(10))
boxplot(var)
hist(var)
stripchart(var) # 一维散点图 plot(~var)
stem(var)       # 茎叶图

# 双变量绘图
var1 <- iris$Sepal.Length
var2 <- iris$Sepal.Width
mat <- matrix(iris$Sepal.Length, ncol = 15)
plot(var1, var2)
plot(var1, factor(var2))
plot(factor(var1), var2)
plot(factor(var1), factor(var2))
plot(table())
sunflowerplot(var1, var2)
smoothScatter(var1, var2)
boxplot(list(var1, var2))
barplot(mat)
dotchart(mat)

mosaicplot(table())

# 多变量绘图
var1 <- iris$Sepal.Length
var2 <- iris$Sepal.Width
var3 <- iris$Petal.Length
matplot(mat)
persp(sort(var1), sort(var2), sort(var3))


