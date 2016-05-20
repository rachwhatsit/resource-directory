library(shiny)
library(DiagrammeR)

library(choroplethr)
library(choroplethrMaps)
library(ggplot2)

#setwd("/Users/rachel_wilkerson/Box Sync/RLW THI Projects/SUMMER/ResourceDirectory/")
#load("ResourceDirectory_data.RData")
# d<-read.csv("/Users/rachel_wilkerson/Box Sync/RLW THI Projects/SUMMER/ResourceDirectory/SummerMeals_ByCECountySite_TDA_2015_Report8.csv",header=T,stringsAsFactors = F,strip.white = T)
# df<-d[1:255,]
# data(county.regions)
# county.regions.tx=county.regions[which(county.regions$state.name=="texas"),]
# df.copy<-df
# df.copy$County<-tolower(df.copy$Row.Labels)
# df.m=(merge(df.copy,county.regions.tx,by.x="County",by.y="county.name",all.x=T,all.y=T))
# df.m2<-df.m[-c(which(df.m$County==""),126),]
# 
# colnames(df.m2)[4]<-"Num.Of.Sites"
# 
# # choro = CountyChoropleth$new(df.m2)
# # choro$ggplot_scale = scale_fill_brewer(name="Number of Sites",palette=7, drop=FALSE)
# # choro$set_zoom("texas")
# # choro$render()
# 
# contact<-read.csv("Biz Models Contact Info  - Sheet1updated.csv",stringsAsFactors = F,strip.white = T)
# summer15<-read.csv("SummerMeals_ByCECountySite_TDA_2015_Report8.csv",stringsAsFactors = F, strip.white = T)
# vendors<-read.csv("vendors.csv",stringsAsFactors = F, strip.white = T)
# vendors$county<-summer15$County[match(vendors$CE.ID,summer15$CE.ID)]
# vendors2<-subset(vendors,vendors$FoodServiceVendor!="")
