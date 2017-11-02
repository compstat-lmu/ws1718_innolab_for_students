# Aufgabe 3

library(microbenchmark)

# Profiling is not aimed at comparing different things: it's about understanding the behaviour of a program. A profile result might be a table of time taken per function, or even per instruction with a sampling profiler. You can tell it's a profile not a benchmark because it makes no sense to say "that function took the least time so we'll keep that one and stop using the rest".
# You use a profile to figure out where to optimize. A 10% speedup in a function where your program spends 99% of its time is more valuable than a 100% speedup in any other function. Even better is when you can improve your high-level design so the expensive function is called less, as well as just making it faster.
# Microbenchmarking is a specific form of benchmarking. It means you're testing one super-specific thing to measure just that in isolation, not the overall performance of anything that's really useful.

microbenchmark(dplyr_pipe_operator =  students %>% mutate(bmi = round(weight / (height^2), 2)), base_package  = students$bmi <- round((students$weight)/(students$height)^2,2), unit = "ms", control = list(warmup = 10), times = 1000)
