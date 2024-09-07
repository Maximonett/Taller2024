program temaDosTarde;

const
	dimF=15;
	
type
	
	rango_estilo=1..dimF;
	
	banda=record
		nom:string;
		cantI:integer;
	end;
	
	arbolB=^nodoB;
	nodoB=record
		dato:banda;
		hi:arbolB;
		hd:arbolB;
	end;
	
	vectorE=array[rango_estilo] of arbolB;
	
var
	vNombres:array[1..5] of string= ('The Police','The Cure','Salvation','Todos tus Muertos','El Mato');
	
procedure leerAleatorio(var b:banda;var estilo:rango_estilo);
begin
	b.cantI:=random(20);
	if (b.cantI<>0) then begin
		estilo:=random(15)+1;
		b.nom:=vNombres[random(5)+1];
	end;
end;

procedure agregarArbolBandas(var aB:arbolB;b:banda);
begin
	if(aB=nil) then begin
		new(aB);
		aB^.dato:=b;
		aB^.hi:=nil;
		aB^.hd:=nil;
	end
	else begin
		if (b.nom <aB^.dato.nom) then
			agregarArbolBandas(aB^.hi,b)
		else
			agregarArbolBandas(aB^.hd,b);
	end;	
end;


procedure inicializarVector(v:vectorE);
var
	i:integer;
begin
	for i:=1 to dimF do 
		v[i]:=nil;
end;

procedure cargarVectorEstilos(var v:vectorE);
var
	b:banda; aB:arbolB; estilo:rango_estilo;
begin
	//Inicializar el vector
	inicializarVector(v);
	 
	leerAleatorio(b,estilo);
	while (b.cantI<>0)do begin
		aB:=v[estilo];     //SUMAMENTE IMPORTANTE!!!!! OBTENER EL ARBOL CORRESPONDIENTE AL VECTOR
		agregarArbolBandas(aB,b);
		v[estilo]:=aB;
		leerAleatorio(b,estilo);
	end;
end;

procedure mostrarArbol(aB:arbolB);
begin
	if (aB<>nil) then begin
		mostrarArbol(aB^.hi);
		writeln('Banda: ',aB^.dato.nom,'- Cantidad de Integrantres: ',aB^.dato.cantI);
		mostrarArbol(aB^.hd);
	end;
end;

procedure mostrarVectorEstilos(v:vectorE);
var
	i:rango_estilo;
begin
	for i:=1 to dimF do begin
		writeln('Estilo ',i,' ***');
		mostrarArbol(v[i]);
	end;
end;


{Implementar un modulo que reciba la estructura en a) y 
devuelva una nueva estructura con todas las bandas inscriptas
ordenadas por nombre de Z a A}

{hago un nuevo metodo para agregar en arbol SOLO CAMBIO EL SENTIDO}

procedure agregarArbolBandasDecreciente(var aB:arbolB;b:banda);
begin
	if(aB=nil) then begin
		new(aB);
		aB^.dato:=b;
		aB^.hi:=nil;
		aB^.hd:=nil;
	end
	else begin
		if (b.nom > aB^.dato.nom) then
			agregarArbolBandasDecreciente(aB^.hi,b)
		else
			agregarArbolBandasDecreciente(aB^.hd,b);
	end;	
end;


// Itero en el vector cargando si el arbol no es nily lo agrego al nuevo arbol.

procedure cargarNuevoArbol(v:vectorE; var nA:arbolB);
var 
	i:integer;
begin
	for i:=1 to dimF do 
		if (v[i]<> nil) then
			agregarArbolBandasDecreciente(nA,v[i]^.dato);
end;

{implemnetar un modulo recursivo que reciba la nueva estructura y devuelva un nueva 
estrctura ordenada por nombre de banda pero solo los solistas}

procedure ArbolSolistas(aN:arbolB; var aSol:arbolB);
begin
	if (aN<>nil) then begin
		if(aN^.dato.cantI=1) then
			agregarArbolBandas(aSol,aN^.dato);
	
		ArbolSolistas(aN^.hi,aSol);
		ArbolSolistas(aN^.hd,aSol);
	end;
end;


var
	v:vectorE; nA:arbolB; aSol:arbolB;
begin
	randomize();
	cargarVectorEstilos(v);
	mostrarVectorEstilos(v);
	nA:=nil;
	writeln('*********************************');
	writeln('Arbol de bandas en orden de Z a A');
	writeln('*********************************');
	cargarNuevoArbol(v,nA);
	mostrarArbol(nA);
	aSol:=nil;
	ArbolSolistas(nA,aSol);
	writeln('*********************************');
	writeln('Arbol de Solistas');
	writeln('*********************************');
	mostrarArbol(aSol);
end.





	
