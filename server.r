library(shiny)
library(ggplot2)
library(ggvis)

# Data processing libraries
library(data.table)
library(reshape2)
library(dplyr)

library(mapproj)
library(maps)

# Load data
dt <- fread('data/gdp.csv')
world_map <- map_data("world")




shinyServer(
  function(input,output){
    
    output$gdpMap <- renderPlot({
      year = input$year
      world_map$gdp_percapita <- nchar(dt[ , year]) + sample(nrow(world_map))
      
      # Prepare map based on GDP data
      gg <- ggplot(world_map,aes(map_id=region))  
      gg <- gg + geom_map(data=world_map, map=world_map, aes(map_id=region, x=long, y=lat, fill=gdp_percapita))
      gg <- gg + scale_fill_gradient(low = "red", high = "green", guide = "colourbar")
      gg <- gg + coord_equal()
      
      print(
        gg
        
      )
    }) 
  }
)