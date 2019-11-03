# http://qiita.com/hik0107/items/e486943721e815e4e006

source("operator.r")

PDFCreator <-
  R6Class("PDFCreator",
    # Required: The initial value of the member variable.
    private = list(
      name = "",
      size = ""
    ),

    public = list(
      initialize = function(my_name, paper_size = "a4r"){
          private$name <- my_name
          private$size <- paper_size
      },

      open = function(point_size = 10){
          pdf(file = Strings.join(private$name, ".pdf"), paper = private$size)

          # Set permanent parameter.
          par(ps = point_size)
      },

      # TODO: If R6 class has destructor, this method move to it.
      # Required: The device should be closed after open method in your script.
      close = function(){
          dev.off()
      }
    )
  )
