{
   Una empresa de alquiler de autos desea procesar la información de sus alquileres. 
Implementar un programa que:
a) Implementar un módulo que lea información de los alquileres y retorne una 
estructura de datos eficiente para la búsqueda por patente. 
Para cada patente deben quedar almacenados juntos todos sus alquileres .De cada 
alquiler se lee: dni del cliente, patente, mes y año. La lectura finaliza con la patente 0.
b) Implementar un módulo que reciba la estructura generada en a) y un dni D. Este 
módulo debe retornar la cantidad de alquileres realizados por el dni D.
c) Implementar un módulo que reciba la estructura generada en a), un año X y dos 
patentes A y B. Este módulo debe retornar la cantidad de alquileres realizados 
para las patentes entre A y B (incluidas) durante el año X.
   
}
program alquilerDeAutos;

type
	rango_mes=1..12;
	rango_anio=1990..2023;
	
	alquiler=record
		dni:integer;
		mes:rango_mes;
		anio:rango_anio;
	end;
	
	arbolA=^nodoA;
	nodoA=record
		patente:integer; //LA LECTURA FINALIZA EN PATENTE 0
		dato:alquiler;
		hi:arbolA;
		hd:arbolA;
	end;
procedure leerAleatorio(var a:alquiler; var patente:integer);
begin
	patente:=random(50);
	if (patente<>0) then begin
		a.dni:=random(50)+1;
		a.mes:=random(12)+1;
		a.anio:=1990+random(2023-1990+1);
	end;	
end;

procedure agregarArbolAlquiler(var aA:arbolA;a:alquiler;patente:integer);
begin
	if(aA=nil) then begin
		new(aA);
		aA^.patente:=patente;
		aA^.dato:=a;
		aA^.hi:=nil;
		aA^.hd:=nil;
	end
	else begin
		if (patente<aA^.patente)then 
			agregarArbolAlquiler(aA^.hi,a,patente)
		else
			agregarArbolAlquiler(aA^.hd,a,patente);
	end;
end;

procedure cargarArbolAlquileres(var aA:arbolA);
var
	a:alquiler;patente:integer;
begin
	leerAleatorio(a,patente);
	while (patente<>0)do begin
		agregarArbolAlquiler(aA,a,patente);
		leerAleatorio(a,patente);
	end;
end;

procedure mostrarArbol(aA:arbolA);
begin
	if (aA<>nil) then begin
		mostrarArbol(aA^.hi);
		writeln('Auto patente: ',aA^.patente);
		writeln('DNI: ',aA^.dato.dni,' periodo: ',aA^.dato.mes,'/',aA^.dato.anio);
		mostrarArbol(aA^.hd);
	end;
end;


{b) Implementar un módulo que reciba la estructura generada en a) y un dni D. Este 
módulo debe retornar la cantidad de alquileres realizados por el dni D.}

procedure alquileresDni(aA:arbolA; dni:integer; var cant:integer);
begin
	if(aA<>nil) then begin
		if (aA^.dato.dni=dni) then 
			cant:=cant+1;
		alquileresDni(aA^.hi,dni,cant);
		alquileresDni(aA^.hd,dni,cant);
	end;
end;
{c) Implementar un módulo que reciba la estructura generada en a), un año X y dos 
patentes A y B. Este módulo debe retornar la cantidad de alquileres realizados 
para las patentes entre A y B (incluidas) durante el año X.}

procedure moduloC(aA:arbolA; A,B,X:integer;var cant:integer);
begin
	if (aA<>nil) then begin
		if (aA^.patente>=A) and (aA^.patente<=B) then begin
			if (aA^.dato.anio=X)then 
				cant:=cant +1;
			moduloC(aA^.hi,A,B,X,cant);
			moduloC(aA^.hd,A,B,X,cant);
		end;
	end;
end;

var 
	aA:arbolA;dni:integer;cant,A,B,X:integer;
begin
	randomize();
	aA:=nil;
	cargarArbolAlquileres(aA);
	mostrarArbol(aA);
	writeln('Elija un Dni para ver la cantidad de alquileres que tuvo (1-50)'); 
	readln(dni);
	cant:=0;
	alquileresDni(aA,dni,cant);
	write();
	writeln('La cantidad de alquileres que tiene el dni: ',dni,' es: ',cant);
	cant:=0;
	writeln('Elija un rango inferior y uno superior de patente y por ultimo un año: ');
	readln(A);
	readln(B);
	read(X);
	moduloC(aA,A,B,X,cant);
	writeln('La cantidad de alquileres en ese rango y año fue de ',cant);
end.
	


