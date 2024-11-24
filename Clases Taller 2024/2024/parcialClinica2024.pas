program parcialClinica2024;

type
	
	rango_diagnostico='L'..'P';
	rango_mes=1..12;
	
	atencion=record
		matricula:integer;
		dni:integer;
		mes:rango_mes;
		codigoD:rango_diagnostico;
	end;
	
	arbolA=^nodoA;
	nodoA=record
		dni:integer;
		codigoD:rango_diagnostico;
		hi:arbolA;
		hd:arbolA;
	end;
	
	vectorA=array[rango_mes] of arbolA;

var 
	vCodD:array[1..5] of char=('L','M','N','O','P');

procedure leerAtencion(var a:atencion);
begin
	a.matricula:=random(50);
	if(a.matricula<>0) then begin
		a.dni:=random(100)+1;
		a.mes:=random(12)+1;
		a.codigoD:=vCodD[random(5)+1];
	end;
end;


procedure agregarArbolAtenciones(var aA:arbolA;a:atencion);
begin
	if(aA=nil) then begin
		new(aA);
		aA^.dni:=a.dni;
		aA^.codigoD:=a.codigoD;
		aA^.hi:=nil;
		aA^.hd:=nil;
	end
	else begin
		if (a.dni>aA^.dni) then 
			agregarArbolAtenciones(aA^.hi,a)
		else
			agregarArbolAtenciones(aA^.hd,a)
	end;
end;	

procedure cargarVectorAtenciones(var vA:vectorA);
var 
	a:atencion;
begin
	leerAtencion(a);
	while (a.matricula<>0) do begin
		agregarArbolAtenciones(vA[a.mes],a);
		leerAtencion(a);
	end;	
end;
procedure inicializarVector(var vA:vectorA);
var 
	i:integer;
begin
	for i:=1 to 12 do 
		vA[i]:=nil;
end;	

procedure mostrarArbol(aA:arbolA);
begin
	if (aA<>nil) then begin
		mostrarArbol(aA^.hi);
		writeln('Dni del paciente: ',aA^.dni,
				' Codigo de Diagnostico: ',aA^.codigoD);
		mostrarArbol(aA^.hi);
	end;
end;

procedure mostrarVectorArbol(vA:vectorA);
var 
	i:integer; act:arbolA;
begin
	for i:=1 to 12 do begin
		act:=vA[i];
		mostrarArbol(act);
	end;
end;

procedure contarAtenciones(aA:arbolA; var cant:integer);
begin
	if (aA<>nil) then begin
		cant:=cant+1;
		contarAtenciones(aA^.hi,cant);
		contarAtenciones(aA^.hd,cant);
	end;
end;

function elMayorMes(vA:vectorA):integer;
var
	i:integer;
	cant:integer; mayorMes:integer; mayorCant:integer;
	act:arbolA;
begin
	cant:=0;
	mayorMes:=-1;
	mayorCant:=-1;
	for i:=1 to 12 do begin
		act:=vA[i];
		contarAtenciones(act,cant);
		if (cant>mayorCant) then begin
			mayorCant:=cant;
			mayorMes:=i;
		end;
	end;
	elMayorMes:=mayorMes;
end;

function encontrarDni(aA:arbolA; dni:integer):boolean;
begin
    if (aA = nil) then
        encontrarDni := false
    else if (aA^.dni = dni) then
        encontrarDni := true
    else
        encontrarDni := encontrarDni(aA^.hi, dni) or encontrarDni(aA^.hd, dni);
end;


procedure fueAtendido(vA:vectorA; dni:integer);
var
    i: integer;
    encontro: boolean;
begin
    encontro := false;  // Inicializar como no encontrado
    i := 1;
    while (i <= 12) and not encontro do begin
        encontro := encontrarDni(vA[i], dni);  // Buscar en el árbol del mes actual
        i := i + 1;
    end;

    if (encontro) then
        writeln('El paciente fue atendido')
    else
        writeln('El paciente no ha sido encontrado');
end;

var
	vA:vectorA;dni:integer;
begin
	randomize();
	inicializarVector(vA);
	cargarVectorAtenciones(vA);
	mostrarVectorArbol(vA);
	writeln('El mes con mayor cantidad de atenciones fue el mes ',elMayorMes(vA));
	writeln('Escriba un Dni');readln(dni);
	fueAtendido(vA,dni);
end.
