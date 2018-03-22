#Require shiny
library(shiny)

#Define the functionality of the user interface
shinyUI(fluidPage(
  
  # Add a descriptive application title
  titlePanel("Selecting Your Cereal"),
  
  # Add the app interactivity
  sidebarLayout(
    sidebarPanel(
      #selectInput Manufacturer #inputID = Manufacturer
      selectInput(inputId = "manufacturer",
                  label = "Manufacturer:",
                  choices = c("American Home Food Products", "General Mills", "Kelloggs", "Nabisco", "Post", "Quaker Oats", "Ralston Purina", "All"),
                  selected = "All"),

      #selectInput for calorie amount #inputID = calories
      selectInput(inputId = "calories",
                  label = "Calorie count:",
                  choices = c("100 and less", "100 - 125", "Over 125"),
                  selected= "100 and less"),
      
      #selectInput for x-axis
      selectInput(inputId = "x",
                  label = "Change nutritional value:",
                  choices = c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbs", "Sugars", "Potassium", "Vitamins"),
                  selected= "Calories")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      #give your plot a descriptive name
       plotOutput("rolePlot")
    )
  )
))