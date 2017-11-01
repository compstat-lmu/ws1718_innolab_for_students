#excercise 2
#2.1
students <-
  read.csv(
    file = "D:\\RStudio\\exercise\\ex1\\students.csv",
    sep = ",",
    header = TRUE,
    stringsAsFactors = FALSE
  )
students
library(dplyr)
#2.2
#Select only the variables age and height
select(students, age, height)
#2.3
#Filter all men that weigh less than 80 kilos and all women younger than 25
selection <- students %>% filter(sex == "M" &
                                   weight < 80 | sex == "F" & age < 25)
selection
#2.4
#Find the tallest men amongst those that are younger than 25 using dplyr¡¯s functionality
students %>% filter(sex == "M" & age < 25) %>% select(height) %>% max
#2.5
#Add a new variable called BMI
#BMI=weight in kinos/ height in meters
students %>% mutate(BMI = round(weight / height ^ 2, digits = 2))
