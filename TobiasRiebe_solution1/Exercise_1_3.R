#Exercise 1.3
install.packages("microbenchmark")
library(microbenchmark)
#compare BMI calculations
microbenchmark(withpipe = students %>%
                 mutate(BMI = round(weight/height^2,2)), 
               withoutpipe = students$bmi <- round((students$weight)/(students$height)^2,2), unit = 'ms')
#The solution of exercise 1 is way faster
#Profiling shows how long every line in the code needs to be computed to find potential bottlenecks. 
#Microbenchmarking compares the execution time of two different functions by executing them several times and 
#then comparing the mean time.