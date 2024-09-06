program parcial;

type
	
	rango_dia=integer;
	rango_horas=1..8;
	
	empleado=record
		num:integer;
		dia:rango_dia;
		mes:string;
		horas:rango_horas;
	end;
	
	arbolE=^nodoE;
	nodoE=record
		dato:empleado;
		hi:arbolE;
		hd:arbolE;
	end;
	
	listaE=^nodo;
	nodo=record
		dato:empleado;
		sig:listaE;
	end;
	
	
var 	
	vMeses:array[1..12] of string=('ene','feb','mar','abr','mayo','jun','jul','ago','sept','oct','nov','dic');
	
	
{a) relizar un modulo que lea la informacion de los empleados y 
retorne una estructura de datos. La estructura debe ser eficiente 
para la busqueda por NUEMRO DE EMPLEADO. Y TERMINA LA LECTURA CON DIA 0}

procedure leerAleatorio(var e:empleado);
begin
	e.dia:=random(32);
	if (e.dia<>0) then begin
		e.num:=random(100)+1;
		e.mes:=vMeses[random(12)+1];
		e.horas:=random(8)+1;
	end;
end;

procedure agregarEmpleadoArbol(var aE:arbolE; e:empleado);
begin
	if (aE=nil) then begin
		new(aE);
		aE^.dato:=e;
		aE^.hi:=nil;
		aE^.hd:=nil;
	end
	else begin
		if (e.num< aE^.dato.num) then
			agregarEmpleadoArbol(aE^.hi,e)
		else
			agregarEmpleadoArbol(aE^.hd,e);
	end;
end;


procedure cargarArbolEmpleados(var aE:arbolE);
var
	e:empleado;
begin
	leerAleatorio(e);
	while (e.dia<> 0) do begin
		agregarEmpleadoArbol(aE,e);
		leerAleatorio(e);
	end;
end;

procedure mostrarArbol(aE:arbolE);
begin
	if (aE<> nil) then begin
		mostrarArbol(aE^.hi);
		writeln('Nº de empleado: ', aE^.dato.num);
		writeln('Dia : ', aE^.dato.dia,' de ', aE^.dato.mes);
		writeln('Horas Trabajadas: ', aE^.dato.horas);
		mostrarArbol(aE^.hd);
	end;
end;

{Realizar un modulo que erciba la estructura generada y dos numeros de empleado
X e Y, y retorne los registros todas las horas trabajadas por los empleados}

procedure agregarAdelante(var L:listaE; e:empleado);
var
	nue:listaE;
begin
	new(nue);
	nue^.dato:=e;
	nue^.sig:=L;
	L:=nue;
end;


procedure cargarParcial(aE:arbolE;ini,fin:integer; var L:listaE);
begin
	if(aE<>nil) then begin
		if (aE^.dato.num>=ini) and (aE^.dato.num<=fin)then
			agregarAdelante(L,aE^.dato);
			
		if (ini<aE^.dato.num)then
			cargarParcial(aE^.hi,ini,fin,L);
			
		if (fin>aE^.dato.num) then
			cargarParcial(aE^.hd,ini,fin,L);
	end;		
end;


{Realizar un modulo recursivo que reciba la 
estructura generada en b y retorne la cantidad TOTAL de HORAS trabajadas }

function horasTotales(L:listaE):integer;
begin
	if (L=nil) then
		horasTotales:=0
	else
		horasTotales:= L^.dato.horas + horasTotales(L^.sig);	
end;

var
	aE:arbolE; L:listaE; ini,fin:integer;
begin
	randomize();
	aE:=nil;
	cargarArbolEmpleados(aE);
	mostrarArbol(aE);
	writeln('Escriba un rango de numero de empleados para calcular las horas trabajadas totales: ');
	writeln('Rango inferior: ');readln(ini);
	writeln('Rango Superior: ');readln(fin);
	L:=nil;
	cargarParcial(aE,ini,fin,L);
	writeln('La cantidad de horas Totales es: ',horasTotales(L));
end.
