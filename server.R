# server.R
require(googleVis)
require(shiny)


#read data from file
country_data<-read.csv("data/worldpd.csv",header =TRUE)

shinyServer(function(input, output) {
  
#output documentation  
  output$doc<-renderText({
    "<B>Introduction:</B><br> This application is to display population density (people per sq. km of land area) by country from 2010 to 2013. The data source is from World Bank Website (http://data.worldbank.org/indicator/EN.POP.DNST).
    When you select a year from the textbox from the left pane, a map will appear in the right pane to display the world population density data of the year selected. If you mouse over the map, it will display year and population density information."
  
  })
  
# reactive function to get the input year
  myYear <- reactive({
    input$yearInput
  })
  
#provide an output to show the year selected from input  
  output$yearTextOutput <- renderText({
    myYearColumn<-paste("year", myYear())
    paste("Your have selected year", myYear())
  })
 
#display the map 
  output$gvisOutput <- renderGvis({
    
     myYearColumn<-paste("year", myYear(),sep="")
    
     gvisGeoChart(country_data, 
                    locationvar="country", colorvar=myYearColumn, hovervar="country",options=list(width=600, height=400, dataMode='regions') )
  
     
  })
})
