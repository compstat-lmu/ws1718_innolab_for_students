rm(list=ls())

###
# Aufgabe 1 

age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")

students <- data.frame(age, weight, height, sex)

rm("age", "weight", "height", "sex")
students
str(students)

class(students$age)
class(students$sex)
is.factor(students$sex)
mean(students$height)

students
students$bmi = round((students$weight)/(students$height)^2, digits = 2)
heights = students$height[students$height > 1.80]

weights = students$weight[students$sex == "F"]

ages = students$age[students$height > 1.80]

students[2, "age"] = 25
students

students$names = c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")

students = subset(students, select = -bmi, drop = TRUE)

write.csv(students, file = "students.csv")
