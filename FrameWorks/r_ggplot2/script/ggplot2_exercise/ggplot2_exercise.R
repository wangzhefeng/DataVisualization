library(ggplot2)
p <- ggplot(data = iris, mapping = aes(x = Sepal.Width,
                                       y = Sepal.Length,
                                       colour = Species, 
                                       shape = Species))
p + 
    geom_point(alpha = 0.05) +
    stat_density2d(aes(alpha = ..level.., fill = Species), geom = "polygon") + 
    geom_rug(position='jitter') +
    theme_bw()

##############################################################################
p <- ggplot(data = iris, mapping = aes(x = Sepal.Width,
                                       y = Sepal.Length))
p + 
    geom_rug(aes(color = Species), position='jitter') +
    stat_density2d(aes(alpha = ..level.., fill = Species), geom = "polygon") + 
    theme_bw() 
#############################################################################
p <- ggplot(data = iris, mapping = aes(x = Petal.Width, 
                                       y = Petal.Length))
p + 
    geom_rug(aes(color = Species), position='jitter') + 
    stat_density2d(aes(alpha = ..level.., fill = Species), geom = "polygon") +  
    theme_bw() 



