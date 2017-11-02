
#ex5
# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for (i in 1:ncol(mat)) {
  mat[, i] = rnorm(n = nrow(mat), sd = 3)
}
#5.1
#We are interested in the standard deviations of the single columns. Calculate them using apply() and
#sd() and store them in a list.
list <- list(apply(mat, 2, sd))
list

#5.2
#Solve the same task with a simple for loop
cal_dev <- function(m) {
  list <- list()
  for (i in 1:ncol(m)) {
    list[i] <- sd(m[, i])
  }
  print(list)
}
cal_dev(mat)


#5.2
std_calc <- function()
{
  std = c()
  for (col in 1:ncol(mat))
  {
    std[col] = (sd(mat[, col]))
  }
  return(std)
}
std_calc()


#5.3
#Compare the performance of the two solutions via microbenchmark, again use milliseconds as unit -
#who wins the competition
library(microbenchmark)
com = microbenchmark(list(apply(mat, 2, sd)),
                     cal_dev(mat),
                     unit = "ms")
print(com)
# list(apply(mat, 2, sd)) ist schneller als cal_dev(mat)

#5.4
#Standardize the 5 variables such that they have zero mean and a standard deviation of 1. Use apply
#and the inherit function option for this task. Double check the resulting standardized matrix.
st <- function(x)
{
  x = (x - mean(x)) / sd(x)
}
result = lapply(list, st)
print(result)
#check mean!=0,why?
mean(unlist(result))
sd(unlist(result))

#5.5
#Rewrite the function check_height_3() such that it uses an apply() command to check the height of
#the students internally. Store the new function as check_height_4(). Compare the performances of
#check_height_3() and check_height_4() on the students data set.

check_height_4 <- function(dfabc)
{
  man_mean_height = mean(dfabc[dfabc['sex'] == 'M', ][['height']])
  female_mean_height = mean(dfabc[dfabc['sex'] == 'F', ][['height']])
  mat <- matrix(dfabc)
  diff = apply(dfabc, 1, function(r) {
    #print(class(r['height']))
    #print(r['names'])
    #print(r)
    #print(man_mean_height)
    man_diff_height <-
      round(as.numeric(r['height']) - man_mean_height, 2) * 100
    female_diff_height <-
      round(as.numeric(r['height']) - female_mean_height, 2) * 100
    if (r['sex'] == 'M') {
      smaller_or_taller <-
        ifelse(man_diff_height < 0, "smaller", "taller")
      
      print(
        paste0(
          as.character(r['names']),
          " is ",
          abs(man_diff_height),
          " cm ",
          smaller_or_taller,
          " than the average man."
        )
      )
    } else{
      smaller_or_taller <-
        ifelse(female_diff_height < 0, "smaller", "taller")
      
      print(
        paste0(
          as.character(r['names']),
          " is ",
          abs(female_diff_height),
          " cm ",
          smaller_or_taller,
          " than the average women."
        )
      )
    }
  })
  new.students = data.frame(names = dfabc['names'], diff)
  
  print(new.students)
}
check_height_4(students)




library(microbenchmark)
com_f = microbenchmark(check_height_3(students),
                       check_height_4(students),
                       unit = "ms")
print(com_f)

#check_height_4 ist 2 mal schneller als check_height_3.