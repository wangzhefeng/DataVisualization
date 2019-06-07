library(REmap)
options(remap.js.web = TRUE)


# Example 1
# Data
destin = read.csv(file = 'E:/R/Data Visualiztion/map/REmap_data/destination.csv', 
                  encoding = 'gb2312', 
                  header = FALSE)
names(destin) = c('names', 'values')
markLine_data = data.frame(origin = rep('广州', 33), 
                           destination = destin[1:33, 1], 
                           color = rep('#fff', 33))
markPoint_data = as.vector(markLine_data[, 2])

remapC(destin, 
       title = '2016年2月6日 广州人口迁出图',
       # subtitle = '前十目标省份'，
       theme = get_theme(
           #设置相应的背景色调
           theme = 'Dark',
           lineColor = '#FFFFFF',
           titleColor = '#fff',
           borderColor = '#FFFFFF', # 边界颜色:白色
           regionColor = '#000000', # 区域颜色:黑色
           pointShow = F,
           pointColor = 'white'),
       color = c('#191970', '#778899'),
       ## markLine
       markLineData = markLine_data, 
       markLineTheme = markLineControl(
           color = 'red', 
           lineWidth = 1, 
           lineType = 'dashed'),
       ## markPoint
       markPointData = markPoint_data, 
       markPointTheme = markPointControl(
           symbolSize = 13, 
           effect = TRUE, 
           effectType = 'scale',
           color = 'gold'))

## Example 2
# Data
thc_center = c(113.328755, 23.137588)
lonlat_thc = read.csv(file = 'E:/R/Data Visualiztion/map/REmap_data/lonlat_thc.csv', 
                      header = TRUE)
gdata1 = lonlat_thc[, 1:3]
names(gdata1) = c("lon", "lat", "city")
gdata2 = lonlat_thc[, 5:7]
names(gdata2) = c("lon", "lat", "city")
gdata = rbind(gdata1, gdata2)
markLine_data = data.frame(origin = gdata1[, 3], 
                           destination = gdata2[, 3],
                           color = rep('gold', length(gdata1[, 3])))
remapB(center = thc_center, 
      zoom = 17, 
      color = 'Blue', 
      markLineData = markLine_data, 
      markLineTheme = markLineControl(symbolSize = c(0, 0.1),
                                      smoothness = 0,
                                      effect = T,
                                      lineWidth = 3,
                                      lineType = 'dashed'),
      geoData = gdata)




## Example 3
# data
markLine_data = data.frame(origin = gdata1[, 3],
                           destination = gdata2[, 3],
                           color = rep("gold", length(gdata1[, 3])))
markLine_Control = markLineControl(symbolSize = c(0, 0.1),
                                    smoothness = 0,
                                    effect =T,
                                    lineWidth = 3,
                                    lineType = "dashed")
remapB(center = thc_center,
       zoom = 17,
       color = "Blue",
       markLineData = markLine_data,
       markLineTheme = markLine_Control,
       geoData = gdata)


library(REmap)
#############################
#        five point         #
#############################
thc = c(113.328895, 23.137662)
zj = c(113.333791, 23.138593)
tgh = c(113.338723, 23.139906)
tyzx = c(113.331536, 23.141293)
wdl = c(113.327435, 23.14035)

thc_df = data.frame(lon = thc[1] + rnorm(100, 0, 0.001),
                     lat = thc[2] + rnorm(100, 0, 0.001),
                     city = paste("thc", 1:100, sep=""))
thc_ct = data.frame(lon=rep(thc[1],100),
                     lat=rep(thc[2],100),
                     city=paste("thc_ct"))

zj_df = data.frame(lon=zj[1]+rnorm(100,0,0.001),
                    lat=zj[2]+rnorm(100,0,0.001),
                    city=paste("zj",1:100,sep=""))
zj_ct = data.frame(lon=rep(zj[1],100),
                    lat=rep(zj[2],100),
                    city=paste("zj_ct"))

tgh_df = data.frame(lon=tgh[1]+rnorm(100,0,0.001),
                     lat=tgh[2]+rnorm(100,0,0.001),
                     city=paste("tgh",1:100,sep=""))
tgh_ct = data.frame(lon=rep(tgh[1],100),
                     lat=rep(tgh[2],100),
                     city=paste("tgh_ct"))

tyzx_df = data.frame(lon=tyzx[1]+rnorm(100,0,0.001),
                      lat=tyzx[2]+rnorm(100,0,0.001),
                      city=paste("tyzx",1:100,sep=""))
tyzx_ct = data.frame(lon=rep(tyzx[1],100),
                      lat=rep(tyzx[2],100),
                      city=paste("tyzx_ct"))

wdl_df = data.frame(lon=wdl[1]+rnorm(100,0,0.001),
                     lat=wdl[2]+rnorm(100,0,0.001),
                     city=paste("wdl",1:100,sep=""))
wdl_ct = data.frame(lon=rep(wdl[1],100),
                     lat=rep(wdl[2],100),
                     city=paste("wdl_ct"))



thc_center = c(113.328755, 23.137588)
line_origin = rbind(thc_df, zj_df, tgh_df, tyzx_df, wdl_df)    
line_dest = rbind(thc_ct, zj_ct, tgh_ct, tyzx_ct, wdl_ct)
markLine_data = data.frame(origin = line_origin[, 3],
                            destination = line_dest[, 3],
                            color = rep("grey", length(line_origin[, 3])))
gdata = rbind(line_origin, line_dest)
markLine_Control = markLineControl(symbolSize = c(0,0.1),
                                    smoothness = 10,
                                    effect = T,
                                    lineWidth = 1.5,
                                    lineType = "dashed")
remapB(center = thc_center,
       zoom = 17,
       color = "Blue",
       # markPointData=markPoint_data,
       markLineData = markLine_data,
       # markPointTheme=markPoint_Control,
       markLineTheme = markLine_Control,
       geoData = gdata)

#
thc_center = c(113.328755, 23.137588)
line_origin = rbind(thc_df, zj_df, tgh_df, tyzx_df, wdl_df)    
line_dest = rbind(thc_ct, zj_ct, tgh_ct, tyzx_ct, wdl_ct)

markLine_data = data.frame(origin = line_origin[, 3],
                           destination = line_dest[, 3],
                           color = rep("grey", length(line_origin[, 3])))
gdata = rbind(line_origin, line_dest)
markLine_Control = markLineControl(symbolSize = c(0, 0.1),
                                    smoothness = 10,
                                    effect = T,
                                    lineWidth = 1.5,
                                    lineType = "dashed")
remapB(center = thc_center,
       zoom = 17,
       color = "Blue",
       # markPointData=markPoint_data,
       markLineData = markLine_data,
       # markPointTheme=markPoint_Control,
       markLineTheme = markLine_Control,
       geoData = gdata)