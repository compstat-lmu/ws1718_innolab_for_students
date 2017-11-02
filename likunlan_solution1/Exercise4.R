#exercise 4
#4.1
#Write a function
#checks if a person is taller than the mean height of the students
# prints the name of the person and the difference
#Maria is 20 cm smaller than the average student
check_height_1 <- function(students_mean, students) {
  diff_height <- round(students$height - students_mean, 2) * 100
  smaller_or_taller <- ifelse(diff_height < 0, "smaller", "taller")
  
  print(paste0(
    as.character(students$name),
    " is ",
    abs(diff_height),
    " cm ",
    smaller_or_taller,
    " than the average."
  ))
  
}
check_height_1(mean(students$height), students[6, ])
check_height_1(mean(students$height), students[1, ])


#4.2
#Include the distinction in men and women in the function check_height_2(), use sex-specific means
#and incorporate that in the printed output (e.g.: Maria is 5 cm taller than the average woman ).
check_height_2 <- function(test) {
  man_mean_height = mean(students[students['sex'] == 'M', ][['height']])
  female_mean_height = mean(students[students['sex'] == 'F', ][['height']])
  man_diff_height <- round(test$height - man_mean_height, 2) * 100
  female_diff_height <-
    round(test$height - female_mean_height, 2) * 100
  if (test$sex == 'M') {
    smaller_or_taller <-
      ifelse(man_diff_height < 0, "smaller", "taller")
    
    print(
      paste0(
        as.character(test$name),
        " is ",
        abs(man_diff_height),
        " cm ",
        smaller_or_taller,
        " than the average man."
      )
    )
    
  } else{
    smaller_or_taller <-
      ifelse(female_diff_height < 0, "smaller", "taller")
    
    print(
      paste0(
        as.character(test$name),
        " is ",
        abs(female_diff_height),
        " cm ",
        smaller_or_taller,
        " than the average women."
      )
    )
    
  }
}
check_height_2(students[3, ])
check_height_2(students[5, ])


#4.2 Alternativ
check_height_2 <- function(x) {
  female_height_mean <- mean(x$height[x$sex == "F"])
  female_height_diff <-
    round(x$height[x$sex == "F"] - female_height_mean, 2)
  for (i in 1:length(female_height_diff)) {
    if (female_height_diff[i] < 0) {
      print(paste(
        x$name[x$sex == "F"][i],
        "is",
        abs(female_height_diff[i]),
        "m smaller then the average female student."
      ))
    }
    else {
      print(paste(
        x$name[x$sex == "F"][i],
        "is",
        abs(female_height_diff[i]),
        "m bigger then the average female student."
      ))
    }
  }
  male_height_mean <- mean(x$height[x$sex == "M"])
  male_height_diff <- round(x$height[x$sex == "M"] - male_height_mean, 2)
  for (i in 1:length(male_height_diff)) {
    if (male_height_diff[i] < 0) {
      print(paste(
        x$name[x$sex == "M"][i],
        "is",
        abs(male_height_diff[i]),
        "m smaller then the average male student."
      ))
    }
    else {
      print(paste(
        x$name[x$sex == "M"][i],
        "is",
        abs(male_height_diff[i]),
        "m bigger then the average male student."
      ))
    }
  }
  
}
check_height_2(students)
#debug  check_height_2(student())

#4.3
#Rewrite the function into check_height_3() such that it takes the whole data frame as input and
#returns a data frame in which the name of the students and the corresponding difference to their
#sex-specific average height is stored. Use a simple for-loop and the structure of your previously defined
#functions for this implementation.
check_height_3 <- function(x) {
  v = c()
  for (i in 1:nrow(x)) {
    v[i] = check_height_2(x[i, ])
  }
  diff = v
  
  new.students = data.frame(names = x$names, diff)
  
  print(new.students)
  
}
check_height_3(students)