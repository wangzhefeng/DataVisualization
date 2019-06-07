# install.packages('leaflet')
# install.packages('leafletCN')
library(leaflet)
library(leafletCN)
# Example
m = leaflet() %>% addTiles()
m

m = m %>% setView(-93.65, 42.0285, zoom = 17)
m
m %>% addPopups(-93.65, 42.0285, 
                'Here is the <b>Department of Statistics</b>, ISU')


## mapNames
regionNames("china")

## demomap
demomap("china")

## Choropleth Map
dat = data.frame(regionNames("city"),
                 runif(384))
stupidMap(dat,"city")
