#Ex1-No5.

# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

#1
?as.list
outlist <- as.list(apply(mat, MARGIN = 2, FUN=sd))
outlist
#2
f <- function() {
  sdvec <- c()
  for(i in 1:ncol(mat)) {
    colsd <- sd(mat[,i])
    sdvec <- c(sdvec,colsd)
  }
  return(as.list(sdvec))
}
f()

#3
library(microbenchmark)
microbenchmark(foo1=as.list(apply(mat, MARGIN = 2, FUN=sd)),
               foo2=f
               ,unit = "ms"
               ,times=1000L)
#second way faster ?

###TIPP: vector länge immer abgeben, und nicht als empty. vector(length=nrow...)
#4

scaled_mat <- apply(mat,2,scale)
round(colMeans(scaled_mat),5)
apply(scaled_mat,2,sd)

#5
check_height_4 <- function(sDF) {
  names <- sDF[,"sNames"]
  diff <- sapply(sDF$sNames,check_height_2, USE.NAMES = F)
  outDF <- data.frame(names,diff)
  return(outDF)
}

check_height_4(sDF)

microbenchmark(check_height_3(sDF),
               check_height_4(sDF),
               unit="ms")
#Unit: milliseconds
#expr      min       lq     mean   median       uq      max neval
#check_height_3(sDF) 285.2665 294.5967 299.1391 295.9011 298.6073 401.8258   100
#check_height_4(sDF) 281.8758 287.1348 296.9047 288.9328 292.4257 590.8874   100