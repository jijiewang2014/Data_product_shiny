require(shiny)
require(googleVis)



shinyUI(pageWithSidebar(
  headerPanel("Population Density Map (2010-2013)"),
  
  
  sidebarPanel(
   
    selectInput("yearInput", 
                label = "Please select a year.",
                choices = c("2010", "2011",
                            "2012", "2013"),
                selected = "2010")
    
    
    
    
  ),
  mainPanel(
    
    htmlOutput("doc"), #documentation about how to use the app
    
    h3(textOutput("yearTextOutput")), #output the year selected
   
    htmlOutput("gvisOutput") #disply the googleVis object.
  )
)
)
