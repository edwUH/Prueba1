#grafico de barras



#Calificacion de los documentales
datosFiltrados = filter(NetflixOriginals, NetflixOriginals$Genre=='Documentary')
plot(as.factor(datosFiltrados$`IMDB Score`),main = "Clasificacion de Documentales") 



#Duracion de las peliculas +/- 100 minutos
datosFiltrados = filter(NetflixOriginals, NetflixOriginals$Genre=='Documentary')
plot(as.factor(datosFiltrados$`Runtime`>100),
     main = "Duracion de los documentales")



#Time based plot - fechas del mes de Junio



fechas <- seq(as.Date("2021/6/1"), by = "day", length = 30 ) 



plot(fechas,rnorm(30), type = "o",main = "Fechas de Junio")



#correlacion - relación entre la puntuación y la duración
View(NetflixOriginals)



plot(select(NetflixOriginals,4:5),main = "Relacion Puntuacion/Duracion")