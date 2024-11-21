{
   El Correo Argentino necesita procesar los envíos entregados durante el mes 
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
NOTA Implementar el programa principal, que invoque a los incisos a, b y+
   
   
}


program correoArgentino;

type 
	rango_dia=1..31;
	
	envio=record
		peso:real;
		codC:integer;
		dia:rango_dia;
	end;
	
	arbolE=^nodoE;
	nodoE=record
		codP:integer;
		dato:envio;
		hi:arbolE;
		hd:arbolE
	end;
		
var 
	vPesos:array[1..5]of real=(0.5,1.0,1.5,2.0,0.0);
	
procedure leerEnvioAleatorio(var e:envio; var codP:integer);
begin
	e.peso:=vPesos[random(5)+1];
	if(e.peso<>0)then begin
		codP:=random(2)+1;
		e.codC:=random(100)+100;
		e.dia:=random(31)+1;
	end;
end;

procedure agregarArbolEnvios(var aE:arbolE; e:envio;codP:integer);
begin
	if (aE=nil) then begin
		new(aE);
		aE^.codP:=codP;
		aE^.dato:=e;
		aE^.hi:=nil;
		aE^.hd:=nil;
	end
	else begin
		if (codP<aE^.codP) then 
			agregarArbolEnvios(aE^.hi,e,codP)
		else
			agregarArbolEnvios(aE^.hd,e,codP);
	
	end;
end;

procedure cargarArbolEnvios(var aE:arbolE);
var
	e:envio; codP:integer;
begin
	leerEnvioAleatorio(e,codP);
	while (e.peso<>0) do begin
		agregarArbolEnvios(aE,e,codP);
		leerEnvioAleatorio(e,codP);
	end;
end;

procedure mostrarArbol(aE:arbolE);
begin
	if (aE<>nil) then begin
		mostrarArbol(aE^.hi);
		writeln('Codigo Postal: ',aE^.codP);
		writeln('Codigo de Cliente: ',aE^.dato.codC);
		writeln('Dia: ',aE^.dato.dia);
		writeln('Peso: ',aE^.dato.peso:0:2,' Kg');
		mostrarArbol(aE^.hd);
	end;
end;

{b) implementar un módulo que reciba la estructura generada en a) y un código postal, 
y retorne todos los envios de dicho código postal.}

procedure EnviosXCodigoPostal(aE:arbolE; codP:integer);
begin
	if (aE<>nil) then begin
		EnviosXCodigoPostal(aE^.hi,codP);
		if (aE^.codP=codP) then begin
			writeln('Codigo Postal: ',aE^.codP);
			writeln('Codigo de Cliente: ',aE^.dato.codC);
			writeln('Dia: ',aE^.dato.dia);
			writeln('Peso: ',aE^.dato.peso:0:2,' Kg');	
		end;
		EnviosXCodigoPostal(aE^.hd,codP);
 	end;	
end;

{c) Realizar un módulo recursivo que reciba la estructura que retorna 
el inciso b) y retorne los dos códigos de cliente
corréspondientes al envio con mayor y menor peso.}

{ Filtrar los envíos por código postal y construir un árbol nuevo }
procedure FiltrarEnviosPorCodigoPostal(aE: arbolE; codP: integer; var filtrado: arbolE);
begin
    if (aE <> nil) then
    begin
        if (aE^.codP = codP) then
            agregarArbolEnvios(filtrado, aE^.dato, aE^.codP);
        FiltrarEnviosPorCodigoPostal(aE^.hi, codP, filtrado);
        FiltrarEnviosPorCodigoPostal(aE^.hd, codP, filtrado);
    end;
end;

{ Encontrar el cliente con mayor y menor peso de forma recursiva }
procedure clienteMayorYMenorPeso(aE: arbolE; var maxPeso: real; var minPeso: real; var mayorCliente: integer; var menorCliente: integer);
begin
    if (aE <> nil) then
    begin
        if (aE^.dato.peso > maxPeso) then
        begin
            maxPeso := aE^.dato.peso;
            mayorCliente := aE^.dato.codC;
        end;
        if (aE^.dato.peso < minPeso) then
        begin
            minPeso := aE^.dato.peso;
            menorCliente := aE^.dato.codC;
        end;
        clienteMayorYMenorPeso(aE^.hi, maxPeso, minPeso, mayorCliente, menorCliente);
        clienteMayorYMenorPeso(aE^.hd, maxPeso, minPeso, mayorCliente, menorCliente);
    end;
end;

{ Programa principal }
var
    aE, filtrado: arbolE;
    codP, mayorCliente, menorCliente: integer;
    minPeso, maxPeso: real;
begin
    randomize();
    aE := nil;
    filtrado := nil;

    cargarArbolEnvios(aE);
    mostrarArbol(aE);

    writeln('Escoja un código postal para ver sus envíos: ');
    readln(codP);

    FiltrarEnviosPorCodigoPostal(aE, codP, filtrado);

    if (filtrado <> nil) then
    begin
        writeln('Envíos para el código postal ', codP, ':');
        mostrarArbol(filtrado);

        maxPeso := -1;
        minPeso := 999;
        mayorCliente := -1;
        menorCliente := -1;

        clienteMayorYMenorPeso(filtrado, maxPeso, minPeso, mayorCliente, menorCliente);

        writeln('El cliente con mayor peso es: ', mayorCliente, ' (', maxPeso:0:2, ' Kg)');
        writeln('El cliente con menor peso es: ', menorCliente, ' (', minPeso:0:2, ' Kg)');
    end
    else
        writeln('No se encontraron envíos para el código postal ', codP, '.');
end.
