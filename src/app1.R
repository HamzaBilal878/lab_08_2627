library(shiny)
library(tidyverse)
read.csv("data/penguins.csv")

ui <- fluidPage(
  titlePanel(
    tagList(
      textOutput("title", inline = TRUE),
      "Shiny App"
    ),
    # Without this, the browser tab would show the HTML of the title above.
    windowTitle = "Shiny App"
  ),
  textInput("name", label = "Enter your Name"),
  textOutput("greeting"),
  numericInput("age", label = "Enter your age",value = 21),
  textOutput("Age"),
  selectInput("colour",label = "pick a colour",
       choices=c("red","green","yellow")),
  textOutput("Colour"))


server <- function(input, output, session) {
  output$title <- renderText(paste0(input$name, "'s"))
  output$greeting <- renderText(paste0("Hello ", input$name))
  output$Age <- renderText(paste0("you are ",input$age," years old"))
  output$Colour <- renderText({paste0("you chose ", input$colour)})
}




shinyApp(ui, server)
