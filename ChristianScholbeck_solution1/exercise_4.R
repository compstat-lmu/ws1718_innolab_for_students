# Aufgabe 4

example_student = students[3,]
student_mean_height = mean(students$height)

check_height_1 <- function(student_mean_height, student_data) {
  
  diff = student_mean_height - student_data$height
  
  if (diff > 0)
  {
    paste0(student_data$name, " is ", abs(diff), "cm smaller than the average student")
  }
  if (diff < 0)
  {
    paste0(student_data$name, " is ", abs(diff), "cm taller than the average student") 
  }
  else
  {
    paste0(student_data$name, " is the same height as the average student")
  }
}
check_height_1(student_mean_height = student_mean_height, student_data = example_student)


####

men_mean_height = mean(students$height[students$sex == "M"])
women_mean_height = mean(students$height[students$sex == "F"])

check_height_2 <- function(student_data)
{
  student_sex = student_data$sex
  diff =  (if (student_sex == "M") men_mean_height - student_data$height 
           else women_mean_height - student_data$height) 
  
  if (diff > 0)
  {
    paste0(student_data$name, " is ", abs(diff), "cm smaller than the average ", if(student_sex == "M") "male" else "female")
  }
  if (diff < 0)
  {
    paste0(student_data$name, " is ", abs(diff), "cm taller than the average ", if(student_sex == "M") "male" else "female") 
  }
  else
  {
    paste0(student_data$name, " is the same height as the average ", if(student_sex == "M") "male" else "female")
  }
  
}

example_student = students[5, ]
check_height_2(student_data = example_student)

check_height_3 <- function(student_dataframe)
{
  output_df = data.frame("name" = student_dataframe$name)
  
  for (studentID in 1:nrow(student_dataframe))
  {
    diff =  (if (student_dataframe$sex[studentID] == "M") men_mean_height - student_dataframe$height[studentID] 
             else women_mean_height - student_dataframe$height[studentID]) 
    output_df$sexspec_height_diff[studentID] = diff
  }
  return(output_df)
}  

check_height_3(students)  

