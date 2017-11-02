#Ex1-No2.

install.packages("dplyr")
library(dplyr)
?`dplyr-package`

sDF <- read.csv(file="C:\\Users\\Tuan Le\\Desktop\\WiSe 1718\\BDLB\\Ex1\\studentsDF.csv")
sDF
sDF[,c("age","height")]
select(sDF, c("age","height"))
#equiv.
sDF %>% select(c("age","height"))

filteredMen <- filter(sDF, sex=="M" & weight < 80) 
filteredWomen <- filter(sDF, sex=="F" & age < 25)
selection <- sDF %>% filter(sex=="M"&weight<80 | sex=="F" & age <25)

##using pipe operator:
sDF %>% select(sex,weight) %>% filter(sex=="M" & weight < 80) 
sDF %>% select(sex,age) %>% filter(sex=="F" & age < 25) 

selection <- rbind(filteredMen,filteredWomen)
write.csv(selection, file="C:\\Users\\Tuan Le\\Desktop\\WiSe 1718\\BDLB\\Ex1\\selection.csv", row.names = F)
max(filter(sDF, sex=="M" & age < 25)[,"height"])

sDF %>% filter(sex=="M" & age < 25) %>% select(height) %>% max

BMI <- round(sDF[,"weight"] / sDF[,"height"], digits = 2)

mutate(sDF, BMI = round(weight/height, digits = 2))