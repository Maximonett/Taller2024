program parcial;

type


	banda=record
		nombre:string;
		estilo:string;
		cantInt:integer;
	end;

	
	arbolB=^nodoB;
	nodoB=record
		dato:banda;
		hi:arbolB;
		hd:arbolB;
	end;
	
	arbolE=^nodoE;
	nodoE=record
		dato:banda;
		hi:arbolE;
		hd:arbolE;
	end;
	
var 
	vNombres:array[1..5] of string=('Los espiritus','El mato','Los cadillacs','Luis Miguel','Beirut');
	vEstilos:array[1..5] of string=('INDI','POP','ROCK','SOLISTAS','TECNO');
	
{procedure leerAleatorio(var b:banda);
begin
	b.cantInt:=random(20);
	if (b.cantInt<>0) then begin
		b.nombre:=vNombres[random(5)+1];
		b.estilo:=vEstilos[random(5)+1];
	end;	
end;}

procedure leerAleatorio(var b:banda);
begin
	b.cantInt := random(20);
	// Asegurarse de que genere al menos un solista para probar
	if (random(5) = 0) then
		b.cantInt := 1;  // Forzar un solista aleatoriamente a veces

	if (b.cantInt<>0) then begin
		b.nombre := vNombres[random(5) + 1];
		b.estilo := vEstilos[random(5) + 1];
	end;
end;


procedure agregarBandaArbol(var a:arbolB;b:banda);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:=b;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if(b.nombre<a^.dato.nombre) then
			agregarBandaArbol(a^.hi,b)
		else
			agregarBandaArbol(a^.hd,b);
	end;
end;

procedure cargarArbolBanda(var a:arbolB);
var
	b: banda;
begin	
	leerAleatorio(b);
	while (b.cantInt<>0) do begin
		agregarBandaArbol(a,b);
		leerAleatorio(b);
	end;
end;


{Implementar un modulo que reciba el arbolB y 
devuelva una estructura, ordenanda por estilo , 
con todos los solistas (bandas con cantInt igual a uno)}


procedure agregarBandaArbolE(var aE:arbolE; b:banda);
begin
	if (aE=nil) then begin
		new(aE);
		aE^.dato:=b;
		aE^.hi:=nil;
		aE^.hd:=nil;
		writeln('Agregado al arbolE: ', b.nombre, ' con estilo: ', b.estilo);
	end
	else begin
		if(b.estilo< aE^.dato.estilo) then
			agregarBandaArbolE(aE^.hi,b)
		else
			agregarBandaArbolE(aE^.hd,b);
	end;
end;

procedure ArbolEstilo(a:arbolB;var aE:arbolE);
begin
	if (a <> nil) then begin
		if (a^.dato.cantInt=1) then
			agregarBandaArbolE(aE,a^.dato);
		ArbolEstilo(a^.hi,aE);
		ArbolEstilo(a^.hd,aE);
	end;	
end;

{Implementar un modulo recursivo que reciba el primer 
arbol y devuelva el nombre con mas integrantes.}

function maxIntegrantes(a:arbolB):arbolB;
begin
	if (a=nil) then
		maxIntegrantes:=nil
	else begin
		if	(a^.hd=nil) then
			maxIntegrantes:=a
		else
			maxIntegrantes:=maxIntegrantes(a^.hd);
	end;
end;

function nombreMasIntegrantes(aB:arbolB):string;
var
	arbolMax:arbolB;
begin
	arbolMax:=maxIntegrantes(aB);
	if (arbolMax<>nil) then
		nombreMasIntegrantes:=arbolMax^.dato.nombre
	else
		nombreMasIntegrantes:='No hay bandas';
end;

procedure imprimirArbol(a: arbolB);
begin
  if (a <> nil) then
  begin
    imprimirArbol(a^.hi);
    writeln('Banda: ', a^.dato.nombre, ' - Integrantes: ', a^.dato.cantInt);
    imprimirArbol(a^.hd);
  end;
end;

procedure imprimirArbolE(a: arbolE);
begin
  if (a <> nil) then
  begin
    imprimirArbolE(a^.hi);
    writeln('Estilo: ', a^.dato.estilo, ' - Banda: ', a^.dato.nombre);
    imprimirArbolE(a^.hd);
  end;
end;


var
	a:arbolB;
	aE:arbolE;
begin
	randomize();
	a:=nil;
	aE:=nil;
	cargarArbolBanda(a);
	ArbolEstilo(a,aE);
	writeln('Se han cargado los arboles...');
	writeln();
	writeln('La banda con el nombre con mas integrantes es ', nombreMasIntegrantes(a));
	imprimirArbol(a);
	writeln('-------------------');
	writeln('---------Arbol Estilos----------');
	writeln('-------------------');
	imprimirArbolE(aE);
end.
