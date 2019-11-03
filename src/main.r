# install.packages("R6")
# install.packages("tidyverse")

require(R6)
require("tidyr")
require("reshape2")

source("graphwrapper.r")
source("renderer.r")

main <- function(){
  file_name <- "sample.csv"
  sample_data <- read.csv(file_name)
  aes <- aes(x = sample_data$seismic_intensity,
             y = sample_data$duration)

  scatter_plot <- ScatterPlotWrapper$new(sample_data, aes)
  g <- scatter_plot$get_graph_object()

  canvas <- scatter_plot$add_canvas()
  g <- g + canvas$initialize_background()

  grid <- scatter_plot$add_grid()
  g <- g + grid$set_default()

  x_axis <- scatter_plot$add_x_axis()
  y_axis <- scatter_plot$add_y_axis()
  print(g)

  # bar.hwy.ic.Tohoku_2011 <-
  #   format_for_ggplot(fig = hwy.ic.Tohoku_2011,
  #                     row_names = seismic_intensity_range,
  #                     fig_col_names = c("No_suspension_(low_seismic_intensity_area)", "No_suspension", "Suspension"),
  #                     fig_df_col_names = c("JMA_seismic_intensity", "status", "frequency"))

#   renderer <- Renderer$new()

#   for (i in 1:3) {
#     renderer$add_graph_object(g)
#   }

#   renderer$render_graph_objects()
}

# format_for_ggplot <- function(fig, row_names, fig_col_names, fig_df_col_names) {
#   # Generate data frame object of figure for ggplot2.
#   #
#   # fig             : figure ojbects.
#   # row_names       : row label name in figure objects.
#   # fig_col_names   : column label name in figure objects.
#   # fig_df_col_names: column label name in data frame for ggplot2.
#   rownames(fig) <- row_names
#   colnames(fig) <- fig_col_names

#   # Convert format to ajust ggplot2.
#   fig.df <- melt(fig)
#   colnames(fig.df) <- fig_df_col_names

#   return (fig.df)
# }

main()
