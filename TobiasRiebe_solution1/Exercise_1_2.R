#Exercise 1.2
install.packages("dplyr")
library(dplyr)
#load data set
rm(students)
students <- read.table("students.csv")
#select age and height
select(students, age, height)
# Filter all men that weigh less than 80 kilos and all women younger than 25
students %>%
  filter(sex == "M" & weight < 80 | sex == "F" & age < 25)%>% 
  write.csv("selection.csv")
#tallest man younger than 25
students %>%
  filter(sex == "M" & age < 25) %>%
  arrange %>%
  filter(row_number() == 1) 
#add bmi as new variable
students %>%
  mutate(BMI = round(weight/height^2,2))