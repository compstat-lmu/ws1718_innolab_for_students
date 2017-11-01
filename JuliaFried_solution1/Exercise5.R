## Ex. 5 ----

set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

# 1
matSd1 = apply(mat, MARGIN = 2, FUN = sd)
matSd1 = as.list(matSd1) 

# 2
matSd2 = list()
for (i in 1:ncol(mat)){
  matSd2[i] = sd(mat[, i])
}

# 3
microbenchmark(matSd1, matSd2, unit = "ms")

# 4 
mat_stand = apply(mat, MARGIN = 2, FUN = function(x) {(x - mean(x))/sd(x)} )  
mat_stand

apply(mat_stand, MARGIN = 2, mean)
apply(mat_stand, MARGIN = 2, sd)

# 5 
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