## Ex. 2 ----
# 1
students = read.csv("ex1_students.csv")
students = dropNamed(studentsCsv, drop = "X")
# 2 
students[c("age", "height")]
# 3
filter(students, (sex == "M" & weight < 80) | (sex == "F" & age < 25)) %>% write.csv("selection.csv")
# 4
students %>%
  filter(sex == "M" & age < 25) %>%
  arrange %>%
  filter(row_number() == 1)
# 5
students %>% mutate(BMI = round(weight / height^2 ,2))