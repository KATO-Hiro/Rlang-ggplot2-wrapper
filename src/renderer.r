require(R6)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
# http://cse.naro.affrc.go.jp/takezawa/r-tips/r/12.html
Renderer <-
  R6Class("Renderer",
    private = list(
      graph_object_list = NA
    ),

    public = list(
      initialize = function() {
        private$graph_object_list <- c()
      },

      add_graph_object = function(g) {
        private$graph_object_list <- c(private$graph_object_list, g)
      },

      render_graph_objects = function() {
        for (graph_object in private$graph_object_list) {
          print(graph_object)
        }
      }
    )
  )
