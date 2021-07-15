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



ordenes <-dbGetQuery(DB_Northwind,"select * from [orders]")
View(ordenes)


Inventario<-dbGetQuery(DB_Northwind,"select * from [dbo].[Out_Final_WLP]")
View(Inventario)

Northwind<-dbGetQuery(DB_Northwind,"Select * from Orders")
View(Northwind)




ggplot (data = Clientes, aes (Clientes$CustomerID, Clientes$Country)) + geom_point()
#este ggplot nos muestra los paises que donde se han enviado los paquetes,
#esto nos demuestra que USA es donde mas se han enviado,
#mientras Portugal y Austria donde menos se han enviad.



ggplot (data = ordenes, aes (ordenes$OrderDate,
                             ordenes$ShippedDate)) + geom_point ()
# este grafico nos ayuda analizar que tan rápido ha sido el envío de productos
#u ordenes desde la fecha en que se realizaron.


ggplot (data = Inventario, aes (Inventario$ProductID, 
                                      Inventario$UnitsInStock))+ geom_point ()
#Este gráfico ayuda a analizar cuales son los productos que tenemos
#en inventario para saber de cuales es necesario solicitar mas.


qplot(ShipCountry, OrderDate, data = Northwind, color=ShipCountry,
      xlab="Pais", ylab="Fecha de orden", main="Fecha de la orden por pais")
#En este gráfico podemos observar la fehca de la orden de cada pais
#donde deducimos que Francia y Alemania es donde mas se ha entregado paquetes.



