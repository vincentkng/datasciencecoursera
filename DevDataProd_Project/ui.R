
library(shiny)
data(iris)

shinyUI
(
  #pageWithSidebar
  fluidPage
  (
    titlePanel("Predict Iris Species - Setosa, Viriginca, Versicolor"),
    
    sidebarPanel
    (
      numericInput('sepal.length', 'Sepal Length', value = iris[1, "Sepal.Length"], min = 0, max = 10, step = 0.1),
      numericInput('sepal.width', 'Sepal Width', value = iris[1, "Sepal.Width"], min = 0, max = 10, step = 0.1),
      
      numericInput('petal.length', 'Petal Length', value = iris[1, "Petal.Length"], min = 0, max = 10, step = 0.1),
      numericInput('petal.width', 'Petal Width', value = iris[1, "Petal.Width"], min = 0, max = 10, step = 0.1),
      
      tags$p(),
      
      actionButton("submit", "Submit"),
      #submitButton("Submit"),
      
      tags$hr(),
      
      tags$strong("Sample values: "),
      tags$ul(
        tags$li("Setosa - 5, 3, 1, 0"), 
        tags$li("Versicolor - 5, 4, 4, 1"), 
        tags$li("Virginica - 5, 2, 5, 2")),
      
      helpText("")
    ),
    
    mainPanel
    (
      tabsetPanel(id = "tabset",
        tabPanel(title="Documentation", value="p1",  
          tags$div(
            tags$strong("Description: "),
            tags$br(),
            "This Shiny application predicts the iris species based on the following attributes:",
            tags$ul(
              tags$li("Sepal Length"), 
              tags$li("Sepal Width"), 
              tags$li("Petal Length"),
              tags$li("Petal Width")),
                   
            tags$p(),
            tags$strong("Usage:"),
            tags$ol(
              tags$li("Input the iris attributes."), 
              tags$li("Click Submit button."), 
              tags$li("The species with the highest probability will be highlighted. Refer to the class probabilities.")),
                   
            tags$p(),
            tags$strong("Note: "),
            tags$ol(
              tags$li("It will take a while to load the application and predictions"), 
              tags$li("These images are taken from http://en.wikipedia.org/wiki/Iris_flower_data_set."))
          ) # end tag$div
        ), #end tabPanel
        
        tabPanel(title="Prediction", value="p2", style = "overflow:hidden;",
          fluidRow(
            column(
              width = 3,
              imageOutput("img1", width = 220, height = 165),
              span("Iris Setosa")
            ),
                   
            column(
              width = 3,
              offset = 2,
              imageOutput("img2", width = 220, height = 165),
              span("Iris Versicolor")
            )
          ), #end fluidRow
                 
          fluidRow(
            column(
              width = 3,
              imageOutput("img3", width = 220, height = 165),
              span("Iris Virginica")
            ),
                   
            column(
              width = 3,
              offset = 2,
              id="bottom-right",
              htmlOutput("prob"),
              span("Class Probabilities")
            )
          ) #end fluidRow
        ) #end tabPanel
      ), #end tabsetpanel
      
      tags$style("#prob { height: 165px; line-height: 30px; font-size: 18px; 
                          vertical-align: middle;  display:table-cell; 
                          color: red; border-color: gray; }
                  #submit {color:white; background: DodgerBlue;}
                  hr { border-color: gray; }
                  .row-fluid {margin: 20px; }" )
    ) # end mainPanel
  ) #end fluidPage
) #end shinyUI
