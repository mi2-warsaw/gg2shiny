#' Converts ggplot2 plots into a shiny application
#'
#' @param ggplot the plot to be exported
#' @import shiny
#' @import ggplot2
#' @export
gg2shiny <- function(ggplot) {

  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        sidebarPanel(sliderInput("n", "Bins", 5, 100, 20)),
        mainPanel(plotOutput("plot"))
      )
    ),
    server = function(input, output) {
      output$plot <- renderPlot(
        ggplot2::plot(ggplot)
      )
    }
  )
}
