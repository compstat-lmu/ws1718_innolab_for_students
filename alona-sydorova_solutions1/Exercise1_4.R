check_height_1 <- function (avgHeight, row) {
  diff = row[,"height"] - avgHeight
  if (diff>0) {
    paste0(row[,"name"], " is ", abs(diff*100), "cm taller than the average student")
  }
  else{
    paste0(row[,"name"], " is ", abs(diff*100), "cm smaller than the average student")
  }
}

check_height_2 <- function (avgHeightF, avgHeightM, row) {
  if(row[,"sex"]=="F") {
    sex = "woman"
    diff = row[,"height"] - avgHeightF
  }
  else {
    sex="man"
    diff = row[,"height"] - avgHeightM
  }
  if (diff>0) {
    paste0(row[,"name"]," is ", abs(diff*100), "cm taller than the average ",sex)
  }
  else{
    paste0(row[,"name"]," is ", abs(diff*100), "cm smaller than the average ",sex)
  }
}

check_height_3 <- function(students) {
  avgHeightF = mean(students[(students$sex=="F"),2])
  avgHeightM = mean(students[(students$sex=="M"),2])
  res = data.frame(students['name'])
  for(student in 1:nrow(students)) {
    if(students[student,"sex"]=="F") {
      res[student,'diff'] = students[student, "height"] - avgHeightF
    }
    else {
      res[student,'diff'] = students[student, "height"] - avgHeightM
    }
  }
  res[,'diff'] = res[,'diff']*100  
  return(res)
}

avgHeight = mean(students$height)
avgHeightF = mean(students[(students$sex=="F"),2])
avgHeightM = mean(students[(students$sex=="M"),2])

check_height_1(avgHeight, students[1,])
check_height_2(avgHeightF, avgHeightM, students[1,])
check_height_3(students)
