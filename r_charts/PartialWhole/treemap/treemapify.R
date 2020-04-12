if(!require(treemapify)) install.packages("treemapify")
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(tweenr)) install.packages('tweenr')
if(!require(gganimate)) devtools::install_github("dgrtwo/gganimate")
if(!require(RColorBrewer)) install.packages("RColorBrewer")

# data 
str(G20)
G20

# gg_treemap()
p1 = ggplot(data = G20, mapping = aes(area = gdp_mil_usd)) +
  geom_treemap(fill = "steelblue")
p1


p2 = ggplot(data = G20, 
            mapping = aes(area = gdp_mil_usd, fill = hdi, label = country)) +
  geom_treemap() +
  geom_treemap_text(fontface = "italic", 
                    colour = "blue", 
                    place = "center", 
                    grow = TRUE, alpha = 0.6) +
  scale_fill_distiller(palette = "Greens")
p2

p3 = ggplot(data = G20, mapping = aes(area = gdp_mil_usd, fill = hdi, label = country, subgroup = region)) +
  geom_treemap() +
  geom_treemap_subgroup_border() +
  geom_treemap_subgroup_text(place = 'center', 
                             grow = TRUE, 
                             alpha = 0.5, 
                             colour = "black", 
                             fontface = "italic", 
                             min_size = 0) +
  geom_treemap_text(colour = "blue", place = "topleft", reflow = TRUE, alpha = 0.6) +
  scale_fill_distiller(palette = "Greens")
p3

p4 = ggplot(data = G20, mapping = aes(area = gdp_mil_usd, fill = region, label = country)) +
  geom_treemap() +
  geom_treemap_text(grow = TRUE, reflow = TRUE, colour = "black") +
  facet_wrap(~econ_classification) +
  scale_fill_brewer(palette = "Blues") +
  labs(title = "The G-20 major economies",
       caption = "The area of each country is proportional to its relative GDP within the economic group (advanced or developing)", 
       fill = "Region") +
  theme(legend.position = "bottom", 
        plot.caption = element_text(hjust = 0))
p4


G20_alt = G20
G20_alt$gdp_mil_usd = sample(G20$gdp_mil_usd, nrow(G20))
G20_alt$hdi = sample(G20$hdi, nrow(G20))
tweened = tween_states(list(G20, G20_alt, G20), 
                       tweenlength = 8, 
                       statelength = 5, 
                       ease = "cubic-in-out", 
                       nframes = 30)
animated_plot = ggplot(tweened, 
                       mapping = aes(area = gdp_mil_usd, 
                                     fill = hdi, 
                                     label = country, 
                                     subgroup = region, 
                                     frame = .frame)) +
  geom_treemap(fixed = TRUE) +
  geom_treemap_subgroup_text(place = "center", 
                             grow = TRUE, 
                             alpha = 0.5, 
                             colour = "black", 
                             fontface = "italic", 
                             min.size = 0, 
                             fixed = TRUE) +
  geom_treemap_text(colour = "white", 
                    place = "topleft", 
                    reflow = TRUE, 
                    fixed = TRUE) +
  scale_fill_distiller(palette = "Greens")

# ani.options(interval = 1/10)
# gganimate(animated_plot, 
#           "/home/wangzhefeng/project/R/animated_treemap.gif", 
#           title_frame = FALSE, 
#           ani.width = 1000, 
#           ani.height = 800)
