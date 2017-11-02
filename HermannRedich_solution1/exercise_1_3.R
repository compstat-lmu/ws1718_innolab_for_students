library(microbenchmark)

############# 3 #############
# part 1
?microbenchmark
funk_old <- function(s) {
  s$bmi <- round(s$weight/s$height^2, 2)
}
funk_dplyr <- function(s) {
  s %>% mutate(bmi = round(weight/height^2, 2))
}
microbenchmark(funk_old(students), funk_dplyr(students), times=1000, unit="ms")
