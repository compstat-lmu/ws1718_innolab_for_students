library("microbenchmark")

microbenchmark(
  round(bmi(students$weight, students$height), 2),
  mutate(students, bmi = round(weight/(height**2), 2)),
  unit ='ms',
  times = 1000
)
# The first solution is faster (mean is 0.02 vs 2.33 corr.)

# Microbenchmarking measures the time needed for an execution of a function
# and allows comparing of execution times for different functions
# while profiling is used to detect nettlebocks in the code 
# (i.e. such places in code which lead to a worse overall performance
# due to their long execution time)