#1

Vector1 = c ("Shreck","Shreck 2","Shreck tercero","Shreck:Felices para siempre")

Vector2 = c(7.9,7.2,6.1,6.3)

Vector3 = c(TRUE, TRUE, FALSE, FALSE)


Shreck = data.frame(Vector1,Vector2,Vector3)

#2
Calificaciones=c ("A","A","M","M","M","M","M","I","B","B","R","I","I","I",
                    "R","R","R","R","R","R","R","R","R","R","R","M","M","M",
                    "M","M","M","M","M","M","M","M","M","M","A","A")

frecuenciaAbsoluta = table (Calificaciones)

frecuenciaAbsoluta

FrecuenciaRelativa = frecuenciaAbsoluta/length(Calificaciones)

FrecuenciaRelativa

#3
Nombres = c ("Hugo","Paco","Luis","Paty","Maria","Ruben","Gaby")

Edades = c  (28,26,32,24,33,23,42)

Sueldos = c (12.5,13.5,14.8,7.1,57.7,45.3,34.2)

Genero = c ("M","M","M","F","F","M","F")

Pasatiempos = c ("Música","Música","Estudio","Videojuegos","Música","Música",
                 "videojuegos")

Empleados = data.frame(Nombres,Edades,Sueldos,Genero,Pasatiempos)

View(data.frame(Empleados))

#4

#Author DataFlair 

int_vec <- c(1,2,3)  

char_vec <- c("a", "b", "c") 

bool_vec <- c(TRUE, TRUE, FALSE)  

Salario <- c(5000,56700,6000)

DataFlair = data.frame(int_vec,char_vec,bool_vec,Salario)


View(data.frame(DataFlair))

Sumarasalario = c (Salario /10*0.50)

Salariototal = Salario+Sumarasalario

Salariototal

#2 Caso estadístico

Genero = c ("M","F","M","F","M","F","M","F","M","F")
Edad = c (46,57,68,25,30,64,67,25,43,14)
GlusemaBasal = c (123,230,180,164,210,220,193,202,152,185)
trataorales = c ("no","si","no","no","si","no","si","si","no","no")

Mispacientes = data.frame(Genero,Edad,GlusemaBasal,trataorales)

View(data.frame(Mispacientes))

max(Edad)

min(Edad)

mean(Edad)

sd(Mispacientes$GlusemaBasal)

round(sd(Mispacientes$GlusemaBasal),2)

quantile(GlusemaBasal)

frecuenciaAbsoluta = table (GlusemaBasal)

frecuenciaAbsoluta2 = table (Genero)
FrecuenciaRelativa = frecuenciaAbsoluta2/length(Genero)

#graficos
plot(Edad, type = "l", col = "red")
pie(FrecuenciaRelativa)


View(Vinculacion_a_Excel)
(Vinculacion_a_Excel$`Empleados x DPTO`)
hist(Vinculacion_a_Excel$`Empleados x DPTO`,
     col = c ("green", "blue","grey","royalblue"))




