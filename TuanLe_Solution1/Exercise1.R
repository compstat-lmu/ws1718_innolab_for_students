#Ex1-No1.

age <- c(19,22,21,23,22,20,28,25)
weight <- c(50,75,80,56,75,58,65,82)
height <- c(1.66,1.78,1.90,1.72,1.83,1.68,1.70,1.85)
sex <- c("F","M","M","F","M","F","F","M")

#1
studentDF <- data.frame(
  age,weight,height,sex
)

#2
rm(age,weight,height,sex)

#3
sapply(studentDF,mode)
sapply(studentDF,class)
str(studentDF)

#4
studentDF
?mean
mean(studentDF[,3])
mean(studentDF[,"height"])

#5
fBMI <- function(df) {
  studentDF <- df
  BMI <- round(studentDF[,"weight"] / studentDF[,"height"]^2, digits = 2)
  studentDF <- cbind(studentDF,BMI)
  return(studentDF)
}
fBMI(studentDF)
BMI <- round(studentDF[,"weight"] / studentDF[,"height"]^2, digits = 2)

studentDF <- cbind(studentDF,BMI)
studentDF

heightsaved <- studentDF[studentDF[,"height"] > 1.80,"height"]
library(dplyr)
studentDF %>% filter(height > 1.80) 
weightsaved <- studentDF[studentDF[,"sex"] == "F", "weight"]

weightsaved2 <- studentDF %>% filter(sex=="F") %>% select(weight)
weightsaved2

tmpdf <- studentDF[studentDF[,"height"] > 1.80,]
agesavedM <- tmpdf[,"age"]
agesaved2 <- studentDF %>% filter(sex=="M" & height > 1.80) %>% select(age)
agesaved2

#9
studentDF[2,1] <- 25

#10
sNames <- c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")
studentDF <- cbind(sNames, studentDF)
#or
studentDF <- studentDF[,-1]
studentDF %>% mutate(sNames)

#11 
rm(BMI)
write.csv(studentDF, file="C:\\Users\\Tuan Le\\Desktop\\WiSe 1718\\BDLB\\Ex1\\studentsDF.csv", row.names = F)


####