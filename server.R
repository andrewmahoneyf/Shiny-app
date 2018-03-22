#Require the following: shiny, dyplr, and ggplot2
library(shiny)
library(dplyr)
library(ggplot2)

#Load the dataset
data <- read.csv("./data/cereal.tsv", sep="\t", header=T, check.names=FALSE, stringsAsFactors = FALSE)

shinyServer(function(input, output) {
  output$rolePlot <- renderPlot({
    
    # Filter for manufacturer based on input
    if(input$manufacturer == "American Home Food Products") {
      plot.data <- data %>% filter(mfr == "A")
    } else if (input$manufacturer == "General Mills") {
      plot.data <- data %>% filter(mfr == "G")
    } else if (input$manufacturer == "Kelloggs") {
      plot.data <- data %>% filter(mfr == "K")
    } else if (input$manufacturer == "Nabisco") {
      plot.data <- data %>% filter(mfr == "N")
    } else if (input$manufacturer == "Post") {
      plot.data <- data %>% filter(mfr == "P")
    } else if (input$manufacturer == "Quaker Oats") {
      plot.data <- data %>% filter(mfr == "Q")
    } else if (input$manufacturer == "Ralston Purina") {
      plot.data <- data %>% filter(mfr == "R")
    } else {
      plot.data <- data
    }
    
    #Filter for calories based on input
    if(input$calories == "100 and less") {
      plot.data <- plot.data %>% filter(calories <= 100)
    } else if (input$calories == "100 - 125") {
      plot.data <- plot.data %>% filter(calories > 100 & calories <= 125)
    } else {
      plot.data <- plot.data %>% filter(calories > 125)
    }

    #Filter x-axis based on input
    if(input$x == "Calories") {
      x <- plot.data$calories
    } else if (input$x == "Protein") {
      x <- plot.data$protein
    } else if (input$x == "Fat") {
      x <- plot.data$fat
    } else if (input$x == "Sodium") {
      x <- plot.data$sodium
    } else if (input$x == "Fiber") {
      x <- plot.data$fiber
    } else if (input$x == "Carbs") {
      x <- plot.data$carbo
    } else if (input$x == "Sugars") {
      x <- plot.data$sugars
    } else if (input$x == "Potassium") {
      x <- plot.data$potass
    } else {
      x <- plot.data$vitamins
    }
    
    #Construct a scatterplot using ggplot2
    ggplot(plot.data, aes(x=x, y=name, color=factor(mfr))) + geom_point() + labs(x = input$x, y = "Cereal", color="Manufacturer")
    
  })
  
})