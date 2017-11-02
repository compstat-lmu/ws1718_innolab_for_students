PATH <- "C:\\Users\\Hermann\\Dokumente\\ws1718_innolab_for_students\\HermannRedich_solution1\\"

############# 2 #############
# part 1
(students <- read.csv(paste0(PATH, "students.csv"), header=TRUE))
#part 2
students %>% select(age, height)
#part 3
(selection.csv <- students %>% filter(sex == "M" & weight < 80 | sex == "F" & age < 25))
#4. Find the tallest men amongst those that are younger than 25 using dplyr's functionality.
students %>% filter(sex == "M" & age < 25) %>% arrange(desc(height)) %>% summarize(max_height = max(height))
#5. Add a new variable called BMI that is calculated as the quotient of weight in kilos and height in meters.
students %>% mutate(bmi = round(weight / (height^2), 2))