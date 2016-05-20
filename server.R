#load("ResourceDirectory_data.RData")
shinyServer(
  function(input, output) {
    
    output$partText<-renderText({
      i<-which(df$Row.Labels==input$county)
      paste(df[i,5], "lunches and", df[i,7], "total meals were served in ", input$county, " County to children throughout the summer of 2015." )
    })
    
    output$adpText<-renderText({
      i<-which(df$Row.Labels==input$county)
      paste("On average, ", df[i,6] ," children participate in meals during the summer each day. Conversely, ", df[i,9], "children eat free and reduced price lunch during the school year. Thus the participation rates in summer meals in ", input$county, " is ", df[i,10])
    })
    
    output$num_sites<-renderText({
      i<-which(summer15$County==input$county)
      paste("There are ", length(i)," sponsors and", sum(summer15$Sites.Claiming[i]), "sites in ", input$county," County.")
    })
    
    output$days<-renderText({
      i<-which(df$Row.Labels==input$county)
      paste("On average, children in ", input$county, "have access to lunch service during ", df[i,4]," days of the summer.")
    })
    ###DATA###
    output$sponsors=renderTable({
      i<-which(summer15$County==input$county)
      summer15[i,c(2,3,9)]
    }, 
    include.rownames=FALSE)
    
    ###MAPS###
    output$sitemap=renderPlot({
      df.m2$site<-as.numeric(gsub(",","",df.m2$Num.Of.Sites))
      df.m2$value<-cut(as.numeric(df.m2$site),breaks = c(0,1,10,100,510,1300))
      choro = CountyChoropleth$new(df.m2)
      choro$ggplot_scale = scale_fill_brewer(name="Number of Sites",palette=7, drop=FALSE)
      choro$set_zoom("texas")
      choro$render()
      choro$render()
    })
    
    output$CEmap=renderPlot({
      df.m2$value<-cut(as.numeric(df.m2$Sum.of.Unique.CE.ID),breaks = c(0,1,5,10,110))
      choro = CountyChoropleth$new(df.m2)
      choro$ggplot_scale = scale_fill_brewer(name="Number of Sponsors",palette=7, drop=FALSE)
      choro$set_zoom("texas")
      choro$render()
    })
    
    output$daysmap=renderPlot({
      df.m2$value<-cut(as.numeric(df.m2$Average.of.Days.of.Lunch.Service),breaks = c(0,15,30,45,60))
      choro = CountyChoropleth$new(df.m2)
      choro$ggplot_scale = scale_fill_brewer(name="Number of Days of Lunch Service",palette=5, drop=FALSE)
      choro$set_zoom("texas")
      choro$render()
    })
    
    output$lunchmap=renderPlot({
      df.m2$lunch<-as.numeric(gsub(",","",df.m2$Sum.of.Lunches))
      df.m2$value<-cut(df.m2$lunch,breaks = c(0,2500,5000,7500,10000,2750000))
      choro = CountyChoropleth$new(df.m2)
      choro$ggplot_scale = scale_fill_brewer(name="Number of Summer Lunches Served",palette=3, drop=FALSE)
      choro$set_zoom("texas")
      choro$render()
    })
    
    output$adpmap=renderPlot({
      df.m2$adp<-as.numeric(gsub(",","",df.m2$Sum.of.Lunch.ADP))
      df.m2$value<-cut(df.m2$adp,breaks = c(0,100,350,500,1000,82000))
      choro = CountyChoropleth$new(df.m2)
      choro$ggplot_scale = scale_fill_brewer(name="Average Daily Participation in Summer Meals",palette=3, drop=FALSE)
      choro$set_zoom("texas")
      choro$render()
    })
    
    output$totmealsmap=renderPlot({
      df.m2$meals<-as.numeric(gsub(",","",df.m2$Sum.of.Total.Meals))
      df.m2$value<-cut(df.m2$meals,breaks = c(0,5000,100000,30000,5100000))
      choro = CountyChoropleth$new(df.m2)
      choro$ggplot_scale = scale_fill_brewer(name="Number of Total Meals Served",palette=3, drop=FALSE)
      choro$set_zoom("texas")
      choro$render()
    })
    
    ###RESOURCES####
    output$vendors=renderDataTable({
      #i<-which(vendors$county==input$county)
      vendors2[,c(2,4,5,6)]
    })
    
    ###CONTACT INFORMATION####
    output$THIcontact=renderText({
      i<-which(contact$County==input$county)
      paste("Contact your CHOS representative,", contact[i,2], ", at ", contact[i,3])
    })
    
    output$ESCcontact=renderText({
      i<-which(df$Row.Labels==input$county)
      paste("Contact your ESC representative,", contact[i,4], ", at ", contact[i,5])
    })
    
    
  }
)