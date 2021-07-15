library("DBI")
library("odbc")
library("dbplyr")




DB_Northwind <- DBI::dbConnect(odbc::odbc(),
                               Driver = "SQL Server",
                               Server = "dbtedamssql.uh.ac.cr",
                               Database = "Northwind",
                               UID = rstudioapi::askForPassword("Database user"),
                               PWD = rstudioapi::askForPassword("Database password"),
                               Port = 1433)



Clientes<-dbGetQuery(DB_Northwind,"select * from [Customers]")
View(Clientes)



ordenes <-dbGetQuery(DB_Northwind,"select * from [orders]")
View(ordenes)



Northwind<-dbGetQuery(DB_Northwind,"Select * from Orders")
View(Northwind)



ggplot (data = Clientes, aes (Clientes$CustomerID, Clientes$Country)) + geom_point()




ggplot (data = ordenes, aes (ordenes$OrderDate,
                             ordenes$ShippedDate)) + geom_point ()



qplot(ShipCountry, OrderDate, data = Northwind, color=ShipCountry,
      xlab="Pais", ylab="Fecha de orden", main="Fecha de la orden por pais")

