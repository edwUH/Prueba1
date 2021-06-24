#1
Estudiantes = c (59,62,69,95,100,26,85,89,47,98)

names (Estudiantes) = c ("Carlos", "Maria", "Oscar", "Jesus", "Fernanda",
                          "Jose", "Edwin","Orlando", "Tanya", "Natalia")

names (Estudiantes)

plot(Estudiantes)

#2

#filter: Buscar los materiales del sector de Finanzas

View(Finanzas)

Finanzas = data.frame(financials)


View (filter (Finanzas, Sector == "Materials"))

#Group by: Saber el precio máximo de cada sector de finanzias

dataAgrupada = Finanzas%>%group_by(Sector)%>%
                summarise(max(Price))

#Arrege: Ordenar los caracteres por su precio

View(arrange(Finanzas, Price))

#Mutate: Restar el precio de la venta de los prodctos para saber su precio
#final

Finanzas = mutate(Finanzas, Final.Price = Price - Price.Sales)
  
View(Finanzas)

#Select: ver solo los datos mas relevantes de la tabla.

View(select(Finanzas, Symbol, Name, Sector, Price, Final.Price))

#3

Salarios=c(432.21,239.48,249.94,373.22,233.86,366,331.11,258.86,349.20,31.60)

names(Salarios) = c ("Argentina","Bolivia","Brasil","Chile","Colombia",
                     "Ecuador","Paraguay","Perú","Uruguay","Venezuela")


mean (Salarios)
sd (Salarios)
min(Salarios)
max(Salarios)


#4
FacturadeEmpleados = data.frame(Facturas)
NombredeEmpleados = data.frame(Empleados)

View(merge(FacturadeEmpleados, NombredeEmpleados, by = "EmployeeID"))

#5
UnidadesCafe = c (7,6,5,8,7,7,7,5,6,8)

sd (UnidadesCafe)

#6
quantile(UnidadesCafe, prob = c(0,0.25,0.50,0.75,1))




  