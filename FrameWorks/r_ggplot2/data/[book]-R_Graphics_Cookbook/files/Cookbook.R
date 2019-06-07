## R Graphics Cookbook
library(ggplot2)
library(gcookbook)
library(plyr)
library(dplyr)
library(MASS)
######################################################
## 1.
## Read data
#read.table()
#read.csv()
# library(xlsx)
#read.xlsx()
# library(gdata)
#read.xls()
# library(foreign)
#read.spss()   # SPSS data
#read.octave() # Matlab data
#read.xport()  # SAS data
#####################################################
## 2.
## 2.1
plot(mtcars$wt, mtcars$mpg)
# plot(mtcars$mpg)
# plot(mtcars$gear)
qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data = mtcars)
ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point()
## 2.2
plot(pressure$temperature, pressure$pressure)

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure/2, col = "red")
points(pressure$temperature, pressure$pressure/2, col = "red")

qplot(temperature, pressure, data = pressure, geom = "line")
qplot(temperature, pressure, data = pressure, geom = c("line", "point"))

ggplot(data = pressure, aes(x = temperature, y = pressure)) + 
    geom_line()
ggplot(data = pressure, aes(x = temperature, y = pressure)) + 
    geom_line() + 
    geom_point()

## 2.3
barplot(BOD$demand, names.arg = BOD$Time)
barplot(BOD$demand)

table(mtcars$cyl)
barplot(table(mtcars$cyl))
# barplot(mtcars$cyl)

qplot(x = Time, y = demand, 
      data = BOD, 
      geom = "bar", 
      stat = "identity")
ggplot(data = BOD, aes(x = Time, y = demand)) + 
    geom_bar(stat = "identity")
qplot(x = factor(Time), y = demand, 
      data = BOD, 
      geom = "bar", 
      stat = "identity")


qplot(cyl, data = mtcars)
qplot(factor(cyl), data = mtcars)
ggplot(data = mtcars, aes(x = factor(cyl))) + 
    geom_bar()

## 2.4
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10)

qplot(mpg, data = mtcars)
qplot(mpg, data = mtcars, binwidth = 4)
ggplot(data = mtcars, aes(mpg)) + 
    geom_histogram(binwidth = 4)

## 2.5
plot(ToothGrowth$supp, ToothGrowth$len)
boxplot(len ~ supp, data = ToothGrowth)
boxplot(len ~ supp + dose, data = ToothGrowth)

qplot(x = supp, y = len, data = ToothGrowth, geom = "boxplot")
ggplot(data = ToothGrowth, aes(x = supp, y = len)) +
    geom_boxplot()

qplot(x = interaction(supp, dose), y = len, 
      data = ToothGrowth, 
      geom = "boxplot")
ggplot(data = ToothGrowth, aes(x = interaction(supp, dose), y = len)) + 
    geom_boxplot()

## 2.6
curve(x^3 + 5*x, from = -4, to = 4)

myfun <- function(xvar) {
    1/(1 + exp(-xvar + 10))
}
curve(myfun(x), from = 0, to = 20)
curve(1-myfun(x), add = TRUE, col = "red")

qplot(c(0, 20), fun = myfun, stat = "function", geom = "line")
ggplot(data = data.frame(x = c(0, 20)), aes(x = x)) + 
    stat_function(fun = myfun, geom = "line")
#########################################################################
## 3.
## 3.1
library(gcookbook)
ggplot(data = pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = "identity")

ggplot(data = pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = "identity", fill = "lightblue", colour = "black")


BOD
str(BOD)
ggplot(BOD, aes(x = Time, y = demand)) + geom_bar(stat = "identity")
ggplot(BOD, aes(x = factor(Time), y = demand)) + geom_bar(stat = "identity")

## 3.2
library(gcookbook)
cabbage_exp
#####################################################################
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(position = "dodge")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity")
####################################################################
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(position = "dodge", colour = "black") + 
    scale_fill_brewer(palette = "Pastel1")



qplot(color, data = diamonds, geom = "bar", fill = cut, position = "dodge")

ggplot(data = diamonds, aes(x = color, fill = cut)) + 
    geom_bar(position = "dodge", colour = "black", linestyle = "1") +
    scale_fill_brewer(palette = "Pastel1")

## 3.3
ggplot(data = diamonds, aes(x = cut)) + 
    geom_bar()
ggplot(data = diamonds, aes(x = cut)) + 
    geom_bar(stat = "bin")

ggplot(data = diamonds, aes(x = carat)) +
    geom_bar()
ggplot(data = diamonds, aes(x = carat)) + 
    geom_histogram()

## 3.4
library(gcookbook) # For the data set
upc <- subset(uspopchange, rank(Change) > 40)
upc
ggplot(upc, aes(x = Abb, y = Change, fill = Region)) + 
    geom_bar(stat = "identity")

ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) + 
    geom_bar(stat = "identity", colour = "black") + 
    scale_fill_manual(values = c("#669933", "#FFCC66")) +
    xlab("State")

## 3.5
library(gcookbook) # For the data set
csub <- subset(climate, Source == "Berkeley" & Year >= 1900)
csub$pos <- csub$Anomaly10y >= 0
csub
ggplot(data = csub, aes(x = Year, y = Anomaly10y, fill = pos)) +
    geom_bar(stat = "identity", position = "identity")

ggplot(data = csub, aes(x = Year, y = Anomaly10y, fill = pos)) +
    geom_bar(stat = "identity", position = "identity", colour = "black", size = 0.25) +
    scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"), guide = FALSE)

## 3.6
library(gcookbook) # For the data set
head(pg_mean)
ggplot(pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat="identity")

ggplot(pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = "identity", width = 0.9)

ggplot(pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = "identity", width = 0.5)

ggplot(pg_mean, aes(x = group, y = weight)) + 
    geom_bar(stat = "identity", width = 1)


ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity", width = 0.5, position = "dodge")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.7))

## The same 
# geom_bar(position="dodge")
# geom_bar(width=0.9, position=position_dodge())
# geom_bar(position=position_dodge(0.9))
# geom_bar(width=0.9, position=position_dodge(width=0.9))

## 3.7
ggplot(data = cabbage_exp, aes(x = Date, y = Weight)) + 
    geom_bar(stat = "identity")

ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity")

ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity") +
    guides(fill = guide_legend(reverse = TRUE))

library(plyr)
ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar, order = desc(Cultivar))) + 
    geom_bar(stat = "identity")

ggplot(data = cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity", colour = "black") + 
    guides(guide_legend(reverse = TRUE)) + 
    scale_fill_brewer(palette = "Pastel1")

## 3.8

library(plyr)
ce = ddply(cabbage_exp, "Date", transform, percent_weight = Weight / sum(Weight)*100)
ggplot(ce, aes(x = Date, y = percent_weight, fill = Cultivar)) + 
    geom_bar(stat = "identity")
ggplot(ce, aes(x = Date, y = percent_weight, fill = Cultivar)) + 
    geom_bar(stat = "identity", colour = "black") +
    guides(fill = guide_legend(reverse = TRUE)) + 
    scale_fill_brewer(palette = "Pastel1")

## 3.9
# Below the top
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) + 
    geom_bar(stat = "identity") + 
    geom_text(aes(label = Weight), vjust = 1.5, colour = "white")

# Above the top
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) + 
    geom_bar(stat = "identity") + 
    geom_text(aes(label = Weight), vjust = -0.2)

# Adjust y limits to be a little higher
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) + 
    geom_bar(stat = "identity") + 
    geom_text(aes(label = Weight), vjust = -0.2) + 
    ylim(0, max(cabbage_exp$Weight) * 1.05)

# Map y positions slightly above bar top - y range of plot will auto-adjust
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) + 
    geom_bar(stat = "identity") + 
    geom_text(aes(y = Weight+0.1, label = Weight))

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity", position = "dodge") + 
    geom_text(aes(label = Weight), 
              vjust = 1.5, 
              colour = "white", 
              position = position_dodge(0.9), 
              size = 3)

library(plyr)
ce = arrange(cabbage_exp, Date, Cultivar)
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight))
ce
ggplot(data = ce, aes(x = Date, y = Weight, fill = Cultivar)) +
    geom_bar(stat = "identity") + 
    geom_text(aes(y = label_y, label = Weight), vjust = 1.5, colour = "white")

