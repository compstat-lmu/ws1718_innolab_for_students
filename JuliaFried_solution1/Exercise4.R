## Ex. 4 ----

# 1
check_height_1 = function(specificStudent){
  heightOfOnePerson = specificStudent$height
  difference = heightOfOnePerson - mean(students$height)
  if (difference > 0){
    paste(specificStudent$name, " ist ", abs(difference), " einheit groesser als der Durchschnitt ")
  } else {
    paste(specificStudent$name, " ist ", abs(difference), " einheit kleiner als der Durchschnitt ")
  }
}
check_height_1(students[3, ])

# 2
check_height_2 = function(specificStudent){
  if (specificStudent$sex == "F"){
    dat = students[students$sex == "F", ]
    difference = specificStudent$height - mean(dat$height)
  } else {
    dat = students[students$sex == "M", ]
    difference = specificStudent$height - mean(dat$height)
  }
  if (difference > 0){
    paste(specificStudent$name, " ist ", abs(difference), " einheit groesser als der Durchschnitt ")
  } else {
    paste(specificStudent$name, " ist ", abs(difference), " einheit kleiner als der Durchschnitt ")
  }
}
check_height_2(students[3, ])

# 3
check_height_3 = function(dat){
  newdat = data.frame(name = character(), difference = numeric(0))
  me = mean(dat$height)
  for (i in 1:nrow(dat)){
    name = dat$name[i]
    difference = round(dat$height[i] - me, 2)
    n = cbind(name, difference)
    newdat = rbind(newdat, n)
  }
  newdat
}
check_height_3(students)