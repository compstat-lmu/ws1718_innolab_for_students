## Ex. 1 ----
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")
# 1
students = data.frame(age, weight, height, sex)
is.data.frame(students)
# 2
rm(list = names(students))
# 3
str(students)
# 4
mean(students$height)
# 5
students$bmi = round(students$weight / (students$height), 2)
# 6
students[students$height > 1.80, ]
# 7 
students$weight[c(which(students$sex == "F"))]
# 8
students$age[students$sex == "M" & students$height > 1.8]
# 9
students[2,1] = 25
students[2, "age"] = 25
# 10
name = c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")
students$name = name
# bmi wieder rein fuer Ex. 2
studentsEx1 = students
# 11
students = dropNamed(students, drop = "bmi")
write.csv(students, file = "ex1_students.csv")