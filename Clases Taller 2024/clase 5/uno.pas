{1.El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program uno;

const
	dimF=300;

type
	rango_oficina=0..dimF;
	
	oficina=record
		id:integer;
		dni:integer;
		expensas:real;
	end;
	
	vectorO= array[rango_oficina] of oficina;
	
var
	vectorEx:array[1..5] of real=(100.00,150.00,200.00,250.00,300.00);


{a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.}

procedure leerAleatorio(var o:oficina);
begin
	o.id:=random(301);
	if (o.id<>0) then begin
		o.dni:=random(300)+1;
		o.expensas:=vectorEx[random(5)+1];
	end;
end;
	

procedure cargarVector(var v:vectorO;var dimL:rango_oficina);
var 
	o:oficina;
begin
	dimL:=0;
	leerAleatorio(o);
	while (o.id <> 0) and (dimL<dimF) do begin //ojo!!! no debe ser <= para no pasarse
		dimL:=dimL+1;
		v[dimL]:=o;
		leerAleatorio(o);
	end;
end;

{b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.}

procedure ordenarSelecion(var v:vectorO;dimL:rango_oficina);
var 
	i,j,p:rango_oficina;
	item:oficina;
begin
	for i:=1 to dimL-1 do begin
		p:=i;
		for j:=i+1 to dimL do
			if (v[j].id < v[p].id) then
				p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
	end; 
end;

{c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.}

procedure busquedaDicotomica(var v:vectorO; var pos:integer;dimL:rango_oficina;id:rango_oficina);
var
	pri,ult,medio:rango_oficina;
begin
	pos:=0;
	pri:=1;
	ult:=dimL;
	medio:= (pri+ult) div 2;
	while (pri<=ult) and (id<>v[medio].id) do begin
		if (id <v[medio].id) then
			ult:= medio-1
		else
			pri:=medio+1;
		medio:=(pri + ult )div 2;
	end;
	if (pri<=ult) then
		pos:=medio
	else
		pos:=0;
end;

{Un módulo recursivo que retorne el monto total de las expensas.}

function expensasTotal(v:vectorO; dimL:rango_oficina):real;
begin
	if (dimL=0)then
		expensasTotal:=0
	else
		expensasTotal:=v[dimL].expensas + expensasTotal(v,dimL-1);
end;


var
	dimL:rango_oficina;
	v:vectorO;
	pos:integer;
	id:rango_oficina;
	total:real;
begin	
	randomize();
	cargarVector(v,dimL);
	ordenarSelecion(v,dimL);
	writeln('Elegir un numero de oficina a buscar: ');
	readln(id);
	busquedaDicotomica(v,pos,dimL,id);
	if (pos<> 0) then
		writeln('El DNI del propietario es: ', v[pos].dni)
	else
		writeln('Oficcina no encontrada.');
	
	total:=expensasTotal(v,dimL);
	writeln('El monto total de expensas de todas las oficinas es: ',total:0:2);
end.
