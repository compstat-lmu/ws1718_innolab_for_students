#1.1
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")
(students <- data.frame(age = age, weight=weight, height=height, sex=sex))
#1.2
rm(list=names(students))
#1.3
str(students)
#not needed but...
students <- transform(students, sex=as.character(sex))
str(students)
students <- transform(students, sex=as.factor(sex))
str(students)
#1.4
meanHeight <- mean(students$height)
students$BMI <- round(students$weight/students$height^2,digits = 2)
#1.5
(bigger180 <- students$height[students$height>1.8])
(fSTudentsWeight <- students$weight[students$sex=="F"])
(mStudentsAge <- students$age[students$sex=="M" & students$height > 1.8])
students[2,]$age=25
students[2,"age"]=25
students  
row.names(students)=unlist(strsplit(c("Maria , Franz , Peter , Lisa , Hans , Eva , Mia , Karl"), " , "))
students
#or liek this
students$name <- unlist(strsplit(c("Maria , Franz , Peter , Lisa , Hans , Eva , Mia , Karl"), " , "))
row.names(students) <- 1:8
students
##Is there an automated way to set wd to "THIS" file
students$BMI <- NULL
write.csv(students, file = "students.csv")
