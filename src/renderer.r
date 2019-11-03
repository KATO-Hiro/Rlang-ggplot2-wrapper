require(R6)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
# http://cse.naro.affrc.go.jp/takezawa/r-tips/r/12.html
# http://takenaka-akio.org/doc/r_auto/list.html
Renderer <-
  R6Class("Renderer",
    private = list(
      graph_object_list = list()
    ),

    public = list(
      initialize = function() {
      },

      add_graph_object = function(g) {
        private$graph_object_list <- cbind(private$graph_object_list, list(g))
      },

      render_graph_objects = function() {
        for (graph_object in private$graph_object_list) {
          print(graph_object)
        }
      }
    )
  )
