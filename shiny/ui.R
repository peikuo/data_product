library(shiny)
shinyUI(
  fluidPage(
    titlePanel("Motor Trend Car Road Tests Result"),
    
    sidebarLayout(
      sidebarPanel(
        t("Choose number of cylinders and displacement to get the result of miles per gallon each car"),
        br(),
        br(),
        radioButtons("cyl", "Number of cylinders:",
                     c("4" = "4",
                       "6" = "6",
                       "8" = "8")
                     ),
        
        br(),
        
        sliderInput("range", "Displacement",
                    min = 60, max = 500, value = c(100,400)
                    ),
        br()
      ),
      mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Plot Result", plotOutput("plot")), 
                    tabPanel("Table Result", tableOutput("table"))
        )
      )
    )
  )
)
        