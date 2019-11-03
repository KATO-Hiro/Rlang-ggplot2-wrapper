require(R6)
require(ggplot2)

source("axiswrapper.r")
source("canvas.r")
source("gridwrapper.r")

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
        # Legend class
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
