##2.1
students <- read.csv(file = "students.csv")
#2.2
select(students, age, height)
#2.3
filter(students, (sex=="M"&weight<80) | (sex=="F"&age<25)) %>% write.csv("selection.csv")
###How to do the line above without &????

#2.4
#Find the tallest men amongst those that are younger than 25 using dplyr's functionality.
filter(students, age<25&sex=="M") %>% arrange(desc(height))

#2.5
mutate(students, BMI=round(weight/height,2)) 
#withe pipe
mutate(students, BMI=weight/height) %>% mutate(BMI=round(BMI,2))## <- stupid way to use %>%
mutate(students, BMI=weight/height) %>% select(BMI) %>%round(2) %>% cbind(students) 
