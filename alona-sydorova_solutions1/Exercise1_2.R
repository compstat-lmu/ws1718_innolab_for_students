library("dplyr")

students <- read.table("students.csv", sep = ",", header = TRUE, 
  stringsAsFactors = FALSE)

select(students, age, height)

students %>% filter((sex == "M" & weight <80) | (sex=="F" & age<25)) %>% 
  write.csv("selection.csv")

st = filter(students, sex == "M" & age<25) %>% 
  arrange(desc(height))
tallest = st[1,]

mutate(students,bmi = round(weight/(height**2),2))