ce <- arrange(cabbage_exp, Date, Cultivar)
# Calculate y position, placing it in the middle
ce <- ddply(ce, "Date", transform, label_y = cumsum(Weight) - 0.5*Weight)
ggplot(data = ce, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity") +
    geom_text(aes(y = label_y, label = Weight), colour = "white")

ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) + 
    geom_bar(stat = "identity", colour = "black") +
    geom_text(aes(y = label_y, 
                  label = paste(format(Weight, nsmall = 2), "kg")), 
              size = 4) + 
    guides(fill = guide_legend(reverse = TRUE)) + 
    scale_fill_brewer(palette = "Pastel1")

## 3.10
library(gcookbook)
tophit <- tophitters2001[1:25, ] 
ggplot(tophit, aes(x = avg, y = name)) + geom_point()

ggplot(tophit, aes(x = avg, y = reorder(name, avg))) + 
    geom_point(size = 3) + 
    theme_bw() +
    theme(panel.grid.major.x = element_blank(), 
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(colour = "grey60",
                                            linetype = "dashed"))

ggplot(tophit, aes(x = reorder(name, avg), y = avg)) + 
    geom_point(size = 3) + 
    theme_bw() +
    theme(axis.text.x = element_text(angle = 60, hjust = 1), 
          panel.grid.major.y = element_blank(), 
          panel.grid.minor.y = element_blank(),
          panel.grid.major.x = element_line(colour = "grey60",
                                            linetype = "dashed"))

# Get the names, sorted first by lg, then by avg
nameorder <- tophit$name[order(tophit$lg, tophit$avg)]
# Turn name into a factor, with levels in the order of nameorder
tophit$name <- factor(tophit$name, levels = nameorder)
ggplot(tophit, aes(x = avg, y = name)) + 
    geom_segment(aes(yend = name), xend = 0, colour = "grey50") + 
    geom_point(size = 3, aes(colour = lg)) + 
    scale_colour_brewer(palette = "Set1", limits = c("NL","AL")) + 
    theme_bw() + 
    theme(panel.grid.major.y = element_blank(), # No horizontal grid lines 
          legend.position = c(1, 0.55), # Put legend inside plot area 
          legend.justification = c(1, 0.5))

ggplot(tophit, aes(x = avg, y = name)) +
    geom_segment(aes(yend = name), xend = 0, colour = "grey50") + 
    geom_point(size = 3, aes(colour = lg)) +
    scale_colour_brewer(palette = "Set1", limits = c("NL","AL"), guide = FALSE) + 
    theme_bw() + 
    theme(panel.grid.major.y = element_blank()) + 
    facet_grid(lg ~ ., scales = "free_y", space = "free_y")


#############################################################################
#############################################################################
## 4.
## 4.1
ggplot(data = BOD, aes(x = Time, y = demand)) + 
    geom_line()

BOD1 = BOD
BOD1$Time = factor(BOD$Time)
ggplot(data = BOD1, aes(x = Time, y = demand, group = 1)) + 
    geom_line()

ggplot(data = BOD, aes(x = Time, y = demand)) + 
    geom_line() + 
    ylim(0, max(BOD$demand))

ggplot(data = BOD, aes(x = Time, y = demand)) +
    geom_line() + 
    expand_limits(y = 0)

## 4.2
ggplot(data = BOD, aes(x = Time, y = demand)) +
    geom_line() + 
    geom_point()

library(gcookbook)
ggplot(data = worldpop, aes(x = Year, y = Population)) + 
    geom_line() +
    geom_point()
ggplot(data = worldpop, aes(x = Year, y = Population)) +
    geom_line() + 
    geom_point() +
    scale_y_log10()

## 4.3
library(plyr)
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))

ggplot(data = tg, aes(x = dose, y = length, colour = supp)) + 
    geom_line()

ggplot(data = tg, aes(x = dose, y = length, linetype = supp)) +
    geom_line()

ggplot(data = tg, aes(x = factor(dose), y = length, colour = supp, group = supp)) + 
    geom_line()

ggplot(tg, aes(x = dose, y = length)) + geom_line()

ggplot(data = tg, aes(x = dose, y = length, shape = supp)) + 
    geom_line() +
    geom_point(size = 4)

ggplot(data = tg, aes(x = dose, y = length, fill = supp)) + 
    geom_line(position = position_dodge(0.2)) + 
    geom_point(position = position_dodge(0.2), shape = 21, size = 4)

ggplot(data = tg, aes(x = dose, y = length, shape = supp)) + 
    geom_line(position = position_dodge(0.2)) +
    geom_point(position = position_dodge(0.2), size = 4)

