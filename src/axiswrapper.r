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

      add_labels = function(x_axis_name, y_axis_name) {
        labs(x = x_axis_name, y = y_axis_name)
      },

      set_labels_font = function(size = 15) {
        return (theme(axis.title = element_text(size = size)))
      },

      set_axis_font = function(size = 15) {
        return (theme(axis.text = element_text(size = size)))
      }
    )
  )
