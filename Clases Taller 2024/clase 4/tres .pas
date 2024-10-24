{3.Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

program tres;

type
	venta = record
		codV: integer;
		codP: integer;
		cantVen: integer;
		precioUni: real;
	end;

	producto = record
		codP: integer;
		cantTotal: integer;
		montoTotal: real;
	end;

	arbolP = ^nodoP;
	nodoP = record
		dato: producto;
		hi: arbolP;
		hd: arbolP;
	end;

var
	vPrecio: array[1..5] of real = (20.00, 12.99, 2.50, 3.99, 90.55);

procedure leerAleatorio(var v: venta);
begin
	v.codV := random(101) - 1;  // Genera un número aleatorio entre -1 y 100
	if (v.codV <> -1) then begin
		v.codP := random(100);  // Genera un código de producto aleatorio
		v.cantVen := random(50);  // Cantidad vendida aleatoria
		v.precioUni := vPrecio[random(5) + 1];  // Precio unitario aleatorio
	end;
end;

procedure agregarArbolProductos(var aP: arbolP; v: venta);
var
	p: producto;
begin
	if (aP = nil) then begin
		new(aP);
		p.codP := v.codP;
		p.cantTotal := v.cantVen;
		p.montoTotal := v.cantVen * v.precioUni;
		aP^.dato := p;
		aP^.hi := nil;
		aP^.hd := nil;
	end
	else begin
		if (v.codP < aP^.dato.codP) then
			agregarArbolProductos(aP^.hi, v)
		else if (v.codP > aP^.dato.codP) then
			agregarArbolProductos(aP^.hd, v)
		else begin
			aP^.dato.cantTotal := aP^.dato.cantTotal + v.cantVen;   // actualizo la cantidad de producto vendido
			aP^.dato.montoTotal := aP^.dato.montoTotal + (v.cantVen * v.precioUni);  // actualizo el monto total
		end;
	end;
end;

procedure cargarArbolProductos(var aP: arbolP);
var
	v: venta;
begin
	leerAleatorio(v);
	while (v.codV <> -1) do begin
		agregarArbolProductos(aP, v);
		leerAleatorio(v);
	end;
end;

{------------------------------------------------------------------------------}


procedure imprimirArbolProductos(aP: arbolP);
begin
	if (aP <> nil) then begin
		imprimirArbolProductos(aP^.hi);
		writeln('************************************');
		writeln('Nº de producto: ', aP^.dato.codP);
		writeln('La cantidad de producto vendida fue de ', aP^.dato.cantTotal);
		writeln('El monto total que se vendió del producto nº ', aP^.dato.codP, ' es de $ ', aP^.dato.montoTotal:0:2);
		writeln('************************************');
		imprimirArbolProductos(aP^.hd);
	end;
end;


{------------------------------------------------------------------------------}


{c. Retornar el código de producto con mayor cantidad de unidades vendidas.}

function codigoMayorCantidadVendido(aP: arbolP): integer;
var
	maxCodigo, maxVentas: integer;
	procedure buscarMaximo(aP: arbolP);
	begin
		if (aP <> nil) then begin
			if (aP^.dato.cantTotal > maxVentas) then begin
				maxVentas := aP^.dato.cantTotal;
				maxCodigo := aP^.dato.codP;
			end;
			buscarMaximo(aP^.hi);
			buscarMaximo(aP^.hd);
		end;
	end;
begin
	if (aP = nil) then
		codigoMayorCantidadVendido := 0 // Si el árbol está vacío, retorna 0
	else begin
		// Inicializa los valores de búsqueda
		maxVentas := -1;
		maxCodigo := 0;
		buscarMaximo(aP); // Llama a la función auxiliar para buscar el máximo
		codigoMayorCantidadVendido := maxCodigo; // Retorna el código de producto con mayor ventas
	end;
end;

{------------------------------------------------------------------------------}
{d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.}
{------------------------------------------------------------------------------}

function CantidadDeCodigosMenores(aP:arbolP; valor:integer):integer;
begin
	if (aP=nil) then
			cantidadDeCodigosMenores:=0
	else begin
		if (aP^.dato.codP< valor) then
			cantidadDeCodigosMenores:= 1 +cantidadDeCodigosMenores(aP^.hi,valor)
									+ cantidadDeCodigosMenores(aP^.hd,valor)
		else
			//recorre el subarbol izquierdo por si hay un valor que no se conto
			cantidadDeCodigosMenores:=cantidadDeCodigosMenores(aP^.hi,valor);
		
	end;	
end;

{e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

procedure montoEntreCodigosII(aP:arbolP);
var 
	ini,fin:integer;

	function montoEntreCodigos(aP: arbolP; ini, fin: integer): real;
	begin
		if aP = nil then
			montoEntreCodigos := 0
		else begin
			// Caso 1: El código del producto actual está dentro del rango (sin incluir los límites)
			if (aP^.dato.codP > ini) and (aP^.dato.codP < fin) then
				montoEntreCodigos := aP^.dato.montoTotal 
									 + montoEntreCodigos(aP^.hi, ini, fin)
									 + montoEntreCodigos(aP^.hd, ini, fin)
			else begin
				// Caso 2: El código del producto es menor o igual que `ini`, buscar en el subárbol derecho
				if aP^.dato.codP <= ini then
					montoEntreCodigos := montoEntreCodigos(aP^.hd, ini, fin)
				else
					// Caso 3: El código del producto es mayor o igual que `fin`, buscar en el subárbol izquierdo
					montoEntreCodigos := montoEntreCodigos(aP^.hi, ini, fin);
			end;
		end;
	end;
begin
	ini:=50;
	fin:=80;
	writeln();
	writeln('El monto total entre los codigos con valor 50 y 80 es ',montoEntreCodigos(aP,ini,fin):0:2);
end;



{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}

var
	aP: arbolP;
	valor:integer;
begin
	aP := nil;
	cargarArbolProductos(aP);
	imprimirArbolProductos(aP);
	writeln('El codigo de productos con mayor ventas es: ',codigoMayorCantidadVendido(aP));
	writeln('Elegir un numero de codigo: ');
	readln(valor);
	writeln('La cantidad de codigo de productos menores al valor de codigo proporcionado es: ',cantidadDeCodigosMenores(aP,valor));
	montoEntreCodigosII(aP);
end.


