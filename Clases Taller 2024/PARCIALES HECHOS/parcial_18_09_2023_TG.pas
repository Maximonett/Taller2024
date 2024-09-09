{La biblioteca Sarmiento necesita un sistema para obtener estadísticas sobre 
los libros prestados. De cada préstamo se conoce: el número de préstamo, 
ISBN del libro y código de socio. La lectura finaliza con código de socio 0 y todos los
préstamos realizados a un mismo socio se leen consecutivamente.
a) Implementar un módulo que lea información de los prestamos y genere:
i) Uno estructura de datos eficiente para la búsqueda por ISBN del libro
ii) Una estructura donde se almacenen códigos de socios junto a su cantidad de préstamos.
b) Implementar un módulo que reciba la estructura generada en a) y un ISBN 
y retorne la cantidad de préstamos de ese ISBN.
c) Realizar un módulo recursivo que reciba la estructura generada 
en a) ii y un valor X y retorne la cantidad de
socios con cantidad de préstamos superior al valor X.}


program biblioteca;


type
	
	prestamo=record
		numP:integer;
		ISBN:integer;
	end;
	
	ListaPrestamos=^nodo;
	nodo=record
		dato:prestamo;
		sig:ListaPrestamos;
	end;
	
	arbolP=^nodoP;
	nodoP=record
		socio:integer;
		dato:ListaPrestamos;
		hi:arbolP;
		hd:arbolP;
	end;
	
	listaC=^nodoC;
	nodoC=record
		socio:integer;
		cant:integer;
		sig:listaC;
	end;
	
procedure leerAleatorio(var p:prestamo;var socio:integer);
begin
	socio:=random(101);
	if (socio<>0) then begin
		p.numP:=random(100)+1;
		p.ISBN:=random(100)+1000;
	end;
end;

procedure agregarAdelante(var L:ListaPrestamos;p:prestamo);
var
	nue:ListaPrestamos;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=L;
	L:=nue;
end;

procedure agregarArbolPrestamos(var aP:arbolP;p:prestamo; socio:integer);
begin
	if (aP=nil) then begin
		new(aP);
		aP^.socio:=socio;
		agregarAdelante(aP^.dato,p);
		aP^.hi:=nil;
		aP^.hd:=nil;
	end
	else begin
		if (socio <aP^.socio) then
			agregarArbolPrestamos(aP^.hi,p,socio)
		else if (socio > aP^.socio) then
			agregarArbolPrestamos(aP^.hd,p,socio)
		else
			agregarAdelante(aP^.dato,p);  //IMPOTANTISIMO SI EL SOCIO EXISTE AGREGA EL PRESTAMO A LA LISTA!!!!
	end;
end;

procedure cargarArbolPrestamos(var aP:arbolP);
var
	p:prestamo; socio:integer;
begin
	leerAleatorio(p,socio);
	while (socio <> 0) do begin
		agregarArbolPrestamos(aP,p,socio);
		leerAleatorio(p,socio);
	end;
end;

procedure mostrarLista(L:ListaPrestamos);
begin
	if (L<> nil) then begin
		writeln('Nº de prestamo: ',L^.dato.numP,' ISBN Nº: ',L^.dato.ISBN);
		mostrarLista(L^.sig);
	end;
end;


procedure mostrarArbol(aP:arbolP);
begin
	if (aP<>nil) then begin
		mostrarArbol(aP^.hi);
		writeln('Prestamos del socio ', aP^.socio);
		mostrarLista(aP^.dato);
		mostrarArbol(aP^.hd);
	end;
end;

{i) Una estructura de datos eficiente para la búsqueda por ISBN del libro}


{ii) Una estructura donde se almacenen códigos de socios junto a su cantidad de préstamos.}

procedure agregarAdelante(var L:listaC; socio:integer; cant:integer);
var
	nue:listaC;
begin
	new(nue);
	nue^.socio:=socio;
	nue^.cant:=cant;
	nue^.sig:=L;
	L:=nue;
end;



function recorrerYcontar(L:ListaPrestamos):integer;
var 
	cant:integer;
begin
	cant:=0;
	while (L<>nil) do begin
		cant:=cant+1;
		L:=L^.sig;
	end;
	recorrerYcontar:=cant;
end;

procedure cantidadPorSocio(aP:arbolP;var L:listaC);
var
	cant:integer; socio:integer;
begin
	if (aP<> nil) then begin
		cantidadPorSocio(aP^.hi,L);
		socio:=aP^.socio;
		cant:=recorrerYcontar(aP^.dato);
		agregarAdelante(L,socio,cant);
		cantidadPorSocio(aP^.hd,L);
	end;
end;

procedure mostrarListaCantidad(L:listaC);
begin
	while (L<>nil) do begin
		writeln('El socio ',L^.socio,' Cantidad de prestamos: ',L^.cant);
		L:=L^.sig;
	end;
end;

{b) Implementar un módulo que reciba la estructura generada en a) y un ISBN 
y retorne la cantidad de préstamos de ese ISBN.}

procedure cantidadPrestamos(aP:arbolP;ISBN:integer ;var cant:integer);
var 
	L:ListaPrestamos;
begin
	if (aP<>nil) then begin
		L:=aP^.dato;
		while ( L<>nil) do begin
			if (L^.dato.ISBN=ISBN) then 
				cant:=cant +1;
			L:=L^.sig;
		end;
		cantidadPrestamos(aP^.hi,ISBN,cant);
		cantidadPrestamos(aP^.hd,ISBN,cant);
	end;
end;

{c) Realizar un módulo recursivo que reciba la estructura generada 
en a) ii y un valor X y retorne la cantidad de
socios con cantidad de préstamos superior al valor X.}

procedure mayor(L:listaC;X:integer; var cant:integer);
begin
	if (L<>nil) then begin
		if (L^.cant>X) then
			cant:=cant+1;
		mayor(L^.sig,X,cant);
	end;
end;


var
	aP:arbolP; L:listaC; ISBN:integer; cant:integer;
	X:integer;
begin
	randomize();
	aP:=nil;
	cargarArbolPrestamos(aP);
	mostrarArbol(aP); 
	L:=nil;
	cantidadPorSocio(aP,L);
	mostrarListaCantidad(L);
	write('Elegir un ISBN y ver la cantidad de veces que fue prestado: ');
	readln(ISBN);
	cantidadPrestamos(aP,ISBN,cant);
	writeln('La cantidad de prestamos por el ISBN ',ISBN,' fue de ',cant);
	Writeln('Valor de X:'); readln(X);
	cant:=0;
	mayor(L,X,cant);
	writeln('La cantidad de socios con mas prestamos que el valor X=',X,' son ',cant);
	
end.
