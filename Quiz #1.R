
#1
  hist(x=COVID_19_Encuesta_a_estudiantes$`Age of Subject`, 
       main = "Edad del sujeto", 
       xlab = "Edades", 
       ylab = "Cantidad",
       col = "blue")

#2
data_Covid_Filtrada = filter(COVID_19_Encuesta_a_estudiantes,
                             COVID_19_Encuesta_a_estudiantes$
                            `Region of residence`=="Delhi-NCR")

plot(as.factor(data_Covid_Filtrada$"Prefered social media platform"))

#3
Clase_Social = filter(COVID_19_Encuesta_a_estudiantes,
                             COVID_19_Encuesta_a_estudiantes$
                               `Region of residence`=="Outside Delhi-NCR")

plot(as.factor(Clase_Social$"Rating of Online Class experience"),
     main = "clase social fuera de Delhi-NCR",
     xlab = "Clase social",
     ylab = "Cantidad")

#4

dataAgrupada = COVID_19_Encuesta_a_estudiantes%>%
  group_by(`Medium for online class`)%>%
  summarise( `Age of Subject` =mean(20))

View(dataAgrupada)

#5

plot(COVID_19_Encuesta_a_estudiantes$`Age of Subject`,
    COVID_19_Encuesta_a_estudiantes$`Time spent on Online Class`,
    xlab = "Edad",
    ylab = "Tiempo de las clases online")