#Exercise 1.1
#initialize variables
age = c(19, 22, 21, 23, 22, 20, 28, 25) 
weight = c(50, 75, 80, 56, 75, 58, 65, 82) 
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85) 
sex = c("F", "M", "M", "F", "M", "F", "F", "M")
#create data frame
students <- data.frame(age, weight, height, sex)
head(students)
#remove variables
rm(age, weight, height, sex)
#rm(list = names(students))
#typey of variables
str(students)
#class(students$age)
#class(students$weight)
#class(students$height)
#class(students$sex)
#mean of height
mean(students$height)
#add BMI to data frame
students$bmi <- round((students$weight)/(students$height)^2,2)
head(students)
#save height of students larger 1.80
heights_greater_180 <- students$height[students$height > 1.80]
heights_greater_180
#save weight of all female students
females <- students$weight[students$sex == 'F']
females
#Save the age of all male students that are larger than 1.80 in a new vector
male_larger_180 <- students$age[((students$sex == 'M') & (students$height>1.80))]
male_larger_180
#second student is 25 years old
students[2,]$age <- 25
head(students)
#add names
students$names <- c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")
head(students)
#delete BMI variable
students$bmi <- NULL
#library(BBmisc)
#students <- dropNamed(students, drop = "bmi")
head(students)
#save as .csv
write.table(students, "students.csv", sep="\t")
