 {3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).
}


program tres;

const
	dimF=8;
type
	pelicula=record
		codigo:integer;
		genero:1..8;
		puntajePromedio:real;
	end;

	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	
	vector =array [1..dimF] of lista;
	
	vector2= array[1..dimF] of pelicula;
	
procedure imprimirVector(v:vector2);
var
	i:integer;
begin
	writeln;
	writeln('---IMPRIMIR VECTOR---');
	for i:=1 to dimF do begin
		if v[i].codigo <> 0 then begin
			writeln;
			writeln('Codigo de la Pelicula: ', v[i].codigo);
			writeln('Genero de la Pelicula: ', v[i].genero);
			writeln('Puntaje Promedio de la Pelicula: ', v[i].puntajePromedio:0:2);
		end;
	end;
end;
	
procedure imprimirVectorListas(v:vector);
var
	i:integer;
begin
	writeln;
	writeln('-------LISTAS--------');
	for i:=1 to dimF do begin
		writeln;
		writeln('----LISTA ', i,'-----');
		while v[i]<> nil do begin
			writeln;
			writeln('Codigo de Pelicula: ', v[i]^.dato.codigo);
			writeln('Genero de Pelicula: ', v[i]^.dato.genero);
			writeln('Puntaje Promedio de la Pelicula: ', v[i]^.dato.puntajePromedio:0:2);
			v[i]:=v[i]^.sig;
		end;
	end;
end;	

procedure leer(var r:pelicula);
begin
	writeln;
	writeln('---LEER----');
	writeln;
	writeln('Codigo de Pelicula: '); readln(r.codigo);
	if (r.codigo <> -1) then begin
		writeln('Genero de Pelicula: ');readln(r.genero);
		writeln('Puntaje Promedio de la Pelicula: '); readln(r.puntajePromedio);
	end;
end;

procedure agregarAtras(var v:vector; r:pelicula;i:integer);
var 
	nue,ult:lista;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=nil;
	if (v[i]= nil) then
		v[i]:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure armarVectorLista(var v:vector);
var
	cod,i:integer;
	r:pelicula;
begin
	cod:=0;
	while(cod<>-1) do begin
		leer(r);
		cod:=r.codigo;
		i:=r.genero;
		if(cod <> -1)then
			agregarAtras(v,r,i);
	end;
end;

procedure mejorPuntaje(v:vector; var v2:vector2);
var
	i:integer;
	max:real;
begin
	for i:=1 to dimF do begin
		max:=0;
		while (v[i]<> nil) do begin
			if (v[i]^.dato.puntajePromedio>max)then begin
					max:=v[i]^.dato.puntajePromedio;
					v2[i]:=v[i]^.dato;
			end;
			v[i]:=v[i]^.sig;
		end;
	end;
end;

procedure ordenarInsercion(var v:vector2);
var
	i, j: integer;
	actual:pelicula;
begin
	for i:=2 to dimF do begin
		actual:=v[i];
		j:=i-1;
		while (j>0) and (v[j].puntajePromedio>actual.puntajePromedio) do begin //Forma Ascendente
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

procedure mayorMenor(v:vector2);
var
	codMax, codMin, i:integer;
	max,min:real;
begin
	max:=0;
	min:=0;
	for i:=1 to dimF do begin
		if (v[i].puntajePromedio>max) or (max=0) then begin
			max:=v[i].puntajePromedio;
			codMax:=v[i].codigo;
		end;
		if (v[i].puntajePromedio< min) or (min=0) then begin 
			min:=v[i].puntajePromedio;
			codMin:=v[i].codigo;
		end;
	end;
	writeln;
	writeln('La Pelicuala con Mayor puntaje es: ', codMax,' con ',max:0:2,' puntos.');
	writeln('La Pelicuala con Menor puntaje es: ', codMin,' con ',min:0:2,' puntos.');
end;

//------------------PRINCIPAL-----------------

var
    v:vector;
    v2:vector2;
    
begin
    armarVectorLista(v); {inciso A}
    imprimirVectorListas(v);
    mejorPuntaje(v,v2); {inciso B}
    imprimirVector(v2);
    ordenarInsercion(v2); {inciso C}
    imprimirVector(v2);
    mayorMenor(v2); {inciso D}
end.
