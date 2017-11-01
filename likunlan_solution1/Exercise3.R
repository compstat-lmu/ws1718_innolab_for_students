#ex3
install.packages("microbenchmark")
library(microbenchmark)

#3.1
microbenchmark(
  students$BMI <-
    round(students$weight / students$height ^ 2, digits = 2),
  students %>% mutate(BMI = round(weight / height ^ 2, digits = 2)),
  unit = "ms"
)

#3.2
#what is the difference between the mircobenchmarking and the profiling?
#microbenchmarking: wie schnell ist meine Funktion
#profiling: wie lang braucht Code pro Zeile / an verschiedenen Stellen, um bottlenecks zu identifizieren
