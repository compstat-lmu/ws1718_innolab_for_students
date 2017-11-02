#4.1
#Write a function check_height_1() that checks if a person is taller than the mean height of the student-
#population. The function prints the name of the person and its difference from the average student-height
#in cm indicating if the person is smaller or taller than the average student (e.g.: Maria is 20 cm smaller
#than the average student). The function takes the previously calculated student_mean_height as an
#input variable next to one row of the students data frame. (Hint: use paste0() for concatenation of
#different arguments in one printed line)

check_height_1 <- function(person,meanHeight){
  differ <- (person$height - meanHeight)*100
  if(differ<0){
    paste0(person$name, " is ", abs(differ), " cm smaller than a average student")
  }else if(differ>meanHeight){
    paste0(person$name, "is ", differ, " cm taller than a average student")
  }else{
    paste0(person$name, "is has the average hight of student")
  }
}
check_height_1(students[1,],meanHeight = meanHeight)


check_height_2 <- function(person, population){
  fmeanHeight <- filter(population,sex=="F") %>% select(height) %>% colMeans()
  mmeanHeight <- filter(population,sex=="M") %>% select(height) %>% colMeans()
  
  if(person[,"sex"]=="F"){
    differ <- (person[,"height"] - fmeanHeight)*100
    if(differ<0){
      paste0(person[,"name"], " is ", -differ, " cm smaller than a average female student")
    }else if(differ>meanHeight){
      paste0(person[,"name"], "is ", differ, " cm taller than a average female student")
    }else{
      paste0(person[,"name"], "is has the average hight of female student")
    }
  }else{
    differ <- (person[,"height"] - mmeanHeight)*100
    if(differ<0){
      paste0(person[,"name"], " is ", -differ, " cm smaller than a average male student")
    }else if(differ>meanHeight){
      paste0(person[,"name"], "is ", differ, " cm taller than a average male student")
    }else{
      paste0(person[,"name"], "is has the average hight of male student")
    }
  }
}
check_height_2(students[2,], population=students)

check_height_3 <- function(df){
  differ <- numeric(dim(df)[1])
  for(i in 1:dim(df)[1]){
    differ[i] = check_height_2(df[i,],df)
  }
  as.data.frame(differ)
}
check_height_3(students)