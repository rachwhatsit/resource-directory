shinyUI(fluidPage(
  titlePanel("Resource Directory for Out of School Meals"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("county",label = "Please select your county of interest",choices = df$Row.Labels)
    ),
    mainPanel(
      tabsetPanel(type="tabs",
      tabPanel("Key Facts",h3("Key Facts"),
     #          includeHTML("map.html"),
      h4("Number of Sites and Sponsors"),
      h5(textOutput("num_sites")),
      "The sponsors in your county are:",
      tableOutput("sponsors"),
      "See how the number of sponsors and sites in your counties compares to others across the state on the map below.",
      plotOutput("CEmap"),plotOutput("sitemap"),
      h4("Days of Lunch Service"),
      h6("Part of the challenge for communities is 
         working together to ensure children have access throughout the summer."),
      h5(textOutput("days")),
      "See how the average number of lunch service days compares across the state on the map below.",
      plotOutput("daysmap"),
      h4("Number of Meals Served"),
      h5(textOutput("partText")),
      "See how the number of lunches served compares across the state on the map below.",
      plotOutput("lunchmap"),
      "See how the number of total meals served compares across the state on the map below.",
      plotOutput("totmealsmap"),
      h5(textOutput("adpText")),
      "See how the average daily participation compares across the state on the map below.",
      plotOutput("adpmap")),
     
     #a("Food Insecurity Rates in Texas", href="http://map.feedingamerica.org/county/2014/overall/texas"),
    #  "May be viewed here.",
      tabPanel("Vendors",
               h5("Vendors"),
               "The following table contains the information about vendors who serve both summer and afterschool meals across the state. Use the tabs at the bottom to search by county, site, or sponsor. Please note that this table only contains vended sites, not self-prep.",
               dataTableOutput("vendors")
               ),
       tabPanel("Contact Information",h3("Contact Information"),
       h5(textOutput("THIcontact")),
      "Your CHOS representative can help",
      tags$ul(
        tags$li("Connect you with a sponsor nearby."), 
        tags$li("Connect you with federal or state resources."), 
        tags$li("Connect you with other resources in the area.")
      ),
       h5(textOutput("ESCcontact")),
      "Your ESC representative can help",
      tags$ul(
        tags$li("Help you complete the application materials."), 
        tags$li("Provide technical support."), 
        tags$li("Connect you with training opportunities")
      ))
      
              ))
  )
))
