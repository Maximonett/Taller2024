{Una empresa desea procesar la información de las horas trabajadas por sus empleados durante 2021. 
Para ello, la empresa posee registros de las horas trabajadas por cada empleado. 
Cada registro consta del número de empleado, día, mes y la cantidad de horas trabajadas 
(a lo sumo 8) para dicho día y mes.
a) Realizar un módulo que lea la información de los empleados y 
retorne estructura de datos con todos los registros leídos. 
La estructura debe ser eficiente para la búsqueda por número de empleado. 
La lectura finaliza al ingresar un registro con día O. Se sugiere utilizar el módulo leerRegistro ().
b) Realizar un módulo que reciba la estructura generada en a) y dos números de empleados X e Y, 
y retorne todos los registros de horas trabajadas por empleados cuyos números estén entre X e Y (incluidos)
c) Realizar un módulo recursivo que reciba la estructura generada en b) y 
retorne la cantidad total de horas trabajadas.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
 }

program parcial_2022;

type
	dias=1..31; meses=1..12;
	rangoHoras=1..8;
	
	registro= record
		numero:integer;
		dia:dias;
		mes:meses;
		hora:rangoHoras;
	end;
	
	arbol=^nodo;
	
	nodo=record
		dato:registro;
		hi:arbol;
		hd:arbol;
	end;

	lista=^nodo1;
	nodo1= record
		dato:registro;
		sig:lista;
	end;

{--------modulo A ---------}

procedure leerRegistro(var r:registro);
begin
	r.numero:=Random(101);
	if (r.numero <> 0)then begin
		r.dia := 1 + Random(30);
		r.mes :=1 + Random(12);
		r.hora := 1 + Random(8);
		r.numero := Random(101);
	end;
end;

procedure agregarArbol(var a:arbol; r:registro);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=r;
		a^.hi:= nil;
		a^.hd:=nil
	end
	else 
		if(r.numero <= a^.dato.numero)then
			agregarArbol(a^.hi,r)
		else
			agregarArbol(a^.hd,r);
end;

procedure cargarArbol(var a:arbol);
var
	r:registro;
begin
	leerRegistro(r);
	while (r.numero <> 0) do begin
		agregarArbol(a,r);
		leerRegistro(r);
	end;
end;

{--------modulo B ---------
b) Realizar un módulo que reciba la estructura generada en a) y dos números de empleados X e Y, 
y retorne todos los registros de horas trabajadas por empleados cuyos números estén entre X e Y (incluidos)}


procedure agregar_adelante(var l:lista ;r:registro);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=l;
	l:=nue;
end;

procedure buscar_entre(a: arbol; x, y: integer; var l:lista);

begin
	if (a <> nil) then begin
		if (x <= a^.dato.numero) and (y >= a^.dato.numero) then
			agregar_adelante(l, a^.dato);
			
		buscar_entre(a^.hi, x ,y, l);
		buscar_entre(a^.hd, x, y, l);
	end;
	
end;



{function horasTrabajadas(a:arbol; x:integer; y:integer):integer;
begin
	if (a=nil)then 
		horasTrabajadas:=0
	else 
		if(a^.dato.numero >= x) and (a^.dato.numero<= y)then 
			horasTrabajadas:=a^.dato.hora + horasTrabajadas(a^.hi, x,y)+ horasTrabajadas(a^.hd,x,y)
		else 
			if (a^.dato.numero < x)then 
				horasTrabajadas:=horasTrabajadas(a^.hd,x,y)
			else 
				if (a^.dato.numero > y) then
					horasTrabajadas:=horasTrabajadas(a^.hi,x,y);
end;}


{--------Modulo C ---------
c) Realizar un módulo recursivo que reciba la estructura generada en b) y 
retorne la cantidad total de horas trabajadas.}



function sumar_horas(l:lista):integer;
begin
	if l = nil then
		sumar_horas:=0
	else
		sumar_horas:=sumar_horas(l^.sig) + l^.dato.hora;
end;


{--------P.P---------}
	
var
    a:arbol; x,y:integer; l:lista;
begin
	cargarArbol(a);
	writeln('Escriba un numero de empleadoentre el 1 y el 101: ');readln(x);
	writeln('Escriba un numero de empleado mayor al anterior: ');readln(y);
	buscar_entre(a,x,y,l);
	writeln('Las horas trabajadas por los empleados entre el numero ',x, 'y el numero',y,' son: ',sumar_horas(l));
	
	//writeln('Las horas trabajadas por los empleados entre el numero ',x, 'y el numero',y,' son: ',horasTrabajadas(a,x,y));
	
End.

