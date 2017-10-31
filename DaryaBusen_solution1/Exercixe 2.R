#EXERCISE 2
#1. Read in the students.csv data frame.

install.packages("dplyr")
library("dplyr")

read.csv("students.csv", row.names = 1)
glimpse(students)

#2. Select only the variables age and heigt.

select(students, age, height)


#3. Filter all men that weight less than 80 kilos and all woman younger than 25.

(selection <- filter(students, sex=="M"&weight<80 | sex=="F"&age<25))

write.csv(selection, file = "selection.csv")


#4. Find the tallest men amongst those that are younger than using dplyr´s functionality.

(tallesMen<-filter(students, sex =="M"&age<25) %>% select(height) %>% max(height))                               

filter(students, age<25&sex=="M") %>% arrange(desc(height))

#5. Add a new variable BMI.

students %>% mutate(bmi = round((students$weight / (students$height)^2), digits = 2))