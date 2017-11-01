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
