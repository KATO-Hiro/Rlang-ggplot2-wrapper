# Graph wrapper for ggplot2.

# Usage:
##  Install these packages as needed.
#  install.packages("R6")
#  install.packages("tidyverse")
#
##  Import libraries and helper files.
#  require(R6)
#  require("tidyr")
#  require("reshape2")
#
#  source("graphwrapper.r")
#  source("renderer.r")
#
##  Prepare data and convert its format for ggplot2.
#
##  Make a scatter plot.
#  scatter_plot <- ScatterPlotWrapper$new(data, aes)
#  g <- scatter_plot$get_graph_object()
#
#  canvas <- scatter_plot$add_canvas()
#  g <- g + canvas$initialize_background()
#  g <- g + canvas$add_title(title)
#  g <- g + canvas$add_margin()
#
#  axis <- scatter_plot$add_axis()
#  g <- g + axis$add_labels(x_axis_name = "TODO: Write x axis label name.",
#                           y_axis_name = "TODO: Write y axis label name.")
#  g <- g + axis$set_labels_font()
#  g <- g + axis$modify_x_axis(lower_and_upper = c(1.0, 7.0),
#                              ticks = seq(1.0, 7.0, 0.5))
#  g <- g + axis$modify_y_axis(lower_and_upper = c(0, 80),
#                              ticks = seq(0, 80, 10))
#  g <- g + axis$set_axis_font()
#
#  g <- g + scale_fill_manual(name = "",
#                             values = c("green"),
#                             labels = c("TODO: Write label name"))
#  legend <- scatter_plot$add_legend()
#  g <- g + legend$set_position(c(0.25, 0.9))
#  g <- g + legend$set_font()
#  g <- g + legend$set_edge()
#
#  grid <- scatter_plot$add_grid()
#  g <- g + grid$set_default()
#
#  print(g)

require(R6)
require(ggplot2)

source("axiswrapper.r")
source("canvas.r")
source("gridwrapper.r")
source("legendwrapper.r")

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
GraphWrapper <-
  R6Class("GraphWrapper",
    private = list(
      graph_object = NA
    ),

    public = list(
      initialize = function(data, aes) {
        private$graph_object <- ggplot(data)
      },

      add_geom = function(aes) {

      },

      get_graph_object = function() {
        return (private$graph_object)
      },

      add_canvas = function() {
        return (Canvas$new())
      },

      add_axis = function() {
        return (AxisWrapper$new())
      },

      add_legend = function() {
        return (LegendWrapper$new())
      },

      add_grid = function() {
        return (GridWrapper$new())
      }
    )
  )

ScatterPlotWrapper <-
  R6Class("ScatterPlotWrapper",
    inherit = GraphWrapper,

    public = list(
      initialize = function(data, aes) {
        super$initialize(data)
        self$add_geom(aes)
      },

      add_geom = function(aes) {
        private$graph_object <- private$graph_object + geom_point(aes)
      }
    )
  )

LineGraphWrapper <-
  R6Class("LineGraphWrapper",
    inherit = GraphWrapper,

    public = list(
      initialize = function(data, aes) {
        super$initialize(data)
        self$add_geom(aes)
      },

      add_geom = function(aes) {
        private$graph_object <- private$graph_object + geom_line(aes)
      },

      add_axis = function() {
        return (AxisWrapperTimeSeries$new())
      }
    )
  )

BarGraphWrapper <-
  R6Class("BarGraphWrapper",
    inherit = GraphWrapper,

    public = list(
      initialize = function(data, aes) {
        super$initialize(data)
        self$add_geom(aes)
      },

      add_geom = function(aes) {
        private$graph_object <-
          private$graph_object + geom_bar(aes, stat = "identity")
      },

      add_axis = function() {
        return (AxisWrapperTimeSeries$new())
      }
    )
  )

HistgramWrapper <-
  R6Class("HistgramWrapper",
    inherit = GraphWrapper,

    public = list(
      initialize = function(data, aes) {
        super$initialize(data)
        self$add_geom(aes)
      },

      add_geom = function(aes) {
        private$graph_object <-
          private$graph_object + geom_histogram(aes)
      }
    )
  )