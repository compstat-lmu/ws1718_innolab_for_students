#---------------Excise 2
library(dplyr)
#2.1
#mutate ,select,filter,summarise,arrage
df = read.csv('Data/a.csv')
df

#2.2
age_height = select(df,'age','height')
age_height

#2.3
df %>%
  filter(sex=='M' & weight <80 | sex=='F' & age < 25) %>%
  write.csv(file = 'Data/select.csv',row.names = FALSE)

#2.4
df %>%
  filter(sex=='M'& age <25) %>%
  summarise(max(height))

#2.5
df %>%
  mutate(bmi = round(weight/height **2,digits=2))
mutate(df,bmi = round(weight/height ** 2,digits=2))


#alternative
library(dplyr)

#(1) read the students.csv data frame
students <- read.csv(file="students.csv",header = TRUE,sep = ",")
students

#(2) select only the variable age and height
#age_height <- students[,c(2:3)]
#age_height

age_height <- select(students,2:3)
age_height

#(3) filter the weigh using piping operator %>%
#all men that weigh less then 80 kolos
#all women younger than 25
# name,age,weight,height,sex, F,M
#in a new data frame called selection.csv
#filter(men,weigh >80)
#filter(women,age <25)
selection <- students %>% 
  filter(sex == "M" & weight < 80 | sex == "F" & age < 25) 
selection
write.csv(selection,file="selection.csv",row.names = FALSE)

# (4) find the tallest men amongst those that younger than 25 using dplyr's functionality
man_high <- students %>%
  #  filter(sex=="M" & age > 25 & weight == max(weight)) 
  filter(sex == "M" & age <25) %>%
  arrange(desc(weight)) %>%
  head(1)
#  max(weight)
man_high

#(5)add a new variable BMI.
# that is calculated as the quotient of hweight and height
# the results on 2 decimals
#pipe operateor for this task
students <-students %>%
  mutate(BMI = round((height/weight),2)) 
students
