{El hipermercado Carrefour necesita un sistema para obtener 
estadísticas sobre las compras realizadas por sus clientes.
a)Implementar un módulo que lea información de todas las compras de 2023, 
los almacene y retorne una estructura de datos eficiente para la búsqueda 
por código de cliente| donde para cada código de cliente se almacenen juntas 
todas sus compras. De cada compra se conoce: código de cliente, 
número de factura, cantidad de productos y monto. La lectura finaliza con 
el código de cliente 0.
b)Implementar un módulo que reciba la estructura generada en a), un código 
de cliente y retorne la cantidad de compras y el monto total gastado por 
dicho cliente durante el 2023.
c) Realizar un módulo que reciba la estructura generada en a) y 
dos números de factura X e Y, y retorne todas las ventas cuyo 
número de factura estén entre X e Y (incluidos).}


program carrefour;

type
	//2023/ busqueda por codigo de cliente/por cada cliente todas las compras
	
	compra=record
		factura:integer;
		cantP:integer;
		monto:real;
	end;
	
	listaC=^nodo;
	nodo=record
		dato:compra;
		sig:listaC;
	end;
	
	arbolC=^nodoC;
	nodoC=record
		cliente:integer;
		ListaCompra:listaC;
		hi:arbolC;
		hd:arbolC;
	end;
	
var 
	vMonto:array[1..5] of real=(200.00,300.00,478.00,255.90,100.00);

procedure leerAleatorio(var c:compra; var cliente:integer);
begin
	cliente:=random(101);
	if (cliente<>0) then begin
		c.factura:=random(100)+1000;
		c.cantP:=random(20)+1;
		c.monto:=vMonto[random(5)+1];
	end;
end;

procedure agregarAdelante(var L:listaC;var c:compra);
var
	nue:listaC;
begin
	new(nue);
	nue^.dato:=c;
	nue^.sig:=L;
	L:=nue;
end;

procedure agregaArbolCompras(var aC:arbolC; c:compra; cliente:integer);
begin
	if(aC=nil) then begin
		new(aC);
		aC^.cliente:=cliente;
		aC^.ListaCompra:=nil;
		agregarAdelante(aC^.ListaCompra,c);
		aC^.hi:=nil;
		aC^.hd:=nil;
	end
	else begin
		if (cliente<aC^.cliente) then
			agregaArbolCompras(aC^.hi,c,cliente)
		else if (cliente> aC^.cliente) then
			agregaArbolCompras(aC^.hd,c,cliente)
		else
			agregarAdelante(aC^.ListaCompra,c);
	end;
end;

procedure cargarArbolCompras(var aC:arbolC);
var
	c:compra;cliente:integer;
begin
	leerAleatorio(c,cliente);
	while (cliente<>0) do begin
		agregaArbolCompras(aC,c,cliente);
		leerAleatorio(c,cliente);
	end;
end;

procedure mostrarLista(L:listaC);
begin
	while (L<>nil) do begin
		writeln(' Factura: ', L^.dato.factura,' Cantidad de Productos: '
				,L^.dato.cantP,' Monto ',L^.dato.monto:0:2);
		L:=L^.sig;
	end;
end;

procedure mostrarArbol(aC:arbolC);
begin
	if (aC<>nil) then begin
		mostrarArbol(aC^.hi);
		writeln('Cliente: ',aC^.cliente);
		mostrarLista(aC^.ListaCompra);
		mostrarArbol(aC^.hd);
	end;	
end;

var
	aC:arbolC;
begin
	randomize();
	aC:=nil;
	cargarArbolCompras(aC);
	mostrarArbol(aC);
end.



