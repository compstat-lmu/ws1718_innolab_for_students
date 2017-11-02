#----------------Excecise 1
age = c(19, 22, 21, 23, 22, 20, 28, 25)
weight = c(50, 75, 80, 56, 75, 58, 65, 82)
height = c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex = c("F", "M", "M", "F", "M", "F", "F", "M")

#1.1
df = data.frame(age,weight,height,sex)
#1.2
rm(age,weight,height,sex)
#1.3
str(df)

#1.4
mean_height=mean(df$height)
mean_height = mean(df[['height']])
#1.5
df$BMI = round(df$weight/df$height ** 2,digits = 2)
df['bmi'] = round(df['weight']/df['height'] **2,digits = 2)
df
#1.6
df_height = df[df$height>1.80]
heights = df[df['height']>1.80,][['height']]
heights = df$height[df$height>1.80]
heights
#1.7
weights = df[df['sex']=='F',][['weight']]
weights
weights = df$weight[df$sex=='F']
weights

#1.8
ages = df$age[df$sex='m'&&df$height>1.80]
ages

ages = df[df['sex']=='M' &df['height']>1.80,][['age']]
ages

#1.9
df[2,][['age']] <- 25
df
df[2,'age'] <- 25
df

df$age[2] = 25
#1.10
names = c('Maria','Franz','Peter','Lisa','Hans','Eva','Mia','Karl')
df$names = data.frame(names)
df['names'] = data.frame(names)
df
df$names = c('Maria','Franz','Peter','Lisa','Hans','Eva','Mia','Karl')
df

#1.10
df$BMI = NULL
df
df = subset(df,select = -c(bmi))
write.csv(df,file="Data/a.csv",row.names = FALSE)
