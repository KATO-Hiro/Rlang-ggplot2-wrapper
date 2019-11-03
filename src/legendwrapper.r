require(R6)
require(ggplot2)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
LegendWrapper <-
  R6Class("LegendWrapper",
    public = list(
      initialize = function() {
      },

      # place legends inside the plot using relative coordinates between 0 and 1
      # examples:
      # positon = "top"
      # positon = c(0.1, 0.9)
      set_position = function(position) {
        return (theme(legend.position = position))
      },

      set_font = function(size = 14) {
        return (theme(legend.text = element_text(size = size)))
      },

      set_edge = function() {
        return (theme(legend.box.background = element_rect(),
                      legend.box.margin = margin(1, 1, 1, 1)))
      }
    )
  )
