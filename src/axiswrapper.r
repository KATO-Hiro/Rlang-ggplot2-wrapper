require(R6)
require(ggplot2)

# See:
# https://cran.r-project.org/web/packages/R6/R6.pdf
# https://adv-r.hadley.nz/r6.html
# https://ggplot2.tidyverse.org/reference/scale_continuous.html
AxisWrapper <-
  R6Class("AxisWrapper",
    public = list(
      initialize = function() {
      },

      add_labels = function(x_axis_name, y_axis_name) {
        return (labs(x = x_axis_name, y = y_axis_name))
      },

      set_labels_font = function(size = 15) {
        return (theme(axis.title = element_text(size = size)))
      },

      # lower_and_upper: modify the axis limits.
      # ticks          : choose where the ticks appear.

      # example:
      # modify_x_axis(lower_and_upper = c(1.0, 7.0),
      #               breaks = seq(1.0, 7.0, 0.5),
      #               expand = c(0, 0))
      # seq(min_value, max_value, span)
      modify_x_axis = function(lower_and_upper, ticks) {
        return (scale_x_continuous(limits = lower_and_upper,
                                   breaks = ticks,
                                   expand = c(0, 0))
        )
      },

      modify_y_axis = function(lower_and_upper, ticks) {
        return (scale_y_continuous(limits = lower_and_upper,
                                   breaks = ticks,
                                   expand = c(0, 0))
        )
      },

      set_axis_font = function(size = 15) {
        return (theme(axis.text = element_text(size = size)))
      }
    )
  )

AxisWrapperTimeSeries <-
  R6Class("AxisWrapper",
    inherit = AxisWrapper,

    public = list(
      # Require: The below library is needed.
      # require(scales)
      # ticks: scale interval.

      # example:
      # breaks = date_breaks("30 days")
      modify_x_axis = function(lower_and_upper, ticks) {
        return (scale_x_datetime(breaks = ticks))
      }
    )
  )