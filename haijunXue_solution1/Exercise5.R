set.seed(1337)
mat = matrix(0,ncol=5,nrow = 100)
mat
for(i in 1: ncol(mat)){
  mat[,i] = rnorm(n=nrow(mat),sd=3)
}
mat
#5.1
apply( mat,2,sd)
#5.2
app <- function(){
  l = c()
  for(i in 1:ncol(mat)){
    l[i] = sd(mat[,i])
  }
  l
}
app()

#5.3

microbenchmark(as.list(apply(mat,2,sd)),
               app(),
               for(i in 1:ncol(mat)) sd(mat[,i]),
               times = 1000,unit='ms')

#5.4
apply(mat,2,function(x){
  x = (x-mean(x))/sd(x)
})

#Alternative
mat_stand = apply(mat,MARGIN = 2,FUN = function(x){(x-mean(x))/sd(x)})

apply(mat_stand,MARGIN = 2,mean)
apply(mat_stand,MARGIN = 2,sd)

#5.5
check_height_4 <- function(df) {
  
  
  
  
  
  
  apply(df,1,check_height_2)
  
  df2 = data.frame(df['names'],l)
}
check_height_4(df)


#alternative
#            -----------------5
check_height_4 <- function(student_dataframe)
{
  
  height_vector =  apply(student_dataframe, MARGIN = 1,
                         FUN = function(student){
                           (if (student["sex"] == "M") 1.2 - as.numeric(student["height"])
                            else 1.3 - as.numeric(student["height"]) )
                         } ) 
  output_df = data.frame("name" = student_dataframe$name, "sexspec_height_diff" = height_vector)
  
  return(output_df)
}    

check_height_4(students)

x <- 1:10
x
append(x,pi)
