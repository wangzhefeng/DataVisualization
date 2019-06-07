# guides()
# guide_colorbar()
# guide_legend()

guides(
    colour = guide_colorbar(title = "",
                            title.position = "",
                            title.theme = element_text(),
                            title.vjust,
                            title.hjust,
                            label,
                            label.position,
                            label.vjust,
                            label.hjust,
                            label.theme = element_text(),
                            direction,
                            barwidth,
                            barheight,
                            nbin,
                            ticks,
                            draw.ulim,
                            draw.llim),
    fill = guide_colorbar(),
    color = guide_legend(title = "",
                         title.position = "",
                         title.theme = element_text(),
                         title.vjust,
                         title.hjust,
                         label,
                         label.position,
                         label.vjust,
                         label.hjust,
                         label.theme = element_text(),
                         direction,
                         key.width, 
                         key.height,
                         key.size,
                         nrow,
                         ncol,
                         byrow),
    fill = guide_legend(),
    size = guide_legend(),
    shape = guide_legend(),
    linetype = guide_legend(),
    alpha = guide_legend()
)
# ===============================================


library(ggplot2)
mydata = data.frame(
    x = runif(100, 0, 100),
    y = runif(100, 0, 100),
    z = runif(100, 0, 100),
    f = runif(100, 0, 100),
    g = rep(LETTERS[1:5], each = 20)
)

p = ggplot(mydata, mapping = aes(x, y)) +
    geom_point(mapping = aes(fill = z, size = f), shape = 21)
p

colorbar = guide_colorbar(
    title = "ColorBar",
    title.position = "left", # left, right, top, bottom
    title.hjust = 0.5,
    title.vjust = 0,
    title.theme = element_text(size = 15, face = "italic", colour = "red", angle = 45),
    label = TRUE,
    label.position = "top",
    label.hjust = 0.5,
    label.vjust = 0.5,
    label.theme = element_text(size = 15, face = "italic", colour = "red", angle = 45),
    barwidth = unit(6, "cm"),
    barheight = unit(1.2, "cm"),
    nbin = 20,
    ticks = TRUE,
    draw.ulim = TRUE,
    draw.llim = TRUE,
    direction = "horizontal", # horizontal, vertical
    reverse = TRUE,
    order = 1
)

size_legend = guide_legend(
    title = "Legend",
    title.position = "left",
    title.hjust = 0.5,
    title.vjust = 0.5,
    title.theme = element_text(size = 15, face = "italic", colour = "red", angle = 45),
    label = TRUE,
    label.position = "bottom",
    label.hjust = 0.5,
    label.vjust = 0.5,
    label.theme = element_text(size = 15, face = "italic", colour = "red", angle = 45),
    keywidth = 2.5,
    keyheight = 2,
    direction = "horizontal",
    nrow = 2,
    byrow = TRUE,
    reverse = TRUE,
    order = 2
)



p + scale_fill_gradient(breaks = seq(0, 100, 10)) +
    scale_size_area(breaks = seq(0, 100, 10)) +
    guides(fill = colorbar,
           size = size_legend)
