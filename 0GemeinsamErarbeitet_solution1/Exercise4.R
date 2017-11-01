# Exercise 4

# First, read Hadley Wickhamâs post on functions.
# 1. Write a function check_height_1() that checks if a person is taller than the mean height of the studentpopulation.
# The function prints the name of the person and its difference from the average student-height
# in cm indicating if the person is smaller or taller than the average student (e.g.: Maria is 20 cm smaller
#                                                                               than the average student). The function takes the previously calculated student_mean_height as an
# input variable next to one row of the students data frame. (Hint: use paste0() for concatenation of
#                                                             different arguments in one printed line)

students

check_height_1 <- function(student_mean, student) {
  diff_height <- round(student$height - student_mean, 2) * 100
  smaller_or_taller <- ifelse(diff_height < 0, "smaller", "taller")
  
  print(paste0(as.character(student$name), " is ", abs(diff_height), " cm ",
               smaller_or_taller, " than the average."))
}
check_height_1(mean(students$height), students[5,])
check_height_1(1.68, students[6,])

# 2. Include the distinction in men and women in the function check_height_2(), use sex-specific means
# and incorporate that in the printed output (e.g.: Maria is 5 cm taller than the average woman ).

check_height_2 = function (student_mean_height,row) {
  diff = row[,"height"]-student_mean_height
  if(row[,"sex"]=="F"){sex="woman"}
  else{sex="man"}
  if (diff>0) {
    s = paste0(row[,"name"]," is ",diff*100, "cm taller than the average ",sex)
  }
  else{
    s = paste0(row[,"name"]," is ",-diff*100, "cm smaller than the average ",sex)
  }
  s
}

check_height_2<- function(x){
  female_height_mean<-mean(x$height[x$sex=="F"])
  female_height_diff<-round(x$height[x$sex=="F"] - female_height_mean,2)
  for (i in 1:length(female_height_diff)){
    if (female_height_diff[i]<0){
      (paste(x$name[x$sex=="F"][i],"is",abs(female_height_diff[i]),"m smaller then the average female student."))
    }
    else {(paste(x$name[x$sex=="F"][i],"is",abs(female_height_diff[i]),"m bigger then the average female student."))}
  }
  male_height_mean<-mean(x$height[x$sex=="M"])
  male_height_diff<-round(x$height[x$sex=="M"] - male_height_mean,2)
  for (i in 1:length(male_height_diff)){
    if (male_height_diff[i]<0){
      (paste(x$name[x$sex=="M"][i],"is",abs(male_height_diff[i]),"m smaller then the average male student."))
    }
    else {(paste(x$name[x$sex=="M"][i],"is",abs(male_height_diff[i]),"m bigger then the average male student."))}
  }
  
}
check_height_2(students)

# Debug Modus in R
check_height_2(students[1,])
debug(check_height_2) # an
undebug(check_height_2) # aus

# 3. Rewrite the function into check_height_3() such that it takes the whole data frame as input and
# returns a data frame in which the name of the students and the corresponding difference to their
# sex-specific average height is stored. Use a simple for-loop and the structure of your previously defined
# functions for this implementation.