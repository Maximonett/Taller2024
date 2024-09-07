{El Correo Argentino necesita procesar los envíos entregados durante el mes 
de Agosto de 2023. De cada ervio se conoce el código del cliente, dia, código 
postal y peso del paqueté.
a) implementar un módulo que lea envíos, genere y retorne una estructura 
adecuada para la búsqueda por código postal, donde para cada código 
postal se almacenen juntos todos los envíos (código de cliente, dia y peso del paquete).
La lectura finaliza con peso de paquete 0. Sè sugiere utilizar el módulo leerEnvio ().
b) implementar un módulo que reciba la estructura generada en a) y un código postal, 
y retorne todos los envios de dicho código postal.
c) Realizar un módulo recursivo que reciba la estructura que retorna 
el inciso b) y retorne los dos códigos de cliente
corréspondientes al envio con mayor y menor peso.
NOTA Implementar el programa principal, que invoque a los incisos a, b y}



program correo;

type
	
	rango_dia=1..31;
		
	envio=record
		codC:integer;
		dia:rango_dia;
		peso:real;
	end;
	
	arbolE=^nodoE;
	nodoE=record
		codP:integer;
		dato:envio;
		hi:arbolE;
		hd:arbolE;
	end;
	
var
	vPesos:array[1..5] of real= (0.5,1.0,1.5,2.0,0.0);
	
procedure leerAleatorio(var e:envio; var codP:integer);
begin
	e.peso:=vPesos[random(5)+1];
	if (e.peso<>0) then begin
		codP:=random(1000)+1000;
		e.dia:=random(31)+1;
		e.codC:=random(100)+100;
	end;
end;

procedure agregarArbolEnvios(var aE:arbolE; e:envio;codP:integer);
begin
	if(aE=nil) then begin
		new(aE);
		aE^.codP:=codP;
		aE^.dato:=e;
		aE^.hi:=nil;
		aE^.hd:=nil;
	end
	else begin
		if(codP<aE^.codP) then
			agregarArbolEnvios(aE^.hi,e,codP)
		else
			agregarArbolEnvios(aE^.hd,e,codP);
	end;
end;

procedure cargarArbolEnvios(var aE:arbolE);
var
	e:envio; codP:integer;
begin
	leerAleatorio(e,codP);
	while (e.peso<>0) do begin
		agregarArbolEnvios(aE,e,codP);
		leerAleatorio(e,codP);
	end;
end;

procedure mostrarArbol(aE:arbolE);
begin
	if(aE<>nil) then begin
		mostrarArbol(aE^.hi);
		writeln('Codigo Postal: ',aE^.codP);
		writeln('Codigo de Cliente ',aE^.dato.codC,' Fecha: '
				,aE^.dato.dia,'/8/2023 Peso: ',aE^.dato.peso:0:2,' Kg.');
		mostrarArbol(aE^.hd);
	end;
end;

{b) implementar un módulo que reciba la estructura generada en a) y un código postal, 
y retorne todos los envios de dicho código postal.}

procedure Envios(aE:arbolE; codP:integer);
begin
	if (aE<> nil) then begin
		if (aE^.codP=codP) then begin
			writeln('Codigo Postal: ',aE^.codP);
			writeln('Codigo de Cliente ',aE^.dato.codC,' Fecha: '
				,aE^.dato.dia,'/8/2023 Peso: ',aE^.dato.peso:0:2,' Kg.');
		end;
		Envios(aE^.hi,codP);
		Envios(aE^.hd,codP);		
	end;
end;


{c) Realizar un módulo recursivo que reciba la estructura que retorna 
el inciso b) y retorne los dos códigos de cliente
corréspondientes al envio con mayor y menor peso.}

procedure ClienteMayorMenorPeso(aE:arbolE; var maxPeso, minPeso: real; var maxCliente, minCliente: integer);
begin
	if (aE <> nil) then begin
		// Actualizar el cliente con mayor peso
		if (aE^.dato.peso > maxPeso) then begin
			maxPeso := aE^.dato.peso;
			maxCliente := aE^.dato.codC;
		end;
		// Actualizar el cliente con menor peso
		if (aE^.dato.peso < minPeso) then begin
			minPeso := aE^.dato.peso;
			minCliente := aE^.dato.codC;
		end;
		// Recursión en los hijos izquierdo y derecho
		ClienteMayorMenorPeso(aE^.hi, maxPeso, minPeso, maxCliente, minCliente);
		ClienteMayorMenorPeso(aE^.hd, maxPeso, minPeso, maxCliente, minCliente);
	end;
end;


var
	aE:arbolE; codP:integer;
	maxPeso, minPeso: real;
	maxCliente, minCliente: integer;
begin
	randomize();
	aE:=nil;
	cargarArbolEnvios(aE);
	mostrarArbol(aE);
	writeln('Escriba un codigo Postal para ver los envios del mismo: ');
	readln(codP);
	Envios(aE,codP);
	
	maxPeso := -1;
	minPeso := 9999;  // Un valor arbitrariamente alto para iniciar
	maxCliente := -1;
	minCliente := -1;
	ClienteMayorMenorPeso(aE, maxPeso, minPeso, maxCliente, minCliente);
	writeln('Cliente con mayor peso: ', maxCliente, ' con peso de ', maxPeso:0:2, ' Kg');
	writeln('Cliente con menor peso: ', minCliente, ' con peso de ', minPeso:0:2, ' Kg');
	
end.
