library(ggmap)
setwd("O:/JohnP/RT Forecast/Data-2016NP15")
outages.df <- read.csv("gen outages.csv")
outagelocs.df <- unique(outages.df[,c("PLANT_NAME","LONGITUDE","LATITUDE")])
clusts <- kmeans(outagelocs.df[,2:3],15)
outagelocs.df$cluster <- clusts$cluster
ggmap(get_map("California",zoom=4))+geom_point(aes(x=LONGITUDE,y=LATITUDE,color=cluster),data=outagelocs.df)

