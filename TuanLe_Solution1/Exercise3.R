#Ex1-No3.

install.packages("microbenchmark")
library(microbenchmark)       
#https://www.r-bloggers.com/using-the-microbenchmark-package-to-compare-the-execution-time-of-r-expressions/
install.packages("data.table")

?mutate
microbenchmark(fBMI(studentDF),
               mutate(sDF, BMI = round(weight/height, digits = 2))
               ,unit = "ms")
#first way faster, focus on the median time
##http://adv-r.had.co.nz/Profiling.html
##difference between benchmarking and profiling:
browseURL(url="http://adv-r.had.co.nz/Profiling.html")
browseURL(url="http://www.gettinggeneticsdone.com/2015/01/microbenchmark-package-r-compare-runtime-r-expressions.html")
#profiling: measuring perfomance
#benchmarking: comparing execution time of R expressions
install.packages("devtools")
devtools::install_github("hadley/lineprof")

#A sampling profiler stops the execution of code every few milliseconds 
#and records which function is currently executing (along with which function called that function, and so on).