############# 4 #############
# part 1
check_height_1 <- function(student_mean, student) {
  diff_height <- round(student$height - student_mean, 2) * 100
  smaller_or_taller <- ifelse(diff_height < 0, "smaller", "taller")
  
  print(paste0(as.character(student$name), " is ", abs(diff_height), " cm ",
               smaller_or_taller, " than the average."))
}
check_height_1(mean(students$height), students[6,])

# part 2
check_height_2 <- function(student_means, student) {
  sex_mean <- student_means %>% filter(sex == student$sex) %>% select(mean_height)
  diff_height <- round(student$height - sex_mean, 2) * 100
  smaller_or_taller <- ifelse(diff_height < 0, "smaller", "taller")
  sex <- ifelse(as.character(student$sex) == "F", "woman", "men")
  
  print(paste0(as.character(student$name), " is ", abs(diff_height), " cm ",
               smaller_or_taller, " than the average ", sex, "."))
}
check_height_2(summarise(group_by(students, sex), mean_height = mean(height)), students[4,])

# part 3
check_height_3 <- function(studenten) {
  sex_means <- summarise(group_by(studenten, sex), mean_height = mean(height))
  result <- c()
  for(s in c(1:dim(studenten)[1])) {
    stud <- studenten[s,]
    mean <- sex_means %>% filter(sex == stud$sex) %>% select(mean_height)
    result <- rbind(result, c(as.character(stud$name), round(stud$height - mean, 2) * 100))
  }
  result
}
check_height_3(students)