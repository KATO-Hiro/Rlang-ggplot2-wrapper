# Generic functions for strings.
# coded by RPubs xx/xx/xx

# See:
# https://rpubs.com/hoxo_m/5731

# Usage:
# source("path/operator.r")
# s <- Strings.join("hoge", "foo", ...)

# Enable string concatenation.
Strings.join <- function(..., f) {
  # Only strings
  if (missing(f))
    f <- paste(rep("%s", length(c(...))), collapse = "")

  # When a format is specified.
  sprintf(fmt = f, ...)
}
