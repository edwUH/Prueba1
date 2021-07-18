library("DBI")
library("odbc")
library("dbplyr")



#a

DB_Northwind <- DBI::dbConnect(odbc::odbc(),
                               Driver = "SQL Server",
                               Server = "dbtedamssql.uh.ac.cr",
                               Database = "Northwind",
                               UID = rstudioapi::askForPassword("Database user"),
                               PWD = rstudioapi::askForPassword("Database password"),
                               Port = 1433)




#b

Clientes<-dbGetQuery(DB_Northwind,"select * from [Customers]")
View(Clientes)


ordenes_ventas <-dbGetQuery(DB_Northwind,"select * from [sales].[orders]")
View(ordenes_ventas)



Inventario<-dbGetQuery(DB_Northwind,"select * from [dbo].[Out_Final_WLP]")
View(Inventario)

Northwind<-dbGetQuery(DB_Northwind,"Select * from Orders")
View(Northwind)




ggplot (data = Clientes, aes (Clientes$CustomerID, Clientes$Country)) + geom_point()
#este ggplot nos muestra los paises que donde se han enviado los paquetes,
#esto nos demuestra que USA es donde mas se han enviado,
#mientras Portugal y Austria donde menos se han enviad.


ggplot (data = ordenes_ventas, aes (ordenes_ventas$order_status,
                                    ordenes_ventas$order_id)) + geom_point ()
#Este gráfico nos ayuda a confirmar cuantas ordenes estan pendientes y cuantas
#ya han sido completadas.


ggplot (data = Inventario, aes (Inventario$ProductID, 
                                      Inventario$UnitsInStock))+ geom_point ()
#Este gráfico ayuda a analizar cuales son los productos que tenemos
#en inventario para saber de cuales es necesario solicitar mas.


qplot(ShipCountry, OrderDate, data = Northwind, color=ShipCountry,
      xlab="Pais", ylab="Fecha de orden", main="Fecha de la orden por pais")
#En este gráfico podemos observar la fehca de la orden de cada pais
#donde deducimos que Francia y Alemania es donde mas se ha entregado paquetes.


#c

ordenes <-dbGetQuery(DB_Northwind,"select * from [orders]")
View(ordenes)


ggplot (data = ordenes, aes (ordenes$OrderDate,
                             ordenes$ShippedDate)) + geom_polygon ()
# este grafico nos ayuda analizar que tan rápido ha sido el envío de productos
#u ordenes desde la fecha en que se realizaron.


#d

DB_ETL<- DBI::dbConnect(odbc::odbc(),
                        Driver = "SQL Server",
                        Server = "dbtedamssql.uh.ac.cr",
                        Database = "ETL",
                        UID = rstudioapi::askForPassword("Database user"),
                        PWD = rstudioapi::askForPassword("Database password"),
                        Port = 1433)

library(dplyr)

Empleados<-dbGetQuery(DB_ETL,"select * from [dbo].[BD_Empleados]")
View(Empleados)



Empleados.por.apellido <- arrange(Empleados, Apellido1)
View(Empleados.por.apellido)


ID.Empleados = select(Empleados,ID_Empleado,Nombre1,Apellido1)
View(ID.Empleados)

Call.Center = filter(Empleados,Puesto=="Operador de Call Center")
View(Call.Center)

Ingreso.de.empleado = Empleados%>% group_by(ID_Empleado)%>% summarise((Fecha_Ingreso))
View(Ingreso.de.empleado)


#e


Porcentaje.de.nota <- function(a, b, c) a*b/c

Porcentaje.de.nota(42,60,100)



Intereses.corrientes <- function(c,i,t) c*i*t

Intereses.corrientes(4500,35,30)


#c = Capital inicial
#i = tasa de interes
#t = Tiempo 