## 4.4
ggplot(data = BOD, aes(x = Time, y = demand)) +
    geom_line(linetype = "dashed", size = 1, colour = "blue")

library(plyr)
tg = ddply(ToothGrowth, c("supp", "dose"), summarise, length = mean(len))
ggplot(data = tg, aes(x = dose, y = length, colour = supp)) + 
    geom_line() + 
    scale_colour_brewer(palette = "Set1")

ggplot(data = tg, aes(x = dose, y = length, group = supp)) + 
    geom_line(colour = "darkgreen", size = 1.5)

ggplot(tg, aes(x = dose, y = length, colour = supp)) + 
    geom_line(linetype = "dashed") + 
    geom_point(shape = 22, size = 3, fill = "white")

## 4.5
ggplot(data = BOD, aes(x = Time, y = demand)) + 
    geom_line() + 
    geom_point(size = 4, shape = 22, colour = "darkred", fill = "pink")
ggplot(data = BOD, aes(x = Time, y = demand)) + 
    geom_line() + 
    geom_point(size = 4, shape = 21,  fill = "white")

library(plyr)
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))

ggplot(data = tg, aes(x = dose, y = length, fill = supp)) + 
    geom_line(position = position_dodge(0.2)) + 
    geom_point(shape = 21, size = 3, position = position_dodge(0.2)) + 
    scale_fill_manual(values = c("black", "white"))

ggplot(data = tg, aes(x = dose, y = length, fill = supp)) + 
    geom_line(position = position_dodge(0.2)) + 
    geom_point(shape = 21, size = 3, position = position_dodge(0.2)) + 
    scale_fill_manual(values = c("blue", "red"))

ggplot(data = tg, aes(x = dose, y = length, fill = supp)) + 
    geom_line(position = position_dodge(0.2)) + 
    geom_point(shape = 21, size = 3, position = position_dodge(0.2)) + 
    scale_colour_manual(values = c("blue", "red"))

## 4.6 时间序列
sunspotyear <- data.frame(Year = as.numeric(time(sunspot.year)), 
                          Sunspots = as.numeric(sunspot.year))
head(sunspotyear)

ggplot(data = sunspotyear, aes(x = Year, y = Sunspots)) + 
    geom_area()

ggplot(data = sunspotyear, aes(x = Year, y = Sunspots)) + 
    geom_area(colour = "black", fill = "blue", alpha = 0.5)

ggplot(data = sunspotyear, aes(x = Year, y = Sunspots)) + 
    geom_area(fill = "blue", alpha = 0.5) +
    geom_line()

library(gcookbook)
head(uspopage)
ggplot(data = uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) + 
    geom_area()




##############################################################################
## 5.
## 5.1
ggplot(data = heightweight, aes(x = ageYear, y = heightIn)) + 
    geom_point()
ggplot(data = heightweight, aes(x = ageYear, y = heightIn)) +
    geom_point(shape = 19)
ggplot(data = heightweight, aes(x = ageYear, y = heightIn)) +
    geom_point(size = 1.5)

## 5.2
ggplot(data = heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
    geom_point()
ggplot(data = heightweight, aes(x = ageYear, y = heightIn, shape = sex)) + 
    geom_point()
ggplot(data = heightweight, aes(x = ageYear, y = heightIn,
                                shape = sex, colour = sex)) + 
    geom_point()
ggplot(data = heightweight, aes(x = ageYear, y = heightIn,
                                shape = sex, colour = sex)) +
    geom_point() + 
    scale_shape_manual(values = c(1, 2)) + 
    scale_colour_brewer(palette = "Set1")
# scale_colour_manual()

## 5.3 
ggplot(data = heightweight, aes(x = ageYear, y = heightIn)) + 
    geom_point(shape = 3)
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex)) +
    geom_point(size = 3) + 
    scale_shape_manual(values = c("*", "0"))

# Make a copy of the data
hw <- heightweight
# Categorize into <100 and >=100 groups
hw$weightGroup <- cut(hw$weightLb,
                      breaks = c(-Inf, 100, Inf), 
                      labels = c("< 100", ">= 100"))
# Use shapes with fill and color, and use colors that are empty (NA) and filled
ggplot(hw, aes(x = ageYear, y = heightIn, shape = sex, fill = weightGroup)) + 
    geom_point(size = 2.5) + 
    scale_shape_manual(values = c(21, 24)) + 
    scale_fill_manual(values = c(NA, "black"), 
                      guide = guide_legend(override.aes = list(shape = 21)))

## 5.4
ggplot(data = heightweight, aes(x = ageYear, y = heightIn, colour = weightLb)) + 
    geom_point()
ggplot(data = heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) + 
    geom_point()




## 5.5 




























###############################################################################

## 6.
## 6.1
ggplot(data = faithful, aes(x = waiting)) + 
    geom_histogram()
w = faithful$waiting
ggplot(NULL, aes(x = w)) + 
    geom_histogram()

ggplot(data = faithful, aes(x = waiting)) + 
    geom_histogram(binwidth = 5, fill = "white", colour = "black")

binsize <- diff(range(faithful$waiting))/15
ggplot(data = faithful, aes(x = waiting)) + 
    geom_histogram(binwidth = binsize, fill = "white", colour = "black")

h = ggplot(data = faithful, aes(x = waiting))
h + geom_histogram(binwidth = 8, fill = "white", colour = "black", origin = 31)
h + geom_histogram(binwidth = 8, fill = "white", colour = "black", origin = 35)

## 6.2
library(MASS)
head(birthwt)
ggplot(data = birthwt, aes(x = bwt)) +
    geom_histogram(fill = "white", colour = "black") +
    facet_grid(smoke ~., labels("No Smoke", "Smoke"))

birthwt1 = birthwt
birthwt1$smoke = factor(birthwt$smoke)
levels(birthwt1$smoke)
library(plyr)
birthwt1$smoke = revalue(birthwt1$smoke, c("0" = "No Smoke", "1" = "Smoke"))
ggplot(data = birthwt1, aes(x = bwt)) + 
    geom_histogram(fill = "white", colour = "black") + 
    facet_grid(smoke ~ .)

ggplot(data = birthwt, aes(x = bwt)) + 
    geom_histogram(fill = "white", colour = "black") + 
    facet_grid(race ~., scales = "free")


birthwt1$smoke = factor(birthwt$smoke)
ggplot(data = birthwt1, aes(x = bwt, fill = smoke)) + 
    geom_histogram(position = "identity", alpha = 0.5)

## 6.3

ggplot(data = faithful, aes(x = waiting)) + 
    geom_density()

w <- faithful$waiting
ggplot(NULL, aes(x=w)) + geom_density()

ggplot(data = faithful, aes(x = waiting)) + 
    geom_line(stat = "density") + 
    expand_limits(y = 0)

ggplot(data = faithful, aes(x = waiting)) + 
    geom_line(stat = "density", adjust = .25, colour = "red") + 
    geom_line(stat = "density") + 
    geom_line(stat = "density", adjust = 2, colour = "blue")

ggplot(data = faithful, aes(x = waiting)) +  
    geom_density(fill = "blue", alpha = 0.2) +  
    xlim(35, 105)

ggplot(data = faithful, aes(x = waiting)) + 
    geom_density(fill = "blue", colour = NA, alpha = 0.2) + 
    geom_line(stat = "density") + 
    xlim(35, 105)

ggplot(faithful, aes(x = waiting, y = ..density..)) +
    geom_histogram(fill = "cornsilk", colour = "grey60", size = .2) +
    geom_density() + 
    xlim(35, 105)

## 6.4

library(MASS)
str(birthwt)
birthwt1 = birthwt
birthwt1$smoke = factor(birthwt$smoke)
ggplot(data = birthwt1, aes(x = bwt, colour = smoke)) + 
    geom_density()

ggplot(data = birthwt1, aes(x = bwt, fill = smoke)) + 
    geom_density(alpha = 0.3)


## 6.6
ggplot(data = birthwt, aes(x = factor(race), y = bwt)) +
    geom_boxplot()

ggplot(data = birthwt, aes(x = factor(race), y = bwt)) + 
    geom_boxplot(width = 0.5)

ggplot(data = birthwt, aes(x = factor(race), y = bwt)) + 
    geom_boxplot(outlier.size = 1.5, outlier.shape = 21)

ggplot(data = birthwt, aes(x = 1, y = bwt)) + 
    geom_boxplot() + 
    scale_x_continuous(breaks = NULL) + 
    theme(axis.title.x = element_blank())

