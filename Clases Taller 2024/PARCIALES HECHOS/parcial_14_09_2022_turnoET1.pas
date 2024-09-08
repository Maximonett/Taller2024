{La Facultad de Informática desea procesar la información de los finales 
rendidos por sus alumnos. De cada alumno se conoce el número de alumno 
(entre 1 y 7000), el código de materia (entre 300 y 356) y nota de 
finales (entre 0 y 10)-
a) Realizar un módulo que lea la información de los finales y retorne una estructura 
de datos agrupada por número de alumno con todas las notas de los finales 
rendidos por cada uno de los alumnos. La lectura finaliza con el número de alumno 0. 
Se sugiere utilizar el módulo leerRegistro ().
b) Realizar un módulo recursivo que reciba la estructura generada en el inciso a), 
y retorne una nueva estructura que contenga el promedio de cada alumno.
c)Realizar un módulo que reciba la estructura generada en inciso b) 
y retorne la misma estructura con la información ordenada por promedio.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program informatica;

const
	dimF=70;

type
	
	rango_alumnos=0..dimF; //finaliza con el numero de alumno 0
	rango_materia=300..356;
	rango_nota=0..10;
	
	vMaterias=array[rango_materia] of rango_nota; //se debe inicializar
	
	alumno=record
		num:rango_alumnos;
		materia:rango_materia;
		nota:rango_nota;
	end;
		
		
	arbolA=^nodoA;
	nodoA=record
		num:rango_alumnos;
		v:vMaterias;
		hi:arbolA;
		hd:arbolA;
	end;
	
	listaP=^nodo;
	nodo=record
		num:rango_alumnos;
		promedio:real;
		sig:listaP;
	end;
	
procedure leerAleatorio(var a:alumno);
begin
	a.num:=random(70);
	if (a.num <> 0) then begin
		a.materia:=random(56)+300;
		a.nota:=random(11);
	end;
end;


procedure inicializarVector(var v:vMaterias);
var
	i:integer;
begin
	for i:=300 to 356  do 
		v[i]:=0;
end;

procedure agregarArbolAlumnos(var aA:arbolA; var a:alumno);
var
	materia:rango_materia;
begin
	if (aA=nil) then begin
		new(aA);
		aA^.num:=a.num;
		inicializarVector(aA^.v); // NO OLVIDAR INICIALIZAR
		materia:=a.materia;
		aA^.v[materia]:=a.nota;
		aA^.hi:=nil;
		aA^.hd:=nil;
	end
	else begin
		if (a.num < aA^.num) then
			agregarArbolAlumnos(aA^.hi,a)
		else
			agregarArbolAlumnos(aA^.hd,a);
	end;
end;


procedure cargarArbolAlumnos(var aA:arbolA);
var
	a:alumno;
begin
	leerAleatorio(a);
	while (a.num<> 0 ) do begin
		agregarArbolAlumnos(aA,a);
		leerAleatorio(a);	
	end;
end;

procedure mostrarVectorNotas(v:vMaterias);
var
	i:integer;
begin	
	for i:=300 to 356 do begin
		if (v[i]<>0)then begin
			writeln('Materia Nº: ',i);
			writeln('Nota: ',v[i]);
		end;
	end;
end;

procedure mostrarArbol(aA:arbolA);
begin
	if (aA<> nil )then begin
		mostrarArbol(aA^.hi);
		writeln('Alumno Nº: ',aA^.num);
		mostrarVectorNotas(aA^.v);
		mostrarArbol(aA^.hd);
	end;
end;

{b) Realizar un módulo recursivo que reciba la estructura generada en el inciso a), 
y retorne una nueva estructura que contenga el promedio de cada alumno.}

function promedio(v:vMaterias):real;
var
	i:rango_materia; suma:integer; cant:integer;
begin
	suma:=0;
	cant:=0;
	for i:=300 to 356 do begin
		if (v[i]<> 0) then begin
			suma:=suma + v[i];
			cant:=cant +1;
		end;
	end;
	if (cant>0) then
		promedio:=suma/cant
	else 
		promedio:=0;
end;

procedure agregarAdelante(var L:listaP;num:rango_alumnos;prom:real);
var
	nue:listaP;
begin
	new(nue);
	nue^.num:=num;
	nue^.promedio:=prom;
	nue^.sig:=L;
	L:=nue;
end;

procedure ListaPromedios(aA:arbolA; var L:listaP);
var
	num:rango_alumnos;
	prom:real;
begin
	if (aA<> nil) then begin
		ListaPromedios(aA^.hi,L);
		prom:=promedio(aA^.v);
		num:=aA^.num;
		agregarAdelante(L,num,prom);
		ListaPromedios(aA^.hd,L);
	end;
end;

procedure mostrarLista(L:listaP);
begin
	if (L<>nil)then begin
		writeln('Nº de Alumno: ',L^.num,' Promedio: ',L^.promedio:0:2);
		mostrarLista(L^.sig);
	end;
end;

{c)Realizar un módulo que reciba la estructura generada en inciso b) 
y retorne la misma estructura con la información ordenada por promedio.}

procedure agregarOrdenado(var L2:listaP; num:rango_alumnos;prom:real);
var
	nue,act,ant:listaP;
begin
	new(nue);
	nue^.num:=num;
	nue^.promedio:=prom;
	act:=L2; ant:=L2;
	while (act<>nil) and (prom < act^.promedio) do begin
		ant:=act; act:=act^.sig;
	end;
	if (act=ant) then
		L2:=nue
	else 
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure ordenarPromedio(L:listaP; var L2:listaP);
begin
	while (L<>nil) do begin
		agregarOrdenado(L2,L^.num,L^.promedio);
		L:=L^.sig;
	end;
end;

var
	aA:arbolA; L:listaP; L2:listaP;
begin
	randomize();
	aA:=nil;
	cargarArbolAlumnos(aA);
	mostrarArbol(aA);
	L:=nil;
	ListaPromedios(aA,L);
	writeln('*************');
	writeln('Lista ordenada por Nº de alumno');
	writeln('*************');
	mostrarLista(L);
	L2:=nil;
	ordenarPromedio(L,L2);
	writeln('*************');
	writeln('Lista ordenada por promedio');
	writeln('*************');
	mostrarLista(L2);
end.






		
	
	
