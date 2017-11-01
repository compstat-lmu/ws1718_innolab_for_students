# Exercise 5

# The apply function family is a more efficient alternative to writing loops in R. Familiarize yourself with the
# functioning and structure of the several apply functions (sapply, vapply, mapply, lapply, apply) and then
# solve the following tasks:
#   1. the following code snippet creates a matrix of 5 variables radomly sampled from a normal distribution:Exercise 5

# set seeed for reproducability
set.seed(1337)

mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

# 1. We are interested in the standard deviations of the single columns. Calculate them using apply() and
# sd() and store them in a list.

outlist <- as.list(apply(mat, MARGIN = 2, FUN=sd))
outlist

# 2. Solve the same task with a simple for loop.
std_calc <- function()
{
  std = c()
  for (col in 1:ncol(mat))
  {
    std[col] = (sd(mat[, col] ) )  
  }
  return(std)
}
std_calc()

std_calc2 <- function()
{
  std = vector(length = ncol(mat))
  for (col in 1:ncol(mat))
  {
    std[col] = (sd(mat[, col] ) )  
  }
  return(std)
}

# 3. Compare the performance of the two solutions via microbenchmark, again use milliseconds as unit -
# who wins the competition?

library(microbenchmark)
app_c = microbenchmark(
  bmi_1 = as.list(apply(mat, MARGIN = 2, FUN=sd)),
  bmi_2 =std_calc(),
  bmi_3 = std_calc2(),
  unit="ms", times = 1000
)
app_c

sessionInfo()

# 4. Standardize the 5 variables such that they have zero mean and a standard deviation of 1. Use apply
# and the inherit function option for this task. Double check the resulting standardized matrix.

mat_stand = apply(mat, MARGIN = 2, FUN = function(x) {(x - mean(x))/sd(x)} )  
mat_stand

apply(mat_stand, MARGIN = 2, mean)
apply(mat_stand, MARGIN = 2, sd)
# Columns standardized

scaled_mat <- apply(mat,2,scale)
round(colMeans(scaled_mat),5)
apply(scaled_mat,2,sd)

# 5. Rewrite the function check_height_3() such that it uses an apply() command to check the height of
# the students internally. Store the new function as check_height_4(). 
#Compare the performances of
# check_height_3() and check_height_4() on the students data set.

check_height_4 <- function(student_dataframe)
{
  height_vector = apply(student_dataframe, MARGIN = 1,
                        FUN = function(student){
                          (if (student["sex"] == "M") 1.85 - as.numeric(student["height"])
                           else 1.68 - as.numeric(student["height"]) )
                        } ) 
  output_df = data.frame("name" = student_dataframe$name, "sexspec_height_diff" = height_vector)
  
  return(output_df)
}    

check_height_4(students)
microbenchmark(check_height_2(students), check_height_4(students), unit = "ms")