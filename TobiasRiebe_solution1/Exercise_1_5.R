#Exercise 1.5
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100) 
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}
#standard deviation of columns
mat_sd <- as.list(apply(mat, 2, sd))
#sd with for loop
for (i in 1:ncol(mat)){
  mat_sd[i]<-sd(mat[i:nrow(mat),1])
}
#compare the two methods
microbenchmark(mat_sd <- as.list(apply(mat, 2, sd)), 
               for (i in 1:ncol(mat)){
                 mat_sd[i]<-sd(mat[i:nrow(mat),1])
               },
               unit = 'ms')
#the for loop is slightly quicker
#standardize data and check for correctness
mat_std <- apply(mat, 2, scale)
apply(mat_std, 2, mean)
apply(mat_std, 2, sd)
#check height function using aplly
check_height_4 <- function(students){
  students = students
  male <- students %>%
    filter(sex == "M" ) %>%
    mutate(height_mean = mean(height)) %>%
    mutate(height_diff = (height - height_mean)*100) %>%
    select(names, height_diff)
  female <- students %>%
    filter(sex == "F" ) %>%
    mutate(height_mean = mean(height)) %>%
    mutate(height_diff = (height - height_mean)*100) %>%
    select(names, height_diff)
  check_data_frame <- data.frame(rbind(male, female))
  check_data_frame
}
check_height_4(students)
microbenchmark(check_height_3(students), check_height_4(students))
#check_height_4 is 2.5 times faster
