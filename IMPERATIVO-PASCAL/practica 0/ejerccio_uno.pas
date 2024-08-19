program uno;

type

rango_materias= 1..36;
cadena= string[50];
vMaterias=array[rango_materias] of integer;

alumno=record
	ape:cadena;
	num:integer;
	ingreso:integer;
	cantAprobadas:integer;
	notaObtenida:vMaterias;
end;

listaAlu=^nodo;
nodo=record
	dato:alumno;
	sig:listaAlu;
end;

procedure inicializarVectorNotas(var V:vMaterias);
var
	i:integer;
begin
	for i:=1 to 36 do
		V[i]:=0;
end;

procedure lectura(var alu:alumno);
var
	i:integer;
begin
	writeln('Escriba el apellido del alumno: ');
	readln(alu.ape);
	writeln('Escribir año de Ingreso: ');
	readln(alu.ingreso);
	writeln('Esccribir cantidad de materias Aprobadads: ');
	readln(alu.cantAprobadas);
	writeln('Escribir la nota de cada materia aprobada: ');
		for i:=1 to alu.cantAprobadas do
			readln(alu.notaObtenida[i]);
	writeln('Escribir el numero de alumno: ');
	readln(alu.num);
end;

procedure agregarAdelante(var L:listaAlu; A:alumno);
var
	nue:listaAlu;
begin
	new(nue);
	nue^.dato:=A;
	nue^.sig:=L;
	L:=nue;
end;

procedure cargarAlumnos(var L:listaAlu);
var
	A:alumno;
begin
	repeat
		lectura(A);
		agregarAdelante(L,A);
	until(A.num = 11111);
end;

function calcularPromedios(notas:vMaterias; cantAprobadas:integer):real;
var
	i:integer;
	suma:real;
begin
	suma:=0;
	for i:=1 to cantAprobadas do
		suma:=suma + notas[i];
	calcularPromedios:=suma/cantAprobadas;
end;

procedure recorrerProcesar(L:listaAlu);
begin
	while (L <> nil)do begin
		writeln('Numero de Alumno: ',L^.dato.num);
		writeln('Promedio: ', calcularPromedios(L^.dato.notaObtenida,L^.dato.cantAprobadas):0:2);
		L:=L^.sig;
	end;
end;

var
	L:listaAlu;
begin
	L:=nil;
	cargarAlumnos(L);
	recorrerProcesar(L);	
end.
