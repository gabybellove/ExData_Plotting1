R version 4.4.1 (2024-06-14 ucrt) -- "Race for Your Life"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64

R es un software libre y viene sin GARANTIA ALGUNA.
Usted puede redistribuirlo bajo ciertas circunstancias.
Escriba 'license()' o 'licence()' para detalles de distribucion.

R es un proyecto colaborativo con muchos contribuyentes.
Escriba 'contributors()' para obtener más información y
'citation()' para saber cómo citar R o paquetes de R en publicaciones.

Escriba 'demo()' para demostraciones, 'help()' para el sistema on-line de ayuda,
o 'help.start()' para abrir el sistema de ayuda HTML con su navegador.
Escriba 'q()' para salir de R.

[Workspace loaded from C:/Users/ingjo/Desktop/Coursera/ExData_Plotting1/.RData]

> # Definir la URL del archivo ZIP
> url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
> 
> # Definir el nombre del archivo ZIP y el nombre del archivo de texto
> zip_file <- "household_power_consumption.zip"
> txt_file <- "household_power_consumption.txt"
> 
> # Descargar el archivo ZIP
> if (!file.exists(zip_file)) {
+     download.file(url, zip_file, mode = "wb")
+ }
probando la URL 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
Content type 'application/zip' length 20640916 bytes (19.7 MB)
downloaded 19.7 MB

> 
> # Descomprimir el archivo ZIP
> if (!file.exists(txt_file)) {
+     unzip(zip_file)
+ }
> 
> # Cargar el paquete data.table
> library(data.table)
data.table 1.16.4 usando 6 hilos (ver ?getDTthreads).  Últimas novedades: r-datatable.com
**********
Ejecutando data.table en Español; El soporte del paquete está disponible solo en inglés. Cuando busque ayuda en línea, asegúrese de comprobar también el mensaje de error en inglés. Esto se puede obtener mirando los archivos po/R-<locale>.po y po/<locale>.po en el código fuente del paquete, donde se pueden encontrar los mensajes de error en el idioma nativo y en inglés uno al lado del otro
* *********
Aviso:
package ‘data.table’ was built under R version 4.4.2 
> 
> # Leer los datos y filtrar por las fechas de interés
> datos <- fread(txt_file, na.strings = "?", 
+                colClasses = list(character = c("Date", "Time")),
+                select = c("Date", "Time", "Global_active_power", 
+                           "Global_reactive_power", "Voltage", 
+                           "Global_intensity", "Sub_metering_1", 
+                           "Sub_metering_2", "Sub_metering_3"))[
+                               as.Date(Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"))
+                           ]
> 
> # Crear una columna DateTime combinando Date y Time
> datos[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
> 
> # Definir el nombre del archivo
> archivo <- "household_power_consumption.txt"
> 
> # Verificar si el archivo existe en el directorio de trabajo actual
> if (!file.exists(archivo)) {
+     stop("El archivo 'household_power_consumption.txt' no se encuentra en el directorio de trabajo.")
+ }
> 
> # Cargar los datos
> datos <- read.table(archivo, header = TRUE, sep = ";", na.strings = "?")
> 
> # Convertir la columna 'Date' a formato Date
> datos$Date <- as.Date(datos$Date, format = "%d/%m/%Y")
> 
> # Filtrar los datos para las fechas 2007-02-01 y 2007-02-02
> datos_filtrados <- subset(datos, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
> 
> # Combinar las columnas 'Date' y 'Time' en una sola columna de tipo POSIXct
> datos_filtrados$DateTime <- as.POSIXct(paste(datos_filtrados$Date, datos_filtrados$Time), format = "%Y-%m-%d %H:%M:%S")
> 
> # plot1.R
> 
> # Crear el histograma
> png("plot1.png", width = 480, height = 480)
> hist(datos_filtrados$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
> dev.off()
null device 
          1 
> 
> # plot2.R
> 
> # Crear el gráfico de líneas
> png("plot2.png", width = 480, height = 480)
> plot(datos_filtrados$DateTime, datos_filtrados$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
> dev.off()
null device 
          1 
> 
> # plot3.R
> 
> # Crear el gráfico de sub-metering
> png("plot3.png", width = 480, height = 480)
> plot(datos_filtrados$DateTime, datos_filtrados$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
> lines(datos_filtrados$DateTime, datos_filtrados$Sub_metering_2, col = "red")
> lines(datos_filtrados$DateTime, datos_filtrados$Sub_metering_3, col = "blue")
> legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
> dev.off()
null device 
          1 
> 
> # plot4.R
> 
> # Crear el panel de gráficos
> png("plot4.png", width = 480, height = 480)
> par(mfcol = c(2, 2))
> 
> 
> ::contentReference[oaicite:0]{index=0}
Error: inesperado '::' en "::"
> 
