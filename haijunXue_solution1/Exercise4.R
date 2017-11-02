#----------------Exerciese 4
#4.1
check_height_1 <- function(x,ht){
  height<-x$height -ht
  h <-round(abs(height*100),digits=2)
  paste0(x$name,' is ',h,' cm ',ifelse(height > 0,"taller","smaller"),' the average height')
}

check_height_1(df[2,],mean(df$height))


check_height_1 <- function(row,mean_height){
  x = round((row[['height']]-mean_height)*100,digits = 2)
  if(x >=0){
    paste0(row[['names']], ' is ',x,' cm taller than the average student')
  }else{
    paste0(row[['names']], ' is ',abs(x),' cm smaller than the average student')
  }
}

check_height_1(df[2,],mean(df$height))

#4.2


#(2)
check_height_2 <- function(row){
  #get correct gender name
  if(row[['sex']] == 'M'){
    gender = 'man'
  }else{
    gender = 'woman'
  }
  # Get gender mean height
  m_height = df %>%
    filter(sex == row[['sex']]) %>%
    summarise(mean(height))
  # get difference from mean
  x = round((row[['height']]-m_height)*100,digits = 2)[1,1]
  if (x >= 0) {
    print(paste0(row[['names']],' is ',x,' cm taller than the average ',gender))
  } else {
    print(paste0(row[['names']],' is ',abs(x),' cm smaller than the average ', gender))
  }
  
}
check_height_2(df[2,])

#
check_height_3 <- function(df){
  l <- c()
  for(i in 1:nrow(df)){
    l[i] = check_height_2(df[i,])
  }
  df2 <- data.frame(df['names'],diff=l)
  
}
check_height_3(df)

#
check_height_4 <- function(df){
  apply(df,MARGIN=1,check_height_2)
}
check_height_4(df)

#alternative
check_height_3 <- function(df){
  frau <-df %>% 
    filter(sex=="F")
  men <-df %>%
    filter(sex=="M")
  fm_h <- mean(frau$height)
  mm_h <- mean(men$height)
  h <- list()
  s<-list()
  
  for (i in 1 :length(df$height)){
    if(df$sex[i]=="F"){
      h[i] <- df$height[i] -fm_h
      if(h[i]>0){
        s[i] <- paste0(lapply(h[i],abs)," cm taller than the women")  
      }else{
        s[i] <- paste0(lapply(h[i],abs)," cm smaller than the women") 
      }
      
    } else{
      h[i] <- df$height[i] -mm_h
      if(h[i]>0){
        s[i] <- paste0(lapply(h[i],abs)," cm taller than the man")  
      }else{
        s[i] <- paste0(lapply(h[i],abs)," cm smaller than the man") 
      }
      
    }
  }
  
  paste0(df$name," is ",s)
  
}
check_height_3(students)
