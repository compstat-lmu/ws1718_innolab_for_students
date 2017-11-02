#EXERCISE 5:

# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

#1. Standard deviations of the singe columns.

sdApply<-apply(mat, 2, sd)
as.list(sdApply)

#2. Solve the same task with a simple for loop.

result <- vector("numeric", length = ncol(mat)) 
for(i in 1:ncol(mat)){
  result[i] <- sd(mat[ ,i], )
}
result 

as.list(result)

#3. Compare the performance of the two solutions via microbenchmark.

microbenchmark(result<-
                 for(i in 1:ncol(mat)){
                   result[i] <- sd(mat[ ,i], )
                 }, 
               sdApply = apply(mat, 2, sd), unit = "ms")


#4. N(0,1)

(apply(mat, MARGIN = 2, FUN = scale))

#5.Rewrite the function
check_height_4 <- function(student_dataframe)
  
{
  height_vector = c()
  height_vector = append(height_vector, apply(student_dataframe, MARGIN = 1,
                                              
                                              FUN = function(student){
                                                
                                                (if (student["sex"] == "M") 1.8 - as.numeric(student["height"])
                                                 
                                                 else 1.6 - as.numeric(student["height"]) )
                                                
                                              } ) )
  
  output_df = data.frame("name" = student_dataframe$name, "sexspec_height_diff" = height_vector)
  
  
  
  return(output_df)
  
}    



check_height_4(students)