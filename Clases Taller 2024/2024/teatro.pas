{
   1. Un teatro tiene funciones los 7 días de la semana. Para cada día se 
tiene una lista con las entradas vendidas. Se desea procesar la información 
de una semana. Se pide:
a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada 
se lee día (1..7), código de la obra, asiento, monto. 
La lectura finaliza con el código de obra igual a 0. Las listas deben estar 
ordenadas por código de obra de forma ascendente
b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
Esta lista debe estar ordenada por código de obra de forma ascendente
c. Realice un módulo recursivo que informe el contenido de la lista generada en b)
   
   
}

program teatro;

type
	
	rango_dia=1..7;
	
	entrada=record
		dia:rango_dia;
		codO:integer;  //la lectura finaliza con codO =0
		asiento:integer;
		monto:real;
	end;
	
	
	listaE=^nodoE;
	nodoE=record
		dato:entrada;
		sig:listaE;
	end;
	
	vListasE=array[rango_dia] of listaE;
	
	total=record
		codO:integer;
		cant:integer;
	end;
	
	listaT=^nodoT;
	nodoT=record
		dato:total;
		sig:listaT;
	end;

var 
	vMonto:array[1..5] of real=(1000.00,1500.00,2000.00,3000.00,5000.00);
	
procedure leerEntradas(var e:entrada);
begin
	e.codO:=random(10);
	if (e.codO<>0) then begin
		e.dia:=random(7)+1; 
		e.asiento:=random(100)+1;
		e.monto:=vMonto[random(5)+1];
	end;
end;

procedure agregarOrdenadoEntradas(var L:listaE;e:entrada);
var
	nue,act,ant:listaE;
begin
	new(nue);
	nue^.dato:=e;
	act:=L; ant:=L;
	while (act<>nil) and (e.codO< act^.dato.codO) do begin
		ant:=act; act:=act^.sig;
	end;
	if (act=ant) then 
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure inicializarVector(var vL:vListasE);
var
	i:integer;
begin
	for i:=1 to 7 do 
		vL[i]:=nil;
end;

procedure cargarListas(var vL:vListasE);
var 
	e:entrada;
begin
	leerEntradas(e);
	while(e.codO<>0) do begin 
		agregarOrdenadoEntradas(vL[e.dia],e);
		leerEntradas(e);
	end;
end;

procedure agregarTotal(var L:listaT;codO:integer;cant:integer);
var
	nue,act,ant:listaT;
begin
	new(nue);
	nue^.dato.codO:=codO;
	nue^.dato.cant:=cant;
	nue^.sig:=nil;
	act:=L; ant:=nil;
	while (act<>nil)and (codO>act^.dato.codO) do begin
		ant:=act; act:=act^.sig;
	end;
	if (ant=nil) then
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;	
end;

procedure generarListaTotal(vL:vListasE;var L:listaT);
var
	i:integer; act:listaE;
	codO,cant:integer;
begin
	L:=nil;
	for i:=1 to 7 do begin
		act:=vL[i];
		while (act<>nil) do begin
			codO:=act^.dato.codO;
			cant:=0;
			while (act <>nil) and (act^.dato.codO=codO) do begin
				cant:=cant +1;
				act:=act^.sig;
			end;
		agregarTotal(L,codO,cant);
		end;
	end;
end;	

procedure mostrarListaTotal(L:listaT);
begin
	if(L<>nil) then begin
		writeln('Codigo de obra: ',L^.dato.codO,'- Cantidad de Entradas: ',L^.dato.cant);
		mostrarListaTotal(L^.sig);
	end;
end;


{ --------------------------- Programa Principal --------------------------- }

var
    vL: vListasE;
    L: listaT;
begin
    randomize();
    
    // Inicializar estructuras
    inicializarVector(vL);
    
    // Generar las 7 listas con las entradas vendidas
    cargarListas(vL);
    
    // Generar la lista totalizada
    generarListaTotal(vL, L);
    
    // Mostrar la lista total
    writeln('Lista total de entradas por obra:');
    mostrarListaTotal(L);
end.
