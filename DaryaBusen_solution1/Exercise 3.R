#EXERCISE 3
#1. Compare the performance of the creation of the BMI variable.

library(microbenchmark)

mbm<-microbenchmark(bmi = (weight / height*height), bmi1 = (weight/height), unit = 'ms')


microbenchmark(bmiPipe = students %>%
                 mutate(BMI = round(students$weight/students$height^2,2)), 
               bmiOhnePipe = students$bmi <- round((students$weight)/(students$height)^2,2), unit = 'ms')


#check
library(ggplot2)
autoplot(mbm)

#microbenchmarking - hier sieht man, wie schnell ist ein Code
#profiling - hier kann man nicht nur sehen, wie schnell ein Code ist, sondern auch den optimieren.
