{
   {1.- Se desea procesar la informaciรณn de las ventas de productos de un comercio (como mรกximo
50).

Implementar un programa que invoque los siguientes mรณdulos:

a. Un moณdulo que retorne la informaciรณn de las ventas en un vector. De cada venta se conoce el
dia de la venta, codigo del producto (entre 1 y 15) y cantidad vendida (como maximo 99
unidades). El codigo debe generarse automaticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el dรญa de venta 0 (no se procesa).

b. Un modulo que muestre el contenido del vector resultante del punto a).

c. Un modulo que ordene el vector de ventas por cรณdigo.

d. Un modulo que muestre el contenido del vector resultante del punto c).

e. Un modulo que elimine, del vector ordenado, las ventas con codigo de producto entre dos
valores que se ingresan como parรกmetros.

f. Un modulo que muestre el contenido del vector resultante del punto e).

g. Un modulo que retorne la informaciรณn (ordenada por codigo de producto de menor a
mayor) de cada codigo par de producto junto a la cantidad total de productos vendidos.

h. Un modulo que muestre la informaciรณn obtenida en el punto g).}
   
   
}


program uno;

const
dimF=50;

type

rango_dia=1..31;
rango_codigo=1..15;
rango_cantidad=0..99;

ventas=record
	dia:rango_dia;
	codigo:rango_codigo;
	cantidad:rango_cantidad;
end;

vector=array[1..dimF] of ventas;

lista=^nodo;
nodo=record
	dato:ventas;
	sig:lista
end;

procedure imprimirVector(v:vector; dimL:integer);
var
	i:integer;
begin
	writeln('---IMPRIMIR VECTOR----');
	if (dimL=0) then 
		writeln('VECTOR VACIO');
	for i:=1 to dimL do begin
		writeln('Dia de Venta: ', v[i].dia);
		writeln('Codigo de Venta: ', v[i].codigo);
		writeln('Csntidad de unidades vendidas: ', v[i].cantidad);
	end;
end;

procedure imprimirLista(l:lista);
begin
	writeln('---IMPRIMIR LISTA---');
	while (l <> nil) do begin 
		writeln('Dia de Venta: ', l^.dato.dia);
		writeln('Codigo de Venta: ', l^.dato.codigo);
		writeln('Cantidad de unidades vendidas: ', l^.dato.cantidad);
		l:=l^.sig;
	end;
end;

function aleatorio():integer;
begin
	randomize;
	aleatorio:=random(14)+1;
end;

procedure leer(var r:ventas);
begin
	writeln('---LEER---');
	writeln('Dia de venta: '); readln(r.dia);
	if (r.dia <> 0) then begin
		writeln('Cantidad de unidades vendidas: '); readln(r.cantidad);
		r.codigo:=aleatorio(); 
	end;
end;

procedure crearVector(var v:vector; var dimL:integer);
var
	i, dia:integer;
	r:ventas;
begin
	dimL:=0;
	dia:=-1;
	i:=1;
	repeat
		leer(r);
		dia:=r.dia;
		if(dia <> 0) then begin
			v[i].dia:=r.dia;
			v[i].codigo:=r.codigo;
			v[i].cantidad:=r.cantidad;
			dimL:=dimL+1;
		end;
	until (i= dimF) or (dia=0);
	writeln(dimL);
end;

procedure ordenarVector(var v:vector; dimL:integer);
var
	i,j:integer;
	aux:ventas;
begin
	for i:=1 to dimL-1 do begin
		for j:=i+1 to dimL do begin
			if (v[j].codigo< v[i].codigo) then begin
				aux:=v[i];
				v[i]:=v[j];
				v[j]:=aux;
			end;
		end;
	end;
end;

procedure eliminarDelVector(var v:vector; var dimL:integer);
var
	i,j,a,b:integer;
begin
	writeln('Ingrese dos codigos a eleiminar del vector');
	readln(a); readln(b);
	j:=1;
	for i:=1 to dimL do begin
		if (v[i].codigo <> a) and (v[i].codigo<>b)then begin
			v[j]:=v[i];
			j:= j+1;
		end;
	end;
	dimL:=j-1;
end;

procedure insertarOrdenado(var l:lista; var v:vector; i:integer);
var 
	nue,act,ant:lista;
begin
	new(nue);
	nue^.dato:=v[i];
	act:=l;
	ant:=l;
	while (act<>nil)and (v[i].codigo < act^.dato.codigo) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=ant) then 
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

function esPar(a:integer):boolean;
begin
	esPar:=(a Mod 2=0);
end;

procedure armarLista(var l:lista; v:vector;dimL:integer);
var
	i:integer;
begin 
	for i:=1 to dimL do begin
		if (esPar(v[i].codigo)) then 
			insertarOrdenado(l,v,i);
	end;
end;

//PRINCIPAL

var
	v:vector;
	dimL:integer;
	l:lista;
BEGIN
	l:=nil;
	crearVector(v,dimL); {inciso A}
	imprimirVector(v,dimL); {inciso B}
	if (dimL <> 0) then begin
		ordenarVector(v,dimL);{inciso C}
		imprimirVector(v,dimL);{inciso D}
		eliminarDelVector(v,dimL); {inciso E}
		imprimirVector(v,dimL);{inciso F}
		armarLista(l,v,dimL);{inciso G}
		imprimirLista(l);{inciso H}	
	end;
END.

