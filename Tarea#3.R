#Dataframe CostoVida2020
View(CostoVida2020)
class(CostoVida2020)
names(CostoVida2020)
head(CostoVida2020)
tail(CostoVida2020)

#correlacion visual
pairs(CostoVida2020)

#correlacion exacta
cor(CostoVida2020)


##***************************entrenar al modelo#1#***************************
Regresion1 = lm(Indice_alimentos~Indice_Costo_Vida, data = CostoVida2020)
summary(Regresion1)

#Plot1
plot(CostoVida2020$Indice_Costo_Vida, CostoVida2020$Indice_alimentos , xlab = "Indice_Costo_Vida", ylab = "Indice_alimentos")
abline(Regresion1)

#prediccion (test)1
nuevoindicecostovida = data.frame(Indice_Costo_Vida = seq(1,40))

# calculo de prediccion1
predict(Regresion1,nuevoindicecostovida)
Data1 = predict(Regresion1,nuevoindicecostovida)
plot(Data1)


##***************************entrenar al modelo#2#***************************
Regresion2 = lm(Indice_alimentos~Indice_Precio_Restaurant, data = CostoVida2020)
summary(Regresion2)

#plot2
plot(CostoVida2020$Indice_Precio_Restaurant, CostoVida2020$Indice_alimentos , xlab = "Indice_Precio_Restaurant", ylab = "Indice_alimentos")
abline(Regresion2)

#prediccion (test)2
nuevoindicepreciorestaurante = data.frame(Indice_Precio_Restaurant = seq(50,100))

# calculo de prediccion2
predict(Regresion2,nuevoindicepreciorestaurante)
Data2 = predict(Regresion2,nuevoindicepreciorestaurante)
plot(Data2)


##***************************entrenar al modelo#3#***************************
Regresion3 = lm(Indice_renta~Indice_Costo_Vida, data = CostoVida2020)
summary(Regresion3)

#plot3
plot(CostoVida2020$Indice_Costo_Vida, CostoVida2020$Indice_renta, xlab = "Indice_Costo_Vida", ylab = "Indice_renta")
abline(Regresion3)


#prediccion (test)3
nuevoindicerenta = data.frame(Indice_Costo_Vida = seq(10,20))


# calculo de prediccion3
predict(Regresion3,nuevoindicerenta)
Data3 = predict(Regresion3,nuevoindicerenta)
plot(Data3)

#analisis de sentimiento
#Syuzhet

# Instala los paquetes:
install.packages("syuzhet")
install.packages("RColorBrewer")
install.packages("wordcloud")
install.packages("tm")

# Carga los paquetes
library(syuzhet)
library(RColorBrewer)
library(wordcloud)
library(tm)

#Paso 1 crear texto 

texto_cadena ='Retumbó el disparo en la soledad de aquel abandonado y tenebroso lugar,
dando terrible salto, hincó la cabeza en la movediza tierra y rodó seco 
hacia el abismo, sin que el conocimiento le durase más que el tiempo
necesario para poder decir: «Pues… sí…»'

#Paso 2 tokenizar
texto_palabras <- get_tokens(texto_cadena)
head(texto_palabras)
length(texto_palabras)

#Paso 3 crear oraciones test
oraciones_vector <- get_sentences(texto_cadena)
length(oraciones_vector)

#Paso 4 Extracción de datos con el Léxico de Sentimientos NRC

sentimientos_df <- get_nrc_sentiment(texto_palabras, lang="spanish")

View(sentimientos_df)
summary(sentimientos_df)

#graficar
barplot(
  colSums(prop.table(sentimientos_df[,1:8])),
  space = 0.2,
  horiz = TRUE,
  las = 1,
  cex.names = 0.7,
  col = brewer.pal(n = 8,  name = "Set3"),
  main = "Situacion",
  sun = "Analisis",
  xlab = "emociones", lab = NULL)



