excesiceCode <- function(){
  mat = matrix(0, ncol = 5, nrow = 100)
  for(i in 1:ncol(mat)){
    mat[,i] = rnorm(n = nrow(mat), sd = 3)
  }
}

myCode <- function(){
  vec = rnorm(n=500, sd=3)
    mat=matrix(vec, ncol = 5, nrow = 100)
}


microbenchmark::microbenchmark(excesiceCode(),myCode(), unit="ms")

