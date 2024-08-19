{
   Implementar un programa que procese las ventas de un supermercado. El supermercado
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas.
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de
producto y retorne la cantidad de unidades vendidas de ese código de producto.
   
   
}


program tres;

type 

rango_productos=1..1000;

Precios=record
	Precio:real;
	Stock:Integer;
end;

VectorPrecios=array[rango_productos] of Precios ;

Venta=record
	CodigoV:integer;
	productosVendidos:listaP;
end;

producto=record
	codigoP:integer;
	cantidadVendida:integer;
	precioUnit:real;
	total:real;
end;

listaP=^nodo
nodo=record
	dato:producto;
	sig:listaP;
end;

venta=record
	codigo:nteger;
	productos:listaP;
end;

procedure agregarProducto(var L:listaP; P:producto);
var
	nue:listaP;
begin
	new(nue);
	nue^.dato:=P;
	nue^.sig:=L;
	L:=nue;
end;

procedure LeerProducto(var P:producto; tabla:VectorPrecios);
begin
	writeln('Codigo de Producto (del 1 al 1000): '); readln(P.codigoP);
	writeln('Cantidad solicitada: '); readln(P.cantidadVendida);
	If (P.cantidadVendida > tabla[P.codigoP].Stock)then
		P.cantidadVendida:=tabla[P.codigoP].Stock;
	P.total:=P.cantidadVendida * tabla[P.codigoP].Precio;
end;



procedure Venta(var V:venta);
begin
	repeat
		
	
	until (V.codigo = -1) 
end;

procedure Tickets(Ventas:listaV, )

BEGIN
	
	
END.

