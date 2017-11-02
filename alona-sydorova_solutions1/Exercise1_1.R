# AUFGABE 1.1
library(BBmisc)
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")
students = data.frame(age,height,weight,sex)

rm(age,height,weight,sex)

str(students)

mean(students$height)

bmi <- function(w,h) {w/(h**2)}
students$bmi <- round(bmi(students$weight,students$height),2)

tallStudents = students[(students$height>1.8),2]
femaleWeights = students[(students$sex=="F"),3]
tallMaleAge = students[(students$height>1.8 & students$sex == "M"),1]

students$age[2] = 25

students$name = c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia","Karl")

# dropNamed comes from BBmisc package
students = dropNamed(students,"bmi")

write.csv(students,"students.csv",row.names = FALSE)
