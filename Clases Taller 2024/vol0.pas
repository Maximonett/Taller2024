program Prac1Ej3;

type
	subgenero = 1..8;
	
	pelicula = record
		codigo: integer;
		genero: subgenero;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		elem: pelicula;
		sig: lista;
	end;
	
	punteros = record
		pri: lista;
		ult: lista;															// PREGUNTAR SI SE HACE ASI
	end;
	vector = array[subgenero] of punteros;
	puntajes = array[subgenero] of pelicula;
	
{----------------------------------------------------------}
//PROCESOS Y FUNCIONES
{----------------------------------------------------------}

procedure inicializarVector(var v: vector);
var i: subgenero;
begin
	for i:= 1 to 8 do
		begin
			v[i].pri:= nil;
			v[i].ult:= nil;
		end;
end;
{----------------------------------------------------------}
procedure agregarDetras(var p: punteros; pel: pelicula);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.elem:= pel;
	nuevo^.sig:= nil;
	
	if  p.pri = nil then
		begin
			p.pri := nuevo; // La lista estaba vacía
			p.ult := nuevo;
		end
    else
		begin
			p.ult^.sig := nuevo;  // Agregar el nuevo nodo al final de la lista
			p.ult := nuevo;       // Actualizar el puntero al último nodo
		end;
end;
{----------------------------------------------------------}
procedure leerPelicula(var p: pelicula);
begin
	writeln('Ingrese Codigo de pelicula: ');
	readln(p.codigo);
	if (p.codigo <> -1) then
		begin
			writeln('Ingrese genero de pelicula: ');
			readln(p.genero);
			writeln('Ingrese puntaje de pelicula: ');
			readln(p.puntaje);
		end
	else 
		writeln('Codigo de pelicula es -1 y se termina la lectura');
end;
{----------------------------------------------------------}
procedure cargarVector(var v:vector);
var
	aux: pelicula;
begin
	inicializarVector(v);
	leerPelicula(aux);
	while (aux.codigo <> -1) do
		begin
			agregarDetras(v[aux.genero], aux);
			leerPelicula(aux)
		end;
end;
{----------------------------------------------------------}
procedure recorrerLista(l: lista; var codigo: integer;var puntaje: real);
var
	max: real;
begin
	max:= -1;
	while (l<>nil) do
		begin	
			if( max < l^.elem.puntaje) then
				begin
					max:= l^.elem.puntaje;
					codigo:= l^.elem.codigo;
					puntaje:= l^.elem.puntaje;
				end;
			l:= l^.sig;
		end;
end;

{----------------------------------------------------------}
procedure generarVectorPuntajes(v: vector; var vpuntajes: puntajes);
var
i: subgenero;
p: pelicula;
begin
	for i:= 1 to 8 do
		begin
			p.genero:= i;
			p.codigo:= 0;
			p.puntaje:= 0;
			recorrerLista(v[i].pri, p.codigo,p.puntaje);
			vpuntajes[i]:= p;
		end;
end;
{----------------------------------------------------------}
procedure recorrerLista2(l: lista);
begin
	while l<>nil do
		begin
			writeln('Codigo de pelicula: ', l^.elem.codigo,', Codigo de genero: ', l^.elem.genero,', Puntaje: ', l^.elem.puntaje:0:2);
			l:= l^.sig;
		end;
end;
{----------------------------------------------------------}
procedure imprimirLasPeliculas(v: vector);
var i: subgenero;
begin
	for i:= 1 to 8 do
		begin
			recorrerLista2(v[i].pri)
		end;
end;
{----------------------------------------------------------}
procedure imprimirVector(v: puntajes);
var i: subgenero;
begin
	for i:= 1 to 8 do
		begin
			writeln('El codigo de la pelicula con mayor puntaje del genero: ',v[i].genero,' es: ',v[i].codigo);
		end;
end;
{----------------------------------------------------------}
procedure OrdenarVector(var v: puntajes);
var
i,j,minimo: integer;
item: pelicula;
begin
	for i:= 1 to 8-1 do
		begin
			minimo:= i;
			for j:= 1 to 8 do
				if v[ j ].puntaje < v[ minimo ].puntaje then minimo:=j;
			item:= v[minimo];
			v[minimo]:= v[i];
			v[i]:= item;
		end;
end;
procedure codigoMayorYMenor(v: puntajes);
begin
	writeln('El codigo de la pelicula con menor puntaje es: ', v[1].codigo,', mientras que el mayor puntaje lo tiene el codigo: ',v[8].codigo);
end;
{----------------------------------------------------------}
            //       PROGRAMA PRINCIPAL       //   
{----------------------------------------------------------}
var
	v: vector;
	vpuntajes: puntajes;
BEGIN
	cargarVector(v);
	writeln('----------------------------------------------------------');		
	imprimirLasPeliculas(v);
	writeln('----------------------------------------------------------');
	generarVectorPuntajes(v,vpuntajes);
	imprimirVector(vpuntajes);
	writeln('----------------------------------------------------------');
	OrdenarVector(vpuntajes);
	imprimirVector(vpuntajes);
	writeln('----------------------------------------------------------');
	codigoMayorYMenor(vpuntajes);														//PREGUNTAR SI: SI O SI SE LLENAN LOS 8 CASILLEROS DEL VECTOR O TENGO QUE BUSCAR EL MAXIMO EN VEZ DE PONER V[8].CODIGO ES EL MAXIMO
	writeln('----------------------------------------------------------');
END.


