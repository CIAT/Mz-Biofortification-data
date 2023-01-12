library(shiny)

library(leaflet)

navbarPage("Collection of Maize Biofortification Surveyed Farms", theme = "solar", id="main",


           tabPanel("Read Me",includeMarkdown("readme.md")),
           
           tabPanel("Map", leafletOutput("bbmap", height=1000)),

           tabPanel("Data", DT::dataTableOutput("data"),
           downloadButton("downloadData", "Download")))
           
           

