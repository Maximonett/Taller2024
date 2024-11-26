{
   El hipermercado Carrefour necesita un sistema para obtener 
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
número de factura estén entre X e Y (incluidos).
   
   
}


program HiperCarrefour;

type
	
	compra=record
		codC:integer;
		nroF:integer;
		cantP:integer;
		monto:real;
	end;
	
	arbolC=^nodoC;
	nodoC=record
		dato:compra;
		hi:arbolC;
		hd:arbolC;
	end;
	
	
var 
	vMonto:array[1..5] of real=(10.0,15.5,20.0,20.5,100.5);

procedure leerCompras(var c:compra);
begin
	c.codC:=random(50);
	if (c.codC<>0) then begin
		c.nroF:=random(50)+1;
		c.cantP:=random(5)+1;
		c.monto:=vMonto[random(5)+1];
	end;
end;

procedure agregarArbolCompras(var aC:arbolC; c:compra);
begin
	if (aC=nil) then begin
		new(aC);
		aC^.dato:=c;
		aC^.hi:=nil;
		aC^.hd:=nil;
	end
	else begin
		if (c.codC<aC^.dato.codC) then 
			agregarArbolCompras(aC^.hi,c)
		else
			agregarArbolCompras(aC^.hd,c);
	end;
end;

procedure cargarArbol(var aC:arbolC);
var
	c:compra;
begin
	leerCompras(c);
	while (c.codC<>0) do begin
		agregarArbolCompras(aC,c);
		leerCompras(c);
	end;
end;

procedure cantidadYMontoCompras(aC:arbolC; codC:integer;var cant:integer ;var montoT:real);
begin
	if (aC<>nil) then begin
		if (aC^.dato.codC=codC) then begin
			cant:=cant+1;
			montoT:=montoT+aC^.dato.monto;
		end;
		cantidadYMontoCompras(aC^.hi,codC,cant,montoT);
		cantidadYMontoCompras(aC^.hd,codC,cant,montoT);
	end;
end;

var
	aC:arbolC;
	cant:integer;
	montoT:real;
	codC:integer;
begin
	randomize();
	aC:=nil;
	cargarArbol(aC);
	cant:=0;
	montoT:=0;
	writeln('Elegir un codigo de cliente para ver cuantas compras realizo en 2023 y que monto total gasto');
	readln(codC);
	cantidadYMontoCompras(aC,codC,cant,montoT);
	writeln('La cantidad de compras realizadas por el cliente ',codC,' fue de ',cant,' por un monto de $ ',montoT:0:2);
end.
