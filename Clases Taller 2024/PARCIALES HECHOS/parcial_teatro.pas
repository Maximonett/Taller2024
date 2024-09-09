{1. Un teatro tiene funciones los 7 días de la semana. Para cada día se 
tiene una lista con las entradas vendidas. Se desea procesar la información 
de una semana. Se pide:
a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada 
se lee día (1..7), código de la obra, asiento, monto. 
La lectura finaliza con el código de obra igual a 0. Las listas deben estar 
ordenadas por código de obra de forma ascendente
b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
Esta lista debe estar ordenada por código de obra de forma ascendente
c. Realice un módulo recursivo que informe el contenido de la lista generada en b)}

program teatro;

const
	dimF=7;
type
	rango_dia=1..7;
	
	entrada=record
		codigo:integer;
		asiento:integer;
		monto:real;
	end;
	
	listaE=^nodoE;
	nodoE=record
		dato:entrada;
		sig:listaE;
	end;
	
	vDias=array[rango_dia]of listaE;
	
	listaC=^nodoC;
	nodoC=record
		codigo:integer;
		cant:integer;
		sig:listaC;
	end;
	
	
var
	vMonto:array[1..5] of real=(50.00,90.00,150.00,200.00,300.00);

procedure leerAleatorio(var e:entrada; var dia:rango_dia);
begin
	e.codigo:=random(50);
	if (e.codigo<> 0) then begin
		dia:=random(7)+1;
		e.asiento:=random(100)+100;
		e.monto:=vMonto[random(5)+1];
	end;
end;

procedure agregarOrdenadoDia(var L: listaE; e: entrada);
var
  nue, ant, act: listaE;
begin
  new(nue);
  nue^.dato := e;
  ant := nil;
  act := L;
  
  // Insertar manteniendo la lista ordenada por código de obra
  while (act <> nil) and (act^.dato.codigo < e.codigo) do begin
    ant := act;
    act := act^.sig;
  end;
  
  nue^.sig := act;
  if (ant = nil) then
    L := nue
  else
    ant^.sig := nue;
end;


procedure inicializarVector(var v:vDias);
var
	i:integer;
begin
	for i:=1 to dimF do 
		v[i]:=nil;
end;

procedure cargarVectorEntradas(var v:vDias);
var
	e:entrada; dia:rango_dia;
begin
	inicializarVector(v);
	leerAleatorio(e,dia);
	while (e.codigo<>0) do begin
		agregarOrdenadoDia(v[dia],e);
		leerAleatorio(e,dia);
	end;
end;

procedure imprimirLista(L:listaE);
begin
	while (L<>nil)do begin
		writeln('Codigo de Obra: ',L^.dato.codigo,' Asiento: ',L^.dato.asiento,
				' Precio: ',L^.dato.monto:0:2);
		L:=L^.sig;
	end;
end;

procedure imprimirVector(v:vDias);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		writeln('Dia: ',i, ': ');
		imprimirLista(v[i]);
	end;
end;

{b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
Esta lista debe estar ordenada por código de obra de forma ascendente}

procedure agregarOrdenado(var L: listaC; codigo: integer; cantidad: integer);
var
  nue, ant, act: listaC;
begin
  new(nue);
  nue^.codigo := codigo;
  nue^.cant := cantidad;
  ant := nil;
  act := L;
  
  // Insertar manteniendo la lista ordenada por código de obra
  while (act <> nil) and (act^.codigo < codigo) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if (act <> nil) and (act^.codigo = codigo) then
    act^.cant := act^.cant + cantidad  // Sumar si ya existe
  else begin
    nue^.sig := act;  // Insertar nuevo nodo
    if (ant = nil) then
      L := nue
    else
      ant^.sig := nue;
  end;
end;

procedure recorrerYcontar(L:listaE;var LC:listaC);
var 
	actualcodigo:integer; cant:integer;
begin
	while (L<>nil) do begin
		actualcodigo:=L^.dato.codigo;
		cant:=0; 
		
		while (L<>nil) and (L^.dato.codigo=actualcodigo) do begin
			cant:=cant +1;
			L:=L^.sig;
		end;
		
		agregarOrdenado(LC,actualcodigo,cant);
	end;
end;

procedure generarListaPorObra(v: vDias; var LC: listaC);
var
  i: integer;
begin
  LC := nil;
  for i := 1 to dimF do
    recorrerYcontar(v[i], LC);
end;

{c. Realice un módulo recursivo que informe el contenido de la lista generada en b)}
procedure imprimirListaPorObra(L: listaC);
begin
  while (L <> nil) do begin
    writeln('Código de obra: ', L^.codigo, ' - Total de entradas: ', L^.cant);
    L := L^.sig;
  end;
end;

procedure imprimirListaRecursiva(L: listaC);
begin
  if (L <> nil) then begin
    writeln('Código de obra: ', L^.codigo, ' - Total de entradas: ', L^.cant);
    imprimirListaRecursiva(L^.sig);  // Llamada recursiva al siguiente nodo
  end;
end;


var
	v:vDias; LC:listaC;
begin
	cargarVectorEntradas(v);
	imprimirVector(v);
	generarListaPorObra(v,LC);
	imprimirListaRecursiva(LC);
end.
