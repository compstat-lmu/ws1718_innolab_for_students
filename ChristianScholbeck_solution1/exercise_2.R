# Aufgabe 2 
library(dplyr)

newdata <- read.csv("students.csv")
newdata <- select(newdata, age, height)

sel1 = students %>% filter(sex == "M" & weight < 80)
sel2 = students %>% filter(sex == "F" & age < 25)

selection.csv = students %>% filter(sex == "M" & weight < 80 | sex == "F" & age < 25)
selection.csv = rbind(sel1, sel2)

students %>% filter(sex == "M" & age < 25) %>% filter(height == max(height))
students %>% mutate(bmi = round(weight/height, digits = 2))
