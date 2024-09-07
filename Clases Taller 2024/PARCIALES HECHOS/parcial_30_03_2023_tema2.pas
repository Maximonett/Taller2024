{Se desea analizar la información de documentos impresos en un laboratorio durante 2022.
De cada documento impreso se conoce: código del usuario que imprimió, cantidad de páginas 
impresas, día y mes. Realice un programa que contenga e invoque a:
a. Un módulo que lea la información de documentos impresos y retorne una estructura 
con todos los registros leídos. La estructura debe ser eficiente para buscar por 
código de usuario. La lectura finaliza con código 0.
b. Un módulo que reciba la estructura generada en a) y dos valores X e Y, 
y retorne una lista con todos los documentos impresos cuyo código de 
usuario está entre X e Y.
c. Un módulo recursivo que reciba la lista generada en b) y retorne la suma 
total de páginas impresas de los documentos contenidos en la}

program tema2;

type

    rango_dia=1..31;
    rango_mes=1..12;

    documento=record
        codU:Integer;   //termina con codigo de usuario 0 y se ordena con el mismo criterio
        cantP:Integer;
        dia:rango_dia;
        mes:rango_mes;
    end;

    arbolD=^nodoD;
    nodoD=record
        dato:documento;
        hi:arbolD;
        hd:arbolD;
    end;
    
    listaD=^nodo;
    nodo=record
		dato:documento;
		sig:listaD;
	end;
    

procedure leerAleatorio(var d:documento);
begin
    d.codU:=random(100);
    if (d.codU<>0 ) then begin
        d.cantP:=random(10)+1;
        d.dia:=random(31)+1;
        d.mes:=random(12)+1;
    end;
end;

procedure agregarArbolDocumentos(var aD:arbolD;d:documento);
begin
	if (aD=nil) then begin
		new(aD);
		aD^.dato:=d;
		aD^.hi:=nil;
		aD^.hd:=nil;
	end
	else if (d.codU<aD^.dato.codU) then
		agregarArbolDocumentos(aD^.hi,d)
	else
		agregarArbolDocumentos(aD^.hd,d);
end;

procedure cargarArbolDocumentos(var aD:arbolD);
var
	d:documento;
begin
	leerAleatorio(d);
	while (d.codU<>0)do begin
		agregarArbolDocumentos(aD,d);
		leerAleatorio(d);
	end;
end;

procedure mostrarArbol(aD:arbolD);
begin
	if (aD<>nil) then begin
		mostrarArbol(aD^.hi);
		writeln('***************************');
		writeln('Codigo de Usuario: ',aD^.dato.codU,' Cantidad Paginas: ',aD^.dato.cantP,
				' fecha: ',aD^.dato.dia,'/',aD^.dato.mes,'/2022');
		writeln('***************************');
		mostrarArbol(aD^.hd);
	end;
end;

{b. Un módulo que reciba la estructura generada en a) y dos valores X e Y, 
y retorne una lista con todos los documentos impresos cuyo código de 
usuario está entre X e Y.}


procedure agregarAdelante(var L:listaD;d:documento);
var
	nue:listaD;
begin
	new(nue);
	nue^.dato:=d;
	nue^.sig:=L;
	L:=nue;
end;


procedure ListaDocumentos(aD:arbolD; var L:listaD; ini, fin: integer);
begin
	if (aD <> nil) then begin
		// Verificar si el código de usuario está entre el rango
		if (aD^.dato.codU >= ini) and (aD^.dato.codU <= fin) then
			agregarAdelante(L, aD^.dato);

		// Recorrer el subárbol izquierdo si ini es menor que el código actual
		if (ini < aD^.dato.codU) then
			ListaDocumentos(aD^.hi, L, ini, fin);
		// Recorrer el subárbol derecho si fin es mayor que el código actual
		if (fin > aD^.dato.codU) then
			ListaDocumentos(aD^.hd, L, ini, fin);
	end;
end;


procedure mostraListaDeDocumentos(L:listaD);
begin
	while (L<>nil) do begin
		writeln('***************************');
		writeln('Codigo de Usuario: ',L^.dato.codU,' Cantidad Paginas: ',L^.dato.cantP,
				' fecha: ',L^.dato.dia,'/',L^.dato.mes,'/2022');
		writeln('***************************');
		L:=L^.sig;
	end;
end;


function sumarPaginas(L: listaD): Integer;
begin
    if (L = nil) then
        sumarPaginas := 0
    else
        sumarPaginas := L^.dato.cantP + sumarPaginas(L^.sig);
end;



var
	aD:arbolD; ini,fin:integer; L:listaD;
begin
    randomize();
    ad:=nil;
	cargarArbolDocumentos(aD);
	mostrarArbol(aD);
	L:=nil;
	writeln('***************************');writeln('***************************');
	writeln('Elegir un gango inferior y superior de codigos de usuario para imprimir:');
	writeln('Rango inferior: ');readln(ini);
	writeln('Rango Superior: ');readln(fin);
	writeln('***************************');writeln('***************************');
	ListaDocumentos(aD,L,ini,fin);
	mostraListaDeDocumentos(L);
	writeln('***************************');writeln('***************************');
	writeln('La suma de todas las paginas de la lista es: ',sumarPaginas(L));
end.
