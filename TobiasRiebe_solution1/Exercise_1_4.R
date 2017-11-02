#Exercise 1.4
#Function to tell if a person is smaller or taller than the avergage and giving back the difference
check_height_1 <- function(number_of_row){
  student_mean_height <- mean(students$height)
  height_diff = round((students[number_of_row,"height"] - student_mean_height)*100, 2)
  if (height_diff > 0){
    paste0(students[number_of_row,"names"] , " is ", height_diff, " cm taller than the average mean")
  }
  else if (height_diff < 0){
    paste0(students[number_of_row,"names"] , " is ", -height_diff, " cm smaller than the average mean")
  }
  else
    paste0(students[number_of_row,"names"] , " is as tall as the average mean")
}
check_height_1(1)
check_height_1(3)
#Compare person to gender specific heigth
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
check_height_2(2)
check_height_2(4)
#Use the whole data frame as input
check_height_3 <- function(students){
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
}
check_height_3(students)
