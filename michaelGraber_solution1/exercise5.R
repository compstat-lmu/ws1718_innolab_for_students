#5
# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}



mat
li <- list()
myfun <- function(){
  li[[1]] <- apply(mat, FUN = sd, MARGIN = 2)}


li2 <- list(1)
myfunc2 <- function(){
  for(i in 1:5){
    li2[[1]][i] <- sd(mat[,i]) 
  }
}
#5.3
microbenchmark(myfun(), myfunc2(), unit = "ms")
#5.4
apply(mat, MARGIN =2, FUN=scale)
#5.5
df=students
libr
check_height_4 <- function(df){
  differ= apply(df, FUN=check_height_2, population = df)
  as.data.frame(differ)
}
check_height_4(students)