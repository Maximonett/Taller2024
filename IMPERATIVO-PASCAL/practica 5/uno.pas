{1.El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas}

program uno;

const
	dimF=10;

type
	
	oficina=record
		cod:integer; //finaliza con -1
		dni:integer;
		expensas:real;
	end;
	
	vectorO=array[1..dimF] of oficina;
	
var 
	Vexpensas:array[0..4] of real= (200.00,300.00,299.99,399.98,200.55);
	
procedure leerAleatorio(var o:oficina);
begin
	o.cod:= (-1)+ random(300-(-1)+1);
	if (o.cod <> -1) then begin
		o.dni:=random(1000);
		o.expensas:=Vexpensas[random(5)];
	end;
end;
	
	
procedure cargarVector(var v:vectorO; var dimL:integer);
var
	o:oficina;
begin
	dimL:=0;
	leerAleatorio(o);
	while (o.cod<> -1) and (dimL<dimF)do begin
		dimL:=dimL+1;
		v[dimL]:=o;
		leerAleatorio(o);
	end;
end;

procedure mostrarVector(v:vectorO; dimL:integer);
var
	i:integer;
begin
	i:=1;
	writeln('---Vector de Oficinas---');
	while (i<=dimL) do begin 
		writeln('Ofina Nº: ', v[i].cod);
		writeln('DNI del propietario: ', v[i].dni);
		writeln('Valor de las expensas: ', v[i].expensas:0:2);
		i:=i+1; //no olvidar!!!!
	end;
end;


procedure ordenarSeleccion(var v:vectorO; dimL:integer);
var
	i,j,p:integer;
	item:oficina;
begin
	for i:=1 to dimL-1 do begin
		p:=i;
		for j:=i+1 to dimL do 
			if v[j].cod< v[p].cod then
				p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
	end;
end;

procedure busquedaDicotomica(v:vectorO;var pos:integer;dimL:integer;cod:integer);
var 
	pri,ult,medio:integer;
begin
	pos:=0;
	pri:=1;
	ult:=dimL;
	medio:=(pri+ult)div 2;
	while (pri<=ult) and(cod<>v[medio].cod) do begin
		if (cod<v[medio].cod)then
			ult:=medio -1
		else
			pri:=medio+1;
		medio:=(pri+ult)div 2;
	end;
	if (pri<=ult) then
		pos:=medio
	else
		pos:=0;
end;


var
	o:oficina;
	v:vectorO;
	dimL:integer;
	cod:integer;
	pos:integer;
begin
	randomize();
	cargarVector(v,dimL);
	writeln('------------------');
	writeln('Vector desordenado');
	mostrarVector(v,dimL);
	ordenarSeleccion(v,dimL);
	writeln('------------------');
	writeln('Vector Ordenado');
	mostrarVector(v,dimL);
	writeln();
	writeln('Elegir un codigo de oficina y para ver si se encuntra dentro del vector:');
	readln(cod);
	busquedaDicotomica(v,pos,dimL,cod);
	if (pos<>0)then
		writeln('El codigo de oficina ',cod,' se encuentra en la posicion ',pos,
		' y el numero de dni el propitario es ',v[pos].dni);
end.
