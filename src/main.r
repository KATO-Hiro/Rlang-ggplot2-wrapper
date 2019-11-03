# install.packages("R6")
# install.packages("tidyverse")

require(R6)
require("tidyr")
require("reshape2")

source("graphwrapper.r")
source("pdfcreator.r")
source("renderer.r")

main <- function(){
  file_name <- "sample.csv"
  sample_data <- read.csv(file_name)
  aes <- aes(x = sample_data$x_axis_values,
             y = sample_data$y_axis_values,
             fill = "")
  g <- make_a_scatter_plot(data = sample_data,
                           aes = aes,
                           title = "TODO: Write title.")

  pdf <- PDFCreator$new(my_name = "sample")
  pdf$open()

  renderer <- Renderer$new()
  renderer$add_graph_object(g)
  renderer$add_graph_object(g)
  renderer$render_graph_objects()

  pdf$close()
}

make_a_scatter_plot <- function(data, aes, title) {
  scatter_plot <- ScatterPlotWrapper$new(data, aes)
  g <- scatter_plot$get_graph_object()

  canvas <- scatter_plot$add_canvas()
  g <- g + canvas$initialize_background()
  g <- g + canvas$add_title(title)
  g <- g + canvas$add_margin()

  axis <- scatter_plot$add_axis()
  g <- g + axis$add_labels(x_axis_name = "TODO: Write x axis label name.",
                           y_axis_name = "TODO: Write y axis label name.")
  g <- g + axis$set_labels_font()
  g <- g + axis$modify_x_axis(lower_and_upper = c(1.0, 7.0),
                              ticks = seq(1.0, 7.0, 0.5))
  g <- g + axis$modify_y_axis(lower_and_upper = c(0, 80),
                              ticks = seq(0, 80, 10))
  g <- g + axis$set_axis_font()

  g <- g + scale_fill_manual(name = "",
                             values = c("green"),
                             labels = c("TODO: Write label name"))
  legend <- scatter_plot$add_legend()
  g <- g + legend$set_position(c(0.25, 0.9))
  g <- g + legend$set_font()
  g <- g + legend$set_edge()

  grid <- scatter_plot$add_grid()
  g <- g + grid$set_default()

  return (g)
}

main()
