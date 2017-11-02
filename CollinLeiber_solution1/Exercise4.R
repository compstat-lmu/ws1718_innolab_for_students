# ---------------- Excecise 4 ---------------- 
# 4.1
check_height_1 <- function(row, mean_height) {
  x = round((row[['height']] - mean_height)*100, digits=2)
  if (x >= 0) {
    paste0(row[['names']],' is ',x,' cm taller than the average student')
  } else {
    paste0(row[['names']],' is ',abs(x),' cm smaller than the average student')
  }
}
check_height_1(df[2,],mean_height)

# 4.2
check_height_2 <- function(row) {
  # Get correct gender name
  if (row[['sex']] == 'M') {
    gender = 'man'
  } else {
    gender = 'woman'
  }
  # Get gender mean height
  m_height = df %>%
    filter(sex==row[['sex']]) %>%
    summarise(mean(height))
  # Get difference from mean
  x = round((row[['height']] - m_height)*100, digits=2)[1,1]
  if (x >= 0) {
    print(paste0(row[['names']],' is ',x,' cm taller than the average ',gender))
  } else {
    print(paste0(row[['names']],' is ',abs(x),' cm smaller than the average ', gender))
  }
  x
}
check_height_2(df[2,])

# 4.3
check_height_3 <- function(df) {
  l = c()
  for (i in 1:nrow(df)){
    l[i] = check_height_2(df[i,])
  }
  df2 = data.frame(df['names'],diff=l)
}
check_height_3(df)