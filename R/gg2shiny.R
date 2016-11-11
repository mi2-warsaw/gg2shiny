#' Converts ggplot2 plots into a shiny application
#'
#' @param ggplotobj the plot to be exported
#' @import shiny
#' @import graphics
#' @import ggplot2
#' @examples
#' \dontrun{
#' library(gg2shiny)
#' library(ggplot2)
#' pl <- ggplot(iris, aes(Sepal.Length, Petal.Length))+geom_point()
#' gg2shiny(pl)
#' }
#' @export
gg2shiny <- function(ggplotobj) {
  ggobj <- ggplotobj

  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        sidebarPanel(p(".")),
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
