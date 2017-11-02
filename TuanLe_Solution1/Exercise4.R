#Ex1-No4.
class(sum)
#objs <- mget(ls("package:base"), inherits = TRUE)
#funs <- Filter(is.function, objs)
#str(funs)

#1
check_height_1 <- function(studentname) {
  if(studentname %in% sDF$sNames) {
    avg_height <- mean(sDF[,"height"])
    diff <- sDF %>% filter(sNames==studentname) %>% select(height) - avg_height
    r <- paste0(studentname , " is " , abs(diff)*100, " cm " , if(diff<0) " smaller " else " taller " , "than the average student.")
    return(r)
  }
  else return(paste0(studentname, " is not in student dataframe."))
}

check_height_1("Maria")
check_height_1("Peter")
check_height_1("Tuan")

#2
check_height_2<- function(studentname) {
  avg_height_men <- summarise(sDF %>% filter(sex == "M") %>% select(height), mean(height))
  avg_height_women <- summarise(sDF %>% filter(sex == "F") %>% select(height), mean(height))
  
  if(studentname %in% (subset(sDF, subset= sex=="M")$sNames) ) {
    diff <- sDF %>% filter(sNames==studentname) %>% select(height) - avg_height_men
    r <- paste0(studentname , " is " , round(abs(diff)*100,2), " cm " , if(diff<0) " smaller " else " taller " , "than the average men")
  }
  else {
    diff <- sDF %>% filter(sNames==studentname) %>% select(height) - avg_height_women
    r <- paste0(studentname , " is " , round(abs(diff)*100,2), " cm " , if(diff<0) " smaller " else " taller " , "than the average women")
  }
  return(r)
}

check_height_2("Maria")
check_height_2("Peter")
#debug(function)
#undebug(function)
sDF$sNames<- as.character(sDF$sNames)
str(sDF)
check_height_3 <- function(sDF){
  outDF <- data.frame("name" = character(), 
                      "difference" = character())
  for (i in 1:nrow(sDF)) {
    name <- sDF[i,"sNames"]
    diff <- check_height_2(sDF[i,"sNames"])
    r <- data.frame("name"=name, "difference" = diff)
    outDF <- rbind(outDF,r)
  }
  return(outDF)
}

check_height_3(sDF)