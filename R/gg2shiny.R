#' Converts ggplot2 plots into a shiny application
#'
#' @param ggplotobj the plot to be exported
#' @import shiny
#' @import graphics
#' @import ggplot2
#' @export
gg2shiny <- function(ggplotobj) {
  ggobj <- ggplotobj

  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        mainPanel(plotOutput("plot"), verbatimTextOutput("desc"))
      )
    ),
    server = function(input, output) {
      output$plot <- renderPlot(
        plot(ggobj)
      )
      output$desc <- renderPlot(
        summary(ggobj)
      )
    }
  )

}
