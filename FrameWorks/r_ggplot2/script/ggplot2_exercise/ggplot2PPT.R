#http://docs.ggplot2.org/current/
library(ggplot2)
?mpg
View(mpg)
qplot(displ, hwy, data = mpg, color = class)
qplot(displ, hwy, data = mpg, size = class)
qplot(displ, hwy, data = mpg, shape = class)
qplot(displ, hwy, data = mpg, alpha = class)
qplot(displ, hwy, data = mpg, color = class, 
      size = class, shape = class, alpha = class)
qplot(displ, hwy, data = mpg) + facet_grid(. ~ cyl)
qplot(displ, hwy, data = mpg) + facet_grid(drv ~ .)
qplot(displ, hwy, data = mpg) + facet_grid(drv ~ cyl)
qplot(displ, hwy, data = mpg) + facet_grid(~ class)            #点的问题？？
qplot(displ, hwy, data = mpg) + facet_wrap(~ class)
qplot(displ, hwy, data = mpg, geom = "smooth")
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
qplot(class, hwy, data = mpg)
qplot(class, hwy, data = mpg, geom = "boxplot")
qplot(reorder(class, hwy), hwy, data = mpg, geom = "boxplot")   #新函数
qplot(reorder(class, hwy, FUN = median, order = is.ordered(class)),
      hwy, data = mpg, geom = "boxplot")

library(ggplot2)
data("diamonds")
View(diamonds)
qplot(x, z, data = diamonds)
qplot(z, data = diamonds)
qplot(cut, data = diamonds)                          #条形图和直方图的区别？？？？

qplot(cut, data = diamonds, geom = "bar", color = cut)
qplot(cut, data = diamonds, geom = "bar", fill = cut)

qplot(color, data = diamonds, geom = "bar", fill = cut)

qplot(color, data = diamonds, fill = cut, position = "stack")       #默认
qplot(color, data = diamonds, fill = cut, position = "dodge")
qplot(color, data = diamonds, fill = cut, position = "identity")
qplot(color, data = diamonds, fill = cut, position = "fill")

qplot(cty, hwy, data = mpg)
qplot(cty, hwy, data = mpg, position = "jitter")
qplot(cty, hwy, data = mpg, geom = "jitter")
qplot(cty, hwy, data = mpg, geom = "jitter", position = "jitter")
qplot(cty, hwy, data = mpg, geom = "jitter")

qplot(carat, data = diamonds, binwidth = 1)
qplot(carat, data = diamonds, binwidth = 0.1)
qplot(carat, data = diamonds, binwidth = 0.01)
qplot(carat, data = diamonds)

zoom <- coord_cartesian(xlim = c(55,70))
qplot(depth, data = diamonds, binwidth = 0.2) + zoom
qplot(depth, data = diamonds, binwidth = 0.2, fill = cut) + zoom
qplot(depth, data = diamonds, binwidth = 0.2) + zoom + facet_wrap(~ cut)
qplot(depth, data = diamonds, binwidth = 0.2, geom = "freqpoly", color = cut) + zoom + facet_wrap(~ cut)
qplot(depth, data = diamonds, binwidth = 0.2, geom = "freqpoly", color = cut) + zoom
qplot(depth, data = diamonds, geom = "density", color = cut) + zoom
qplot(price, data = diamonds, binwidth = 500) + facet_wrap(~ cut)
qplot(price, data = diamonds, binwidth = 500, fill = cut)
qplot(price, data = diamonds, binwidth = 500, geom = "freqpoly", color = cut)
qplot(price, data = diamonds, geom = "density", color = cut)

qplot(carat, price, data = diamonds, color = cut)
qplot(carat, price, data = diamonds, geom = "bin2d")
qplot(carat, price, data = diamonds, geom = "hex")
qplot(carat, price, data = diamonds, geom = "density2d")
qplot(carat, price, data = diamonds, geom = c("point", "density2d"))
qplot(carat, price, data = diamonds, geom = "smooth")
qplot(carat, price, data = diamonds, geom = "smooth", 
      color = cut)
qplot(carat, price, data = diamonds, geom = "smooth", 
      group = cut)
qplot(carat, price, data = diamonds, geom = "smooth", 
      color = cut, se = FALSE)
qplot(carat, price, data = diamonds, geom = "smooth", 
      color = cut, method = lm)

qplot(carat, price, data = diamonds, color = "blue")
qplot(carat, price, data = diamonds, color = I("blue"))

qplot(carat, price, data = diamonds)
qplot(carat, price, data = diamonds, size = I(0.5))

qplot(carat, price, data = diamonds, alpha = I(0.1))
qplot(carat, price, data = diamonds, alpha = I(0.1), size = I(0.5))
ggsave("my-plot.pdf")
ggsave("my-plot.png")
ggsave("my-plot.pdf", width = 6, height = 6)
#####-------------------------------------------------------------------------------------
setwd("F:/重要内容/文档/书、资料/R/Rxuexi/Intro-to-R/Day 1/data")
texas <- read.csv("texas.csv")
View(texas)
head(texas)

qplot(long, lat, data = texas)

qplot(long, lat, data = texas, geom = "polygon", group = group)

texas2 <- borders[sample(nrow(texas)), ]
qplot(long, lat, data = texas2, geom = "polygon", group = group)

library(maps)

counties <- map_data("world")
qplot(long, lat, data = counties, geom = "polygon", 
      group = group,fill = group)

counties <- map_data("county")
qplot(long, lat, data = counties, geom = "polygon", 
      group = group,fill = group)


tx <- qplot(long, lat, data = texas, geom = "polygon", 
            group  = group, fill = bin)
tx
#Title-------------------------------
tx + ggtitle("Population of Texas Counties")
tx2 <- tx + ggtitle("Population of Texas Counties")
tx2

#Manipulating plots-----------------
cp <- qplot(carat, price, data = diamonds)
cp
class(cp)
#Coordinate systems-----------------
cp <- cp + coord_cartesian()           #默认
cp1
cp1$coordinates

cp2 <- cp + coord_polar()          
cp2
cp2$coordinates

cp3 <- cp + coord_flip()
cp3

cp4 <- cp + coord_fixed(ratio = 1/10000)
cp4

cp5 <- cp + coord_trans(ytrans = "log10")
cp5
cp6 <- cp + coord_trans(ytrans = "log10", xtrans = "log10")
cp6

cp7 <- cp + coord_cartesian(ylim = c(1, 5000), xlim = c(0, 1))
cp7

tx3 <- tx + coord_map()                      #需要下载mapproj包
tx3
#饼图------------------------------------
d2 <- subset(diamonds, color == "D")
d2
cc <- qplot(color, data = d2, fill = cut, position = "fill")
cc
cc + coord_polar(theta = "y")
#Scales------------------------------------------------------------------
scale_aesthetic_name()

hd <- qplot(displ, hwy, data =mpg, color = class, shape = class)
hd

hd2 <- qplot(displ, hwy, data =mpg, color = cty)
hd2
hd2 + scale_color_gradient(low = "red", high = "yellow")

hd3 <- qplot(displ, hwy, data =mpg, size = cyl)
hd3
hd3 + scale_size_area()

hd4 <- qplot(displ, hwy, data = mpg, shape = fl)
hd4
hd4 + scale_shape_manual(values = c(0, 15, 1, 16, 3))
r <- qplot(displ, cty, colour = drv, shape = fl, data = mpg)
r
r + scale_shape_manual(values = c(0, 15, 1, 16, 3))

scale_color_brewer(palette = "")
scale_color_manual(values = c())
scale_color_hue(h, c, l)
scale_color_grey()
scale_color_gradient(low, high)
scale_color_gradient2(low, mid, high, midpoint)
scale_color_gradientn(colours)

scale_fill_brewer(palette = "")
scale_fill_manual(values = c())
scale_fill_hue(h, c, l)
scale_fill_grey()
scale_fill_gradient(low, high)
scale_fill_gradient2(low, mid, high, midpoint)
scale_fill_gradientn(colours)

library(RColorBrewer)
display.brewer.all()
##Themes-----------------------------------------------------------
tx + theme_grey()    #默认
tx + theme_bw()      #白色
tx + theme(panel.border = element_rect(colour = "black", fill = NA))

library(ggthemes)
p <- qplot(color, data = diamonds, fill = cut, position = "dodge")
p

p + theme_excel()     +     scale_fill_excel()
p + theme_economist() +     scale_fill_economist()
p + theme_few()       +     scale_fill_few()
p + theme_solarized() +     scale_fill_solarized()
p + theme_stata()     +     scale_fill_stata()
p + theme_tufte()     +     scale_fill_tableau()
p + theme_gdocs()     +     scale_fill_gdocs()
p + theme_wsj()       +     scale_fill_wsj(palette = "black_green")
###Axis labels----------------------------------------------------------
p + ylab("Price in Dollars ($)")
p + ylab("")

tx + scale_fill_brewer(palette = "Blues") +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("Population of Texas Counties")
###Legends------------------------------------------------------------------
q <- qplot(displ, hwy, data = mpg, color = cty)
q
#change position
q + theme(legend.position = "bottom")   # “bottom”, “top”, “left”, “right”
#change type
q + guides(color = "colorbar")
q + guides(color = "legend")
q + guides(color = "none")
#cahnge labels
tx + scale_fill_grey(name = "Legend")
tx + scale_fill_grey(name = "Legend", 
                     labels = c("label 1", "label 2", "label 3","label 4", "label 5"))
scale_aesthetic_continuous
scale_aesthetic_discrete
tx + scale_fill_discrete(name = "Legend name")

tx + scale_fill_brewer(
  palette = "Blues",
  name = "Population",
  labels = c("0 - 999", "1,000 - 9,999",
             "10,000 - 99,999", "100,000 - 999,999",
             "1,000,000+")) +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("Population of Texas Counties")


library(extrafont)
loadfonts()

  p + scale_fill_grey() +
  ggtitle("Made with extrafont") +
  theme(text = element_text(size=16,
                            family = "Orbitron",
                            colour = "red"))
  ggsave("fonttest-orbitron.pdf")
embed_fonts("fonttest-orbitron.pdf")

install.packages("extrafont")
install.packages("GGally")
install.packages("ggbio")
install.packages("ggmcmc")
install.packages("ggsubplot")
