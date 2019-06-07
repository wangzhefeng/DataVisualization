if(!require(devtools)) install.packages('devtools')
if(!require(rCharts)) install_github('ramnathv/rCharts')
if(!require(MASS)) install.packages('MASS')
  
hair_eye_male = subset(as.data.frame(HairEyeColor), Sex == "Male")
hair_eye_male[, 1] = paste0("Hair", hair_eye_male[, 1])
hair_eye_male[, 2] = paste0("Eye", hair_eye_male[, 2])


# nPlot()
n1 = nPlot(Freq ~ Hair, 
           group = "Eye", 
           data = hair_eye_male, 
           type = "multiBarChart")
n1

n2 = nPlot(Freq ~ Hair,
           group = "Eye",
           data = hair_eye_male, 
           type = "multiBarHorizontalChart")
n2$chart(showControls = FALSE)
n2

# hPlot()
a = hPlot(Pulse ~ Height, data = MASS::survey,
          type = "scatter",
          group = "Sex",
          radius = 6, 
          group.na = "Not Available")
a$colors('rgba(223, 83, 83, 0.5)', 
         'rgba(119, 152, 191, 0.5)', 
         'rgba(10, 179, 113, 0.5)')
a$legend(align = "right", verticalAlign = "top", layout = 'vertical')
a$chart(zoomType = 'xy')
a$exporting(enabled = TRUE)
a