## 6.7
ggplot(data = birthwt, aes(x = factor(race), y = bwt)) + 
    geom_boxplot(notch = TRUE)

## 6.8
ggplot(data = birthwt, aes(x = factor(race), y = bwt)) + 
    geom_boxplot() + 
    stat_summary(fun.y = "mean",
                 geom = "point",
                 shape = 23, 
                 fill = "red", 
                 size = 3)

## 6.9 
p = ggplot(data = heightweight, aes(x = sex, y = heightIn))
p + geom_violin()

p + geom_violin(trim = FALSE)

p + geom_violin() +
    geom_boxplot(width = 0.1, fill = "lightblue", outlier.colour = NA) + 
    stat_summary(fun.y = median, geom = "point",
                 fill = "white", shape = 21, size = 2.5)

p + geom_violin(trim = FALSE) + 
    geom_boxplot(width = 0.1, fill = "lightblue", outlier.colour = NA) + 
    stat_summary(fun.y = median, geom = "point", 
                 fill = "red", shape = 21, size = 2.5)

p + geom_violin(scale = "count")

# More smoothing
p + geom_violin(adjust = 2)

# Less smoothing
p + geom_violin(adjust = 0.1)


## 6.10
countries2009 = subset(countries, Year == 2009 & healthexp > 2000)
p = ggplot(data = countries2009, aes(x = infmortality))
p + geom_dotplot()

p + geom_dotplot(binwidth = 0.25) + 
    geom_rug() +
    scale_y_continuous(breaks = NULL) +
    theme(axis.title.y = element_blank())














## 6.12
p = ggplot(data = faithful, aes(x = eruptions, y = waiting))

p + geom_point() + stat_density2d()
p + geom_point() + geom_density2d()

p + stat_density2d(aes(colour = ..level..))

p + stat_density2d(aes(fill = ..density..), geom = "raster", contour = FALSE)

p + stat_density2d(aes(alpha = ..density..), geom = "tile", contour = FALSE)

p + stat_density2d(aes(fill = ..density..), geom = "raster", contour = FALSE,
                   h = c(0.5, 5)) 




## 7.
## 7.1
p = ggplot(data = faithful, aes(x = eruptions, y = waiting)) + 
    geom_point()
p

p + annotate(geom = "text", x = 3, y = 48, label = "Group 1") + 
    annotate(geom = "text", x = 4.5, y = 66, label = "Group 2")

p + annotate(geom = "text", x = 3, y = 48, label = "Group 1", 
             family = "serif", fontface = "italic", 
             colour = "darkred", size = 5) + 
    annotate(geom = "text", x = 4.5, y = 66, label = "Group 2",
             family = "serif", fontface = "italic", 
             colour = "darkred", size = 5)


p + annotate(geom = "text", x = 3, y = 48, label = "Group 1", alpha = 0.1) + 
    geom_text(x = 4.5, y = 66, label = "Group 2", alpha = 0.1)


p + annotate(geom = "text", x = -Inf, y = Inf,
             label = "Upper left", hjust = -0.2, vjust = 2) + 
    annotate(geom = "text", x = mean(range(faithful$eruptions)), y = -Inf,
             label="Bottom middle", vjust = -0.4)


## 7.2
?plotmath
demo(plotmath)

mydata = data.frame(x = c(-3, 3))
p = ggplot(data = mydata, aes(x = x)) + 
    stat_function(fun = dnorm)
p + annotate(geom = "text", x = 2, y = 0.3, parse = TRUE, 
             label = "frac(1, sqrt(2 * pi)) * e ^ {-x^2 / 2}")

p + annotate(geom = "text", x = 0, y = 0.05, parse = TRUE, 
             label = "'Function: ' * y == frac(1, sqrt(2*pi)) * e^{-x^2/2}") 

## 7.3
p = ggplot(data = heightweight, aes(x = ageYear, y = heightIn, colour = sex)) + 
    geom_point()
p
p + geom_hline(yintercept = 60) +
    geom_vline(xintercept = 14)

p + geom_abline(intercept = 37.4, slope = 1.75)
p + geom_abline(intercept = 37.4, slope = 1.75) +
    expand_limits(x = 0, y = 0)

hw_means = ddply(heightweight, "sex", summarise, heightIn = mean(heightIn))
hw_means

hw_means = heightweight %>% group_by(sex) %>% summarise(mean(heightIn))
hw_means

