library(tm)
library(wordcloud)
Paper1 = paste(scan("/Users/zfwang/project/DataVisualiztion/charts/wordcloud/data/Paper1.txt", 
                    what = character(0), sep = ""), 
               collapse = "")
Paper2 = paste(scan("/Users/zfwang/project/DataVisualiztion/charts/wordcloud/data/Paper2.txt", 
                    what = character(0), sep = ""), 
               collapse = "")
tmpText = data.frame(c(Paper1, Paper2), row.names = c("Text1", "Text2"))
df_title = data.frame(doc_id = row.names(tmpText),
                      text = tmpText$c.Paper1..Paper2.)