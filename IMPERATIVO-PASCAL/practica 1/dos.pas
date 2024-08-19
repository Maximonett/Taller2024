{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}


program dos;

const
	dimF=300;

type
	oficina=record
		codigo,dni:integer;
		expensas: real;
	end;
	
	vector = array [1..dimF] of oficina;
	
procedure imprimir (v:vector; dimL:integer);
var
	i:integer;
begin
	writeln('-----IMPRIMIR VECTOR-----');
	for i:=1 to dimL do begin
		writeln('Codigo de la oficina: ', v[i].codigo);
		writeln('DNI del propietario: ', v[i].dni);
		writeln('Expensas: ', v[i].expensas:0:2);
	end;
end;

procedure leer(var r:oficina);
begin
	writeln;
	writeln('---LEER---');
	writeln;
	writeln('Codigo de la oficina: '); readln(r.codigo);
	if (r.codigo<>-1) then begin
		writeln('DNI del propietario: '); readln(r.dni);
		writeln('Expensas: '); readln(r.expensas);
	end;
end;

procedure armarVector(var v:vector; var dimL:integer);
var
	i:integer; r:oficina;
begin
	dimL:=0;
	i:=1;
	repeat
		leer(r);
		if (r.codigo <> -1) then begin
			v[i].codigo:=r.codigo;
			v[i].dni:=r.dni;
			v[i].expensas:= r.expensas;
			dimL:=dimL+1;
		end;
		i:=i+1;
	until (i=dimF) or (r.codigo= -1);
end;


//***********************************************************


procedure ordenarInsercion(var v:vector; dimL:integer);
var
	i, j: integer;
	actual:oficina;
begin
	for i:=2 to dimL do begin;
		actual:=v[i];
		j:=i+1;
		while (j>0) and (v[j].codigo > actual.codigo) do begin //Forma ascendente
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

//***********************************************************

procedure ordenarSeleccion(var v:vector;dimL:integer);
var
	i,j,pos: integer;
	actual:oficina;
begin
	for i:=1 to dimL-1 do begin
		pos:=i;
		for j:=i+1 to dimL do
			if v[j].codigo > v[pos].codigo then  //Forma descendente
				pos:=j;
			actual:=v[pos];
			v[pos]:=v[i];
			v[i]:=actual;
	end;
end;
//*****************************PRINCIPAL**********************

VAR
	v:vector;
	dimL:integer;
BEGIN
	armarVector(v,dimL); {inciso A}
	if (dimL=0) then
		writeln('Vector Vacio')
	else begin
		imprimir(v,dimL);
		ordenarInsercion(v,dimL); {inciso B}
		imprimir(v,dimL);
		ordenarSeleccion(v,dimL); {inciso C}
		imprimir(v,dimL);
	end;
END.

