require(R6)
require(ggplot2)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
GridWrapper <-
  R6Class("GridWrapper",
    public = list(
      set_default = function() {
        results <- self$add_major_line()
        results <- results + self$add_minor_line()
        return (results)
      },

      add_major_line = function(color = "black") {
        return (theme(panel.grid.major = element_line(color)))
      },

      add_minor_line = function(color = "white") {
        return (theme(panel.grid.minor = element_line(color)))
      }
    )
  )
