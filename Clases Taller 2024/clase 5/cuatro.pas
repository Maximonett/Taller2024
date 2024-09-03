{4.Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido}

program cuatro;

type
	rangoTipo=1..5;
	
	reclamo=record
		cod:integer;
		dni:integer;
		anio:integer;
		tipo:rangoTipo;
	end;
	
	listaR=^nodoR;
	nodoR=record
		dato:reclamo;
		sig:listaR;
	end;
	
	arbolR=^nodoAR;
	nodoAR=record
		dni:integer;
		ListaReclamos:listaR;
		CantidadTotal:integer;
		hi:arbolR;
		hd:arbolR;
	end;
	
procedure agregarListaAdelante(var L:listaR; r:reclamo);
var
	nue:listaR;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=L;
	L:=nue;
end;

procedure leerAleatorio(var r:reclamo);
begin
	r.cod:=random(101);
	if (r.cod<> 0) then begin
		r.dni:=random(10)+1;
		r.anio:=1998 + random(2500-1998+1);
		r.tipo:=random(4)+1;
	end;
end;
		
procedure agregarArbolReclamos(var aR:arbolR; r:reclamo);
begin
	if (aR=nil) then begin
		new(aR);
		aR^.dni:=r.dni;
		aR^.ListaReclamos:=nil;
		agregarListaAdelante(aR^.ListaReclamos,r);
		aR^.CantidadTotal:= 1; //inicia con uno
		aR^.hi:=nil;
		aR^.hd:=nil;
	end
	else 
		if (r.dni < aR^.dni) then
			agregarArbolReclamos(aR^.hi,r)
		else 
			if(r.dni> aR^.dni) then
				agregarArbolReclamos(aR^.hd,r)
			else begin
				agregarListaAdelante(aR^.ListaReclamos,r); //agrega otro reclamo a la lista
				aR^.CantidadTotal:= aR^.CantidadTotal +1; //incrementa la cantidad
			end;
end;	


procedure cargarArbolReclamos(var aR:arbolR);
var
	r:reclamo;
begin
	leerAleatorio(r);
	while(r.cod <> 0)do begin
		agregarArbolReclamos(aR,r);
		leerAleatorio(r);
	end;
end;

procedure imprimirLista(L:listaR);
begin
	while(L<>nil) do begin
		writeln('Codigo de Reclamo: ',L^.dato.cod);
		writeln('DNI de la persona: ',L^.dato.dni);
		writeln('Año del Reclamo: ',L^.dato.anio);
		writeln('Tipo de Reclamo: ',L^.dato.tipo);
		L:=L^.sig;
	end;
end;

procedure  mostrarArbolReclamos(aR:arbolR);
begin
	if (aR<>nil) then begin
		mostrarArbolReclamos(aR^.hi);
		writeln();
		writeln();
		writeln('Reclamos del DNI: ',aR^.dni);
		writeln('Cantidad de Reclamos: ',aR^.cantidadTotal);
		imprimirLista(aR^.ListaReclamos);
		mostrarArbolReclamos(aR^.hd);
	end;
end;
{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.}

function cantidadReclamos(aR:arbolR; dni:integer):integer;
begin
	if(aR= nil) then
		cantidadReclamos:=0
	else if(aR^.dni = dni) then
			cantidadReclamos:=aR^.CantidadTotal 
	else if(dni<aR^.dni) then
			cantidadReclamos:=cantidadReclamos(aR^.hi,dni)
	else
		cantidadReclamos:=cantidadReclamos(aR^.hd,dni);
end;

{c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.}




var
	aR: arbolR;
	dni:integer;
Begin
	randomize();
	aR := nil; // Inicializa el árbol
	cargarArbolReclamos(aR);
	writeln('Mostrar Árbol de Reclamos');
	mostrarArbolReclamos(aR);
	writeln();
	writeln('Elija un DNI para ver las cantidad de Reclamos del mismo: ');
	readln(dni);
	writeln('La cantidad de reclamos del DNI ',dni,' fue ',cantidadReclamos(aR,dni));
end.

