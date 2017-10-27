# ---------------- Excecise 5 ----------------
# set seeed for reproducability
set.seed(1337)
mat = matrix(0, ncol = 5, nrow = 100)
for(i in 1:ncol(mat)){
  mat[,i] = rnorm(n = nrow(mat), sd = 3)
}

# 5.1
apply(mat, 2, sd)

# 5.2
app <- function() {
l = c()
for (i in 1:ncol(mat)) {
  l[i] = sd(mat[,i])
}
l
}

# 5.3
microbenchmark(as.list(apply(mat, 2, sd)),
               app(),
               for (i in 1:ncol(mat)) sd(mat[,i]),
               times = 1000,unit='ms')
# First: 0.13 / Second: 1.99

# 5.4
apply(mat, 2, function(x) {
  x = (x - mean(x)) / sd(x)
})
#Alerantive:
mat_stand = apply(mat, MARGIN = 2, FUN = function(x) {(x - mean(x))/sd(x)} )  
apply(mat_stand, MARGIN = 2, mean)
apply(mat_stand, MARGIN = 2, sd)

# 5.5
# Not finished
check_height_4 <- function(df) {
  
  lapply(t(df), check_height_2)
  
  
  
  for (i in 1:nrow(df)){
    apply(df[i,],check_height_2)
  }
  df2 = data.frame(df['names'],l)
}
check_height_4(df)

#Alternativ:
check_height_4 <- function(df)
{
  height_vector = apply(df, MARGIN = 1,
                                              FUN = function(student){
                                                (if (student["sex"] == "M") men_mean_height - as.numeric(student["height"])
                                                 else women_mean_height - as.numeric(student["height"]) )
                                              } )
  output_df = data.frame("name" = student_dataframe$name, "sexspec_height_diff" = height_vector)
  return(output_df)
}    
check_height_4(df)