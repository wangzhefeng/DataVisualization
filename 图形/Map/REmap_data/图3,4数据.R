library(REmap)
#############################
#        five point         #
#############################

thc <- c(113.328895,23.137662)
zj <- c(113.333791,23.138593)
tgh <- c(113.338723,23.139906)
tyzx <- c(113.331536,23.141293)
wdl <- c(113.327435,23.14035)

thc_df <- data.frame(lon=thc[1]+rnorm(100,0,0.001),
                     lat=thc[2]+rnorm(100,0,0.001),
                     city=paste("thc",1:100,sep="")
                     )
thc_ct <- data.frame(lon=rep(thc[1],100),
                     lat=rep(thc[2],100),
                     city=paste("thc_ct")
                     )



zj_df <- data.frame(lon=zj[1]+rnorm(100,0,0.001),
                     lat=zj[2]+rnorm(100,0,0.001),
                     city=paste("zj",1:100,sep="")
                     )
zj_ct <- data.frame(lon=rep(zj[1],100),
                    lat=rep(zj[2],100),
                    city=paste("zj_ct")
                    )


tgh_df <- data.frame(lon=tgh[1]+rnorm(100,0,0.001),
                     lat=tgh[2]+rnorm(100,0,0.001),
                     city=paste("tgh",1:100,sep="")
                     )
tgh_ct <- data.frame(lon=rep(tgh[1],100),
                     lat=rep(tgh[2],100),
                     city=paste("tgh_ct")
                     )

tyzx_df <- data.frame(lon=tyzx[1]+rnorm(100,0,0.001),
                     lat=tyzx[2]+rnorm(100,0,0.001),
                     city=paste("tyzx",1:100,sep="")
                     )
tyzx_ct <- data.frame(lon=rep(tyzx[1],100),
                     lat=rep(tyzx[2],100),
                     city=paste("tyzx_ct")
                     )

wdl_df <- data.frame(lon=wdl[1]+rnorm(100,0,0.001),
                     lat=wdl[2]+rnorm(100,0,0.001),
                     city=paste("wdl",1:100,sep="")
                     )
wdl_ct <- data.frame(lon=rep(wdl[1],100),
                     lat=rep(wdl[2],100),
                     city=paste("wdl_ct")
                     )


thc_center <- c(113.328755,23.137588)
line_origin <- rbind(thc_df,zj_df,tgh_df,tyzx_df,wdl_df)    
line_dest <- rbind(thc_ct,zj_ct,tgh_ct,tyzx_ct,wdl_ct)
#数据下载链接在文章开头，其中数据为R代码，复制到R命令行执行即可
markLine_data <- data.frame(origin=line_origin[,3],
                            destination=line_dest[,3],
                          color=rep("grey",length(line_origin[,3]))
                            )
gdata <- rbind(line_origin,line_dest)

markLine_Control <- markLineControl(symbolSize=c(0,0.1),
                                    smoothness=10,
                                    effect=T,
                                    lineWidth=1.5,
                                    lineType="dashed"
                                    )
remapB(center=thc_center,
       zoom=17,
       color="Blue",
       # markPointData=markPoint_data,
       markLineData=markLine_data,
       # markPointTheme=markPoint_Control,
       markLineTheme=markLine_Control,
       geoData=gdata
       )
