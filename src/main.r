main <- function(){
  print("hello world!")
  file_name <- "sample.csv"
  sample <- read.csv(file_name)
  print(sample)
}

main()
