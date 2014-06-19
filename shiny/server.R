library(shiny)

shinyServer(
  function(input, output) {
    data <- reactive({
      cars <- mtcars[which(mtcars$disp > input$range[1]&mtcars$disp < input$range[2]&mtcars$cyl == input$cyl), ]
    })
    
    output$table <- renderTable({
      data()[, c("cyl", "disp", "mpg")]
    })
    output$plot <- renderPlot({
      if (nrow(data()) == 0) {
        plot.new()
      } else {
        text <- paste0("Miles pre gallon used by " , input$cyl
          , " cylinders car, and displacement between " , paste(input$range[1], "and", input$range[2]))
        par(mar=c(6,6,3,5))
        barplot(data()$mpg, names.arg = rownames(data()), horiz = T, 
              cex.names = 0.9, las = 1, col=topo.colors(10), 
              xlab=text)
      }
    })
  }
)