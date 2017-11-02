# ---------------- Excecise 3 ---------------- 
library(microbenchmark)
# 3.1
microbenchmark(mutate(df, BMI = round(weight / height ** 2, digits = 2)),
              df['BMI']<-round(df['weight'] / df['height']**2, digits=2),
               times = 1000,unit='ms')
# Aus Ausgabe 1 ist schneller. Ergebnis nicht gleich. 1.=matrix , 2.=vektor

# 3.2
# Profiling zeigt dem Programmierer, welcher Teil des Codes im Verhältnis zu anderen Teilen wie viel Zeit benötigt. Dadurch können bottlenecks leicht gefunden werden.
# Microbenching berechnet hingegen die genaue Dauer einer Ausführung.