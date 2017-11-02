library(dplyr)

age <- c(19, 22, 21, 23, 22, 20, 28, 25)
weight <- c(50, 75, 80, 56, 75, 58, 65, 82)
height <- c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex <- c("F", "M", "M", "F", "M", "F", "F", "M")

#part 1
(students <- as.data.frame(cbind(age, weight, height, sex)))
#part 2
rm(age, weight, height, sex)
#part 3
str(students)
students <- transform(students, age = as.numeric(as.character(age)), weight = 
                        as.numeric(as.character(weight)), height = as.numeric(as.character(height)))
str(students)
#part 4
#students[["height"]]
(avg_height <- mean(students$height))
#part 5
(students$bmi <- round(students$weight / (students$height^2), 2))
#part 6
(large_students <- students[which(students$height > 1.80),]$height)
#part 7
(female_weights <- students[students$sex == "F",]$weight)
#part 8
(large_age <- students[students$height > 1.80 & students$sex == "M",]$age)
#part 10
students[2,]$age <- 25
#part 11
(students$name <- c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia","Karl"))
#part 12
(students <- students[, !(names(students) %in% c("bmi"))])
write.csv(students, file=paste0(PATH, "students.csv"), row.names=FALSE)

rm(students, avg_height, female_weights, large_age, large_students)
