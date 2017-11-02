#3.1
library(microbenchmark)
library(ggplot2)
benchmark <- microbenchmark(nodplyr=round(students$weight/students$height^2,digits = 2),
                            dplyr= mutate(students, BMI=round(weight/height,2)),
                            dplyr_pipe1=mutate(students, BMI=weight/height) %>% select(BMI) %>%round(2) %>% cbind(students),
                            dplyr_pipe2=mutate(students, BMI=weight/height) %>% mutate(BMI=round(BMI,2)),
                            unit = "ms",
                            control = list(warmup=10))
autoplot(benchmark)
# profiling is about fining bottlnecks in code and microbenchmarking is about comparing diffrent functions
