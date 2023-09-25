Funcion CrearProducto ( productos Por Referencia,contadorProductos Por Referencia )  //las variables viene por referencia, asi puedan ser editadas desde la funcion
	Si contadorProductos < 100 Entonces
		contadorProductos <- contadorProductos + 1
		Escribir("Ingrese el nombre del producto:")
		Leer productos[contadorProductos,1]
		Escribir("Ingrese el precio del producto:")
		Leer productos[contadorProductos,2]
		Escribir("Producto creado exitosamente.")
	Sino
		Escribir("No se pueden agregar más productos. Límite alcanzado.")
	FinSi
Fin Funcion

Funcion EditaPrecio( productos Por Referencia, contadorProductos Por Referencia )
	Escribir("Ingrese el nombre del producto a modificar:")
	Leer nombreProducto
	Definir existe Como Logico
	existe <- Falso  //variable auxiliar para saber si existe el producto buscado
	
	Para i <- 1 Hasta contadorProductos
		Si productos[i,1] = nombreProducto Entonces
			Escribir("Ingrese el nuevo precio del producto:")
			Leer productos[i,2]
			existe <- Verdadero
		FinSi
	FinPara
	
	Si existe = Verdadero Entonces
		Escribir("Producto modificado exitosamente.")
	SiNo
		Escribir("Producto no encontrado.")
	FinSi
Fin Funcion

Funcion MostrarProductos ( productos, contadorProductos )
	Si contadorProductos > 0 Entonces
		Para i<-1 Hasta contadorProductos Hacer
			Escribir "Producto ",i,":"
			Escribir "Nombre: ",productos[i,1]
			Escribir "Precio: ",productos[i,2]
		Fin Para
	SiNo
		Escribir ("No hay productos para mostrar")
	Fin Si
Fin Funcion

Funcion CrearVenta ( ventas Por Referencia, productos, contadorProductos, contadorVentas Por Referencia )
	Escribir("Ingrese el nombre del cliente:")
	Leer nombreCliente
	Escribir("Ingrese el DNI del cliente:")
	Leer dniCliente
	Definir productoExiste Como Logico
	Definir productosVendidos Como Caracter
	productosVendidos <- ""
	Definir importeTotal Como Real
	importeTotal <- 0
	
	Repetir
		Escribir "Ingrese el nombre del producto a vender (o escribe (fin) para finalizar la venta):"
		Leer nombreProductoVenta 
		productoExiste <- Falso
		Para i <- 1 Hasta contadorProductos Hacer
			Si (productos[i,1]) = nombreProductoVenta Entonces
				productoExiste <- Verdadero
				Escribir "Ingrese la cantidad de " + nombreProductoVenta + " a vender:"
				Leer cantidadProducto 
				costoProducto <- ConvertirANumero(productos[i,2]) * cantidadProducto
				importeTotal <- importeTotal + costoProducto
				productosVendidos <- productosVendidos + nombreProductoVenta + ", "
			FinSi
		FinPara
		
		Si productoExiste = Falso Y nombreProductoVenta <> "fin" Entonces
			Escribir("Producto no encontrado.")
		FinSi
	Hasta Que nombreProductoVenta = "fin"
	
	Si importeTotal > 10000 Entonces
		importeTotal <- importeTotal * 0.8 // Aplicar descuento del 20%
		Escribir "Descuento realizado del 20%, monto superó los 10000"
	FinSi
	
	contadorVentas <- contadorVentas + 1
	ventas[contadorVentas,1] <- nombreCliente
	ventas[contadorVentas,2] <- dniCliente
	ventas[contadorVentas,3] <- productosVendidos
	ventas[contadorVentas,4] <- ConvertirATexto(importeTotal)  //Esto es para poder agregar al arreglo, porque solo pueden ser de un solo tipo
	
	Escribir("Venta realizada exitosamente.")
Fin Funcion

Funcion MostrarVentas ( ventas, contadorVentas )
	Si contadorVentas > 0 Entonces
		Para i<-1 Hasta contadorVentas Hacer
			Escribir "Venta ",i,":"
			Escribir "Cliente: ",ventas[i,1]
			Escribir "DNI: ",ventas[i,2]
			Escribir "Productos vendidos: ",ventas[i,3]
			Escribir "Importe total: $",ventas[i,4]
		Fin Para
	SiNo
		Escribir ("No hay ventas para mostrar")
	Fin Si
	
Fin Funcion

Algoritmo SistemaVentaMayorista
    Dimension productos[100,2] // limite de 100 productos, cada uno con nombre y precio
    Dimension ventas[100,4]   // limite de 100 ventas, cada una con cliente, dni, productos e importe total
	
    // Variable para el contador de productos
    Definir contadorProductos como Entero
    contadorProductos <- 0
	
    // Variable para el contador de ventas
    Definir contadorVentas como Entero
    contadorVentas <- 0
	
    // Menú principal
    Repetir
        Escribir("1. Crear producto")
        Escribir("2. Editar precio")
        Escribir("3. Mostrar productos")
        Escribir("4. Crear venta")
		Escribir("5. Mostrar ventas")
        Escribir("6. Salir")
        Escribir("Seleccione una opción:")
        Leer opcionMenu
		
        Segun opcionMenu Hacer  //llamar a las funciones dependiedo el caso seleccioando
            Caso 1:
                CrearProducto(productos, contadorProductos)
            Caso 2:
                EditaPrecio(productos, contadorProductos)
            Caso 3:
                MostrarProductos(productos, contadorProductos)
            Caso 4:
                CrearVenta(ventas, productos, contadorProductos, contadorVentas)
			Caso 5:
				MostrarVentas( ventas, contadorVentas )
            Caso 6:
                Escribir("Gracias por utilizar el sistema.")
            Otro:
                Escribir("Opción no válida. Intente de nuevo.")
        Fin Segun
    Hasta Que opcionMenu = 6
FinAlgoritmo	