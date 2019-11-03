# install.packages("R6")
# install.packages("tidyverse")

require(R6)
require("tidyr")
require("reshape2")
require("tidyverse")

source("graphwrapper.r")
source("pdfcreator.r")
source("renderer.r")

main <- function(){
  pdf <- PDFCreator$new(my_name = "sample")
  pdf$open()
  renderer <- Renderer$new()

  file_name <- "sample.csv"
  sample_data <- read.csv(file_name)
  aes <- aes(x = sample_data$x_axis_values,
             y = sample_data$y_axis_values,
             fill = "")
  g <- make_a_scatter_plot(data = sample_data,
                           aes = aes,
                           title = "TODO: Write title.")

  renderer$add_graph_object(g)

  # dummy line data.
  # https://mrunadon.github.io/%E6%A6%82%E8%A6%81%E3%82%92%E3%81%8A%E3%81%95%E3%81%88%E3%81%A6ggplot2%E3%82%92%E4%BD%BF%E3%81%84%E3%81%93%E3%81%AA%E3%81%99%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB%E3%81%A8%E3%82%B3%E3%83%BC%E3%83%89%E9%9B%86/
  df_temperature <- data.frame(Temperature = rgamma(365, 15, 2)) %>%
    dplyr::mutate(Lower = Temperature - 10,
                  Upper = Temperature + 15,
                  Date = as.POSIXct(seq(as.Date("2019-01-01"),
                                        as.Date("2019-12-31"),
                                        by = "days")))
  aes <- aes(x = Date,
             y = Temperature)
  g <- make_a_line_graph(data = df_temperature,
                         aes = aes,
                         title = "TODO: Write title.")

  renderer$add_graph_object(g)

  aes <- aes(x = Date,
             y = Temperature,
             fill = "")

  g <- make_a_bar_graph(data = df_temperature,
                        aes = aes,
                        title = "TODO: Write title.")

  renderer$add_graph_object(g)

  aes <- aes(x = Temperature,
             fill = "")

  g <- make_a_histgram(data = df_temperature,
                       aes = aes,
                       title = "TODO: Write title.")

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

make_a_line_graph <- function(data, aes, title) {
  require(scales)

  line_graph <- LineGraphWrapper$new(data, aes)
  g <- line_graph$get_graph_object()

  canvas <- line_graph$add_canvas()
  g <- g + canvas$initialize_background()
  g <- g + canvas$add_title(title)
  g <- g + canvas$add_margin()

  axis <- line_graph$add_axis()
  g <- g + axis$add_labels(x_axis_name = "TODO: Write x axis label name.",
                           y_axis_name = "TODO: Write y axis label name.")
  g <- g + axis$set_labels_font()
  g <- g + axis$modify_x_axis(ticks = date_breaks("90 days"))
  g <- g + axis$modify_y_axis(lower_and_upper = c(0, 20),
                              ticks = seq(0, 20, 2))
  g <- g + axis$set_axis_font()

  return (g)
}

make_a_bar_graph <- function(data, aes, title) {
  bar_graph <- BarGraphWrapper$new(data, aes)
  g <- bar_graph$get_graph_object()

  canvas <- bar_graph$add_canvas()
  g <- g + canvas$initialize_background()
  g <- g + canvas$add_title(title)
  g <- g + canvas$add_margin()

  axis <- bar_graph$add_axis()
  g <- g + axis$add_labels(x_axis_name = "TODO: Write x axis label name.",
                           y_axis_name = "TODO: Write y axis label name.")
  g <- g + axis$set_labels_font()
  g <- g + axis$modify_x_axis(ticks = date_breaks("90 days"))
  g <- g + axis$modify_y_axis(lower_and_upper = c(0, 20),
                              ticks = seq(0, 20, 2))
  g <- g + axis$set_axis_font()

  g <- g + scale_fill_manual(name = "",
                             values = c("darkblue"),
                             labels = c("TODO: Write label name"))
  legend <- bar_graph$add_legend()
  g <- g + legend$set_position(c(0.25, 0.9))
  g <- g + legend$set_font()
  g <- g + legend$set_edge()

  return (g)
}

make_a_histgram <- function(data, aes, title) {
  histgram <- HistgramWrapper$new(data, aes)
  g <- histgram$get_graph_object()

  canvas <- histgram$add_canvas()
  g <- g + canvas$initialize_background()
  g <- g + canvas$add_title(title)
  g <- g + canvas$add_margin()

  axis <- histgram$add_axis()
  g <- g + axis$add_labels(x_axis_name = "TODO: Write x axis label name.",
                           y_axis_name = "TODO: Write y axis label name.")
  g <- g + axis$set_labels_font()
  g <- g + axis$modify_x_axis(lower_and_upper = c(0.0, 20.0),
                              ticks = seq(0.0, 20.0, 2))
  g <- g + axis$modify_y_axis(lower_and_upper = c(0, 50),
                              ticks = seq(0, 50, 5))
  g <- g + axis$set_axis_font()

  g <- g + scale_fill_manual(name = "",
                             values = c("green"),
                             labels = c("TODO: Write label name"))
  legend <- histgram$add_legend()
  g <- g + legend$set_position(c(0.25, 0.9))
  g <- g + legend$set_font()
  g <- g + legend$set_edge()

  return (g)
}

main()
