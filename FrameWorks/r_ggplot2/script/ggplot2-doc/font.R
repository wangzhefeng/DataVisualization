# Font

# system global env config
options(stringsAsFactors = FALSE)
setwd("/home/wangzhefeng/project/DataVisualiztion/ggplot2/tutorial")

# require package
library(showtext)
library(ggplot2)
library(magrittr)

# 默认情况下是系统默认字体(中文宋体)
ggplot(data = diamonds, mapping = aes(x = color, fill = cut)) +
    geom_bar() +
    ggtitle("钻石质量情况")


# base::windowsFont()
windowsFont(myFont = windowsFont("微软雅黑"))
png("myplot.jpeg")
ggplot(data = diamonds, mapping = aes(x = color, fill = cut)) +
    geom_bar() +
    ggtitle("钻石质量情况") +
    theme(title = element_text(family = "myFont"))
dev.off()

ggplot(data = diamonds, mapping = aes(x = color, fill = cut)) +
    geom_bar() +
    ggtitle("钻石质量情况") +
    theme(title = element_text(family = "myFont"))
ggsave("myplot.jpeg")

# showtext package
showtext::font_add("myfont", "msyh.ttc")
font.families()
showtext_begin()
png("myplot.jpeg")
ggplot(data = diamonds, mapping = aes(x = color, fill = cut)) +
    geom_bar() +
    ggtitle("钻石质量情况") +
    theme(title = element_text(family = "myFont"))
showtext_end()
dev.off()

showtext::font_add("myfont", "msyh.ttc")
font.families()
showtext_begin()
ggplot(data = diamonds, mapping = aes(x = color, fill = cut)) +
    geom_bar() +
    ggtitle("钻石质量情况") +
    theme(title = element_text(family = "myFont"))
showtext_end()
ggsave("myplot.jpeg")
