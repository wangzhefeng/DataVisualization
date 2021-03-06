####################################################################
####                       Plot the maps                          ##
####################################################################

## 1
library(maps)
map("world", fill = TRUE, col = rainbow(200), ylim = c(-60, 90), mar = c(0, 0, 0, 0))
title("世界地图")

## 2
library(maps)
library(mapdata)
map("china")
map("china", col = "red4", ylim = c(18, 54), panel.first = grid())
title("中国地图")

## 3
library(maps)
map("state", fill = TRUE, col = rainbow(209), mar = c(0, 0, 2, 0))
title("美国地图")

library(maps)
map('state', region = c('new york', 'new jersey', 'penn'), fill = TRUE, col = rainbow(3), mar = c(2, 3, 4, 3))
title("美国三州地图")

## 4
library(ggmap)
geocode("Shanghai")
geocode("Shanghai University", output = "more")
mapdist('China Agricultural University', 'Renmin University of China', 'walking')

library(ggmap)
library(mapproj)
## Google啊Google给我China的地图数据吧
map <- get_map(location = 'China', zoom = 4)
ggmap(map)

#Google啊Google给我Beijing的公路地图数据吧
map <- get_map(location = 'Beijing', zoom = 10, maptype = 'roadmap')
ggmap(map)

## Google啊Google给我RUC的卫星地图数据吧
map <- get_map(location = 'Renmin University of China', zoom = 14,
               maptype = 'satellite')
ggmap(map)

## 5
setwd("F:/My Directory/data")
library(maptools)
x = readShapePoly('bou2_4p.shp')
plot(x)
plot(x, col = gray(924 : 0/924))
x[[1]]
x$att.data

getColor = function(mapdata, provname, provcol, othercol) {
    f = function(x, y) ifelse(x %in% y, which(y == x), 0)
    colIndex = sapply(mapdata@data$NAME, f, provname)
    col = c(othercol, provcol)[colIndex + 1]
    return(col)
}

provname = c("北京市", "天津市", "上海市", "重庆市")
provcol = c("red", "green", "yellow", "purple")
plot(x, col = getColor(x, provname, provcol, "white"))
as.character(na.omit(unique(x$att.data$NAME)))
provname=c("北京市","天津市","河北省","山西省","内蒙古自治区",
           "辽宁省","吉林省","黑龙江省","上海市","江苏省",
           "浙江省","安徽省","福建省","江西省","山东省",
           "河南省","湖北省","湖南省","广东省",
           "广西壮族自治区","海南省","重庆市","四川省","贵州省",
           "云南省","西藏自治区","陕西省","甘肃省","青海省",
           "宁夏回族自治区","新疆维吾尔自治区","台湾省",
           "香港特别行政区")
pop=c(1633,1115,6943,3393,2405,4298,2730,3824,1858,7625,
      5060,6118,3581,4368,9367,9360,5699,6355,9449,
      4768,845,2816,8127,3762,4514,284,3748,2617,
      552,610,2095,2296,693)
provcol = rgb(red = 1 - pop / max(pop) / 2, green = 1 - pop / max(pop) / 2, blue = 0)
plot(x, col = getColor(x, provname, provcol, "white"), xlab = "", ylab = "")  
getID=function(mapdata,provname) {
    index=mapdata$att.data$NAME %in% provname;
    ids=rownames(mapdata$att.data[index,]);
    return(as.numeric(ids));
}
midchina=c("河南省","山西省","湖北省","安徽省","湖南省","江西省");
plot(x,recs=getID(x,midchina),fg="green",ol="white",xlab="",
     ylab="");
plot(x, 
     col = getColor(x, midchina, rep("green", 6), "white"),
     border = "white",
     xlab = "",
     ylab = "")

