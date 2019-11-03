require(R6)
require(ggplot2)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
AxisWrapper <-
  R6Class("AxisWrapper",
    public = list(
      initialize = function() {
      },

      add_label = function(x_axis_name, y_axis_name) {
        labs(x = x_axis_name, y = y_axis_name)
      }
    )
  )
