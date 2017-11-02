#excercise 1
#1.1
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")
students = data.frame(age, weight, height, sex)
print(students)
#1.2
rm(age, weight, height, sex)
#1.3
str(students)
#1.4
mean(students[, "height"])
mean(height)
#1.5 Calculate the BMI

students$BMI <- round(students$weight / students$height ^ 2, digits = 2)
print(students)
#1.6
#Save the heights of all students that are larger than 1.80
students[, "height"][which(students[, "height"] > 1.80)]
heights = students[students['height'] > 1.8, ][['height']]
print(heights)
students[which(students[, "height"] > 1.80), ]
#1.7
#Save the weight of all female students in a new vector
new.v1 = students[, "weight"][which(students[, "sex"] == "F")]
print(new.v1)
#1.8
#Save the age of all male students that are larger than 1.80 in a new vector
new.v2 = students[, "age"][which((students[, "sex"] == "M") &
                                   (students[, "height"] > 1.80))]
print(new.v2)
#1.9
#replace the second student with 25 years old
students[2, "age"] = 25
print(students)
#1.10
#add names
students$names <-
  c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")
print(students)
#1.11
#Delete the BMI-variable

students = students[, -5]
rm(MBI)
print(students)

write.csv(students, file = "D:\\RStudio\\exercise\\ex1\\students.csv", row.names =
            FALSE)













