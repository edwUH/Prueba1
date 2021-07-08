library("DBI")
library("odbc")
library("dbplyr")

DB_BikeStores <- DBI::dbConnect(odbc::odbc(),
                                Driver = "SQL Server",
                                Server = "dbtedamssql.uh.ac.cr",
                                Database = "BikeStores",
                                UID = rstudioapi::askForPassword("Database user"),
                                PWD = rstudioapi::askForPassword("Database password"),
                                Port = 1433)

Stores<-dbGetQuery(DB_BikeStores,"select * from [sales].[order_items]")
View(Stores)


DB_Northwind <- DBI::dbConnect(odbc::odbc(),
                               Driver = "SQL Server",
                               Server = "dbtedamssql.uh.ac.cr",
                               Database = "Northwind",
                               UID = rstudioapi::askForPassword("Database user"),
                               PWD = rstudioapi::askForPassword("Database password"),
                               Port = 1433)

ordenes <-dbGetQuery(DB_Northwind,"select * from [orders]")
View(ordenes)


ggplot (data = ordenes, aes (ordenes$OrderID,ordenes$ShipCountry)) + geom_poin ()

ggplot (data = ordenes, aes (ordenes$OrderDate, 
                             ordenes$ShippedDate)) + geom_point ()

