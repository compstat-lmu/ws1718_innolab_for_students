## Aufgabe 3

# Install and familiarize yourself with the microbenchmark package.
# 1. Compare the perfromance of the creation of the BMI variable from exercise 1 with exercise 2. Use the
# unit miliseconds (unit='ms'). Which solution is faster?

library(microbenchmark)

studentDF = students
fBMI <- function(df) {
  BMI <- round(studentDF[,"weight"] / studentDF[,"height"]^2, digits = 2)
  studentDF <- cbind(studentDF,BMI)
  return(studentDF)
}

microbenchmark(fBMI(students),pipe =  students %>% mutate(bmi = round(weight / (height^2), 2)), var3 = students$bmi <- round((students$weight)/(students$height)^2,2), var4 = mutate(students, bmi = round(weight / (height^2), 2)), unit = "ms", control = list(warmup = 10), times = 1000)

#   2. what is the difference between the mircobenchmarking and the profiling? Check Hadley Wickhams
# post on code optimization and answer the question in 1-2 short sentences.