# Aufgabe 5
# set seeed for reproducability

set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)

for(i in 1:ncol(mat)){
  2
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

mat

apply(mat, MARGIN = 2, FUN = sd)

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

library(microbenchmark)
microbenchmark(std_calc, apply(mat, MARGIN = 2, FUN = sd), unit = "ms")  

mat
mat_stand = apply(mat, MARGIN = 2, FUN = function(x) {(x - mean(x))/sd(x)} )  
mat_stand

apply(mat_stand, MARGIN = 2, mean)
apply(mat_stand, MARGIN = 2, sd)
# Columns standardized


men_mean_height = mean(students$height[students$sex == "M"])
women_mean_height = mean(students$height[students$sex == "F"])

check_height_4 <- function(student_dataframe)
{
  height_vector = c() 
  height_vector = append(height_vector, apply(student_dataframe, MARGIN = 1, 
                                              FUN = function(student){
                                                (if (student["sex"] == "M") men_mean_height - as.numeric(student["height"]) 
                                                 else women_mean_height - as.numeric(student["height"]) ) 
                                              } ) )
  output_df = data.frame("name" = student_dataframe$name, "sexspec_height_diff" = height_vector)
  
  return(output_df)
}    

as.numeric("1.79")

check_height_4(students)
check_height_4(students) == check_height_3(students)

microbenchmark(check_height_3(students), check_height_4(students), unit = "ms")



