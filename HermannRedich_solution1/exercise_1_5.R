library(microbenchmark)

############# 5 #############
# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}
# part 1
funk_1 <- function() {
  sds <- as.list(apply(mat, 2, sd))
  sds
}

# part 2
funk_2 <- function() {
  sds2 <- vector(length=ncol(mat))
  for(i in c(1:ncol(mat))) {
    sds2[i] <- sd(mat[,i])
  }
  as.list(sds2)
}

# part 3
microbenchmark(funk_1(), funk_2(), times=10000, unit="ms")

# part 4
scaled_mat <- apply(mat, 2, scale)
round(colMeans(scaled_mat), 2)
round(apply(scaled_mat, 2, sd),2)

# part 5
check_height_4 <- function(studenten) {
  heights <- apply(studenten, 1, function(stud) {
    ifelse(stud["sex"] == "M",
           round(mean(studenten[studenten["sex"]=="M",]$height) - as.numeric(stud["height"]), 2),
           round(mean(studenten[studenten["sex"]=="F",]$height) - as.numeric(stud["height"]), 2)
    )})
  
  as.data.frame(cbind(studenten$name, heights))
}
check_height_4(students)

microbenchmark(check_height_3(students), check_height_4(students), times=1000)
