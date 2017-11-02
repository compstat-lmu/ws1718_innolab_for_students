
#EXERCISE 1
#1.Create a data.frame students
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")

students<-data.frame(age, weight, height, sex)


#2.Remove the variables

rm(age, weight, height, sex)
rm(list = names(students))

#3. Check the data tyoes of the variables
str(students)


#4.Calculate the average height of the students

mean(students$height)


#5. Calkulate the BMI

bmi <- round((students$weight / (students$height)^2), digits = 2)
students<-data.frame(age, weight, height, sex, bmi)


#6. Save the height of all students that are larger than 1.80

(height <- students$height [students$height >= 1.80])

#7. Save the weight af all female students in a new vector


(weightOffemale <- students$weight[students$sex == "F"])


#8. Save the age of all male students that are larger than 1.80 in a new vector

students <- students[students[["sex"]] == "M" & students[["height"]] >= 1.80, ]
ageOfmale <- students2$age
ageOfmale

#9. The second student is 25 years old

students$age[2] <- 25

students[2,"age"]=25

#10. Add the names as of the students a new Variable to the data.frame

names <- c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")
students<-cbind(names, students)
students


#11. Delete the BMI-variable

students$bmi<-NULL
students

write.csv(students, file = "students.csv")


