# ---------------- Excecise 1 ---------------- 
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")

# 1.1
df = data.frame(age,weight,height,sex)

# 1.2
rm(age, weight, height, sex)

# 1.3
str(df)

# 1.4
mean_height = mean(df[['height']])
mean_height = mean(df$height)

# 1.5
df['bmi'] = round(df['weight'] / df['height']**2, digits=2)
df$bmi = round(df$height / df$height **2, digits=2)

# 1.6
heights = df[df['height'] > 1.8,][['height']]

# 1.7
weights = df[df['sex'] == 'F',][['weight']]

# 1.8
ages = df[df['sex'] == 'M' & df['height'] > 1.8,][['age']]

# 1.9
df[2,'age'] = 25
df$age[2] = 25

# 1.10
df['names'] = c('Maria', 'Franz', 'Peter', 'Lisa', 'Hans', 'Eva', 'Mia', 'Karl')
df$names = c('Maria', 'Franz', 'Peter', 'Lisa', 'Hans', 'Eva', 'Mia', 'Karl')

# 1.11
# df['bmi'] = NULL
df = subset(df, select = -c(bmi))
write.csv(df,'C:/Users/c_lei/OneDrive/Dokuments/Universität/WS1718 Big Data Science/students.csv')