library(shiny)



library(dplyr)



library(leaflet)



library(DT)




shinyServer(function(input, output) {

  # Import Data and clean it

  bb_data <- read.csv("data/Cleaned_AR_TZ_BabyTrials_20092021.csv", stringsAsFactors = FALSE )

  bb_data <- data.frame(bb_data)

  bb_data$Latitude <-  as.numeric(bb_data$Lat)

  bb_data$Longitude <-  as.numeric(bb_data$Lon)
  
  bb_data=filter(bb_data, Latitude != "NA") # removing NA values
  
  # new column for the popup label

  # create a color paletter for category type in the data file

  pal <- colorFactor(pal = c("blue", "red"), domain = c("Babati", "Kongwa"))

   #bb_data <- bb_data %>%
         #filter(Vilage != "Mlali")

  # create the leaflet map  

  output$bbmap <- renderLeaflet({

      leaflet(bb_data) %>% 

      addCircles(lng = ~Longitude, lat = ~Latitude) %>% 

      addTiles() %>%

      addCircleMarkers(data = bb_data, lat =  ~Latitude, lng =~Longitude, 

                       radius = 3, popup = ~as.character(ARZone), 

                       color = ~pal(ARZone),

                       stroke = FALSE, fillOpacity = 0.8)%>%

      addLegend(pal=pal, values=bb_data$ARZone,opacity=1, na.label = "Not Available")%>%
      setView(36.65, -5.5, zoom = 8) %>%

      addEasyButton(easyButton(

        icon="fa-crosshairs", title="ME",

        onClick=JS("function(btn, map){ map.locate({setView: true}); }")))

        })

  

  #create a data object to display data

  

  output$data <-DT::renderDataTable(datatable(

      bb_data,filter = 'top'))


# Download data

  output$downloadData <- downloadHandler(
    filename = function() {
      paste("Babati_baby_trial_data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(bb_data, file, row.names = FALSE)
    }
  )


})


