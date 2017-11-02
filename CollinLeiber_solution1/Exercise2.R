# ---------------- Excecise 2 ---------------- 
library(dplyr)
# 2.1
# mutate, select, filter, summarise, arrange
df = read.csv('C:/Users/c_lei/OneDrive/Dokumente/Universität/WS1718 Big Data Science/students.csv')

# 2.2
select(df, age, height)

# 2.3
df %>%
  filter(sex == 'M' & weight < 80 | sex == 'F' & age < 25) %>%
  write.csv('C:/Users/c_lei/OneDrive/Dokumente/Universität/WS1718 Big Data Science/selection.csv')

# 2.4
df %>%
  filter(sex == 'M' & age < 25) %>%
  summarise(max(height))

# 2.5
mutate(df, BMI = round(weight / height ** 2, digits = 2))