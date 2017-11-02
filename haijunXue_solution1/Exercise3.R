#3.1
microbenchmark(df$BMI <- round(df$weight/df$height ** 2,digits = 2) ,
               mutate(df,bmi = round(weight/height ** 2,digits=2)),
               times = 1000,
               unit = 'ms'
)

microbenchmark(mutate(df, BMI = round(weight / height ** 2, digits = 2)),
               df['BMI']<-round(df['weight'] / df['height']**2, digits=2),
               times = 1000,unit='ms')

#3.2
#profilling zeigt dem Programmierer,welcher Teil des Codes im Verhältnis zu anderen
#Teilen wie viel Zeit benötigt.Dadurch können bottlenecks leicht gefunden werden
#microbenching berechnet hingegen die genaue Dauer einer Ausführung