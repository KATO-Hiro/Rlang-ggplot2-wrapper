require(R6)
require(ggplot2)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
Canvas <-
  R6Class("Canvas",
    public = list(
      initialize_background = function() {
        return (theme_bw())
      },

      add_title = function(main_title = "") {
        return (labs(title = main_title))
      }
    )
  )
