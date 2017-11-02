# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

stDevs = list(apply(mat, 2, sd))

iterative <- function(matrix) {
  res = list()
  for(col in 1:ncol(matrix)) {
    res[col] = sd(matrix[,col]) 
  }
  return(res)
}

microbenchmark(
  as.list(apply(mat, 2, sd)),
  iterative(mat),
  times=1000,
  unit='ms'
)
# the performance of both is almost at the same level
# the for-loop variant is slightly better

standardized = apply(mat, 2, FUN = scale)
mean(standardized)
sd(standardized)

check_height_4 <- function(students) {
  avgHeightF = mean(students[(students$sex=="F"),2])
  avgHeightM = mean(students[(students$sex=="M"),2])
  diff <- function(student) {
    if (student["sex"] == "F") (avgHeightF - as.numeric(student["height"]))*100
    else (avgHeightM - as.numeric(student["height"]))*100
  }
  res = data.frame("name" = students$name, "sexspec_height_diff" = apply(students, 1, diff))
  return(res)
}
check_height_4(students)

microbenchmark(
  check_height_3(students),
  check_height_4(students),
  times=1000,
  unit='ms'
)
# the apply variant is in average slightly better