#EXERCISE 3
#1. Compare the performance of the creation of the BMI variable.

library(microbenchmark)

mbm<-microbenchmark(bmi = (weight / height*height), bmi1 = (weight/height), unit = 'ms')


microbenchmark(bmiPipe = students %>%
                 mutate(BMI = round(students$weight/students$height^2,2)), 
               bmiOhnePipe = students$bmi <- round((students$weight)/(students$height)^2,2), unit = 'ms')


#check
library(ggplot2)
autoplot(mbm)

#microbenchmarking - hier sieht man, wie schnell ist ein Code
#profiling - hier kann man nicht nur sehen, wie schnell ein Code ist, sondern auch den optimieren.


#EXERCISE 4

#1.Person is taller than the mean height.

(student_mean_height <- mean(students$height))
check_height_1 <- function(student_mean, student) {
  diff_height <- round(student$height - student_mean, 2) * 100
  smaller_or_taller <- ifelse(diff_height < 0, "smaller", "taller")
  print(paste0(as.character(student$name), " is ", abs(diff_height), " cm ",
               smaller_or_taller, " than the average."))
}

check_height_1(mean(students$height), students[,])

#2. Compare person to gender specific heigth
check_height_2 <- function(number_of_row){
  #calculate the mean heigth of the gender chosen
  mean_height = as.numeric(students %>%
                             group_by(sex) %>%
                             summarise(mean(height)) %>%
                             filter(sex == students[number_of_row,"sex"]) %>%
                             select("mean(height)"))
  height_diff = round((students[number_of_row,"height"] - mean_height)*100, 2)
  if (students[number_of_row, "sex"]  == "F")
    gender = "female"
  else
    gender = "male"
  if (height_diff > 0){
    paste0(students[number_of_row,"names"] , " is ", height_diff, " cm taller than the average ", gender)
  }
  else if (height_diff < 0){
    paste0(students[number_of_row,"names"] , " is ", -height_diff, " cm smaller than the average ", gender)
  }
  else
    paste0(students[number_of_row,"names"] , " is as tall as the average ", gender)
}
check_height_2(1)

#3. Usea simple for-loop
height_diff <- round(students$height - mean(students$height), 2) * 100

(check_height_3 <- function(students){
  for (number_of_row in 1:nrow(students)){
    #calculate mean height of gnender
    mean_height = as.numeric(students %>%
                               group_by(sex) %>%
                               summarise(mean(height)) %>%
                               filter(sex == students[number_of_row,"sex"]) %>%
                               select("mean(height)"))
    height_diff[number_of_row] <- round((students[number_of_row,"height"] - mean_height)*100, 2)
  }
  check_data_frame <- data.frame(students$name, height_diff)
  check_data_frame
})
check_height_3(students)


