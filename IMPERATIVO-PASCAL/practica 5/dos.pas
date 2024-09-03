{2.Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program dos;

type
	rango=2010..2018;
		
	auto=record
		patente:string;
		anio:rango;
		marca:string;
		modelo:string;
	end;
	
	arbolP=^nodoP;
	nodoP=record
		dato:auto;
		hi:arbolP;
		hd:arbolP;
	end;
	
	listaA=^nodo;
	nodo=record
		dato:auto;
		sig:listaA;
	end;
	
	arbolM=^nodoM;
	nodoM=record
		marca:string;
		ListaAutos:listaA;
		hi:arbolM;
		hd:arbolM;
	end;
	
	arbolF=^nodoF;
	nodoF=record
		anio:rango;
		ListaAutos:listaA;
		hi:arbolF;
		hd:arbolF;
	end;

vectorF=array[rango]of listaA;
	
var 
	vPatentes:array[0..4] of string=('AD YB 018','0','AT IU 000','ER GU 098','AD YR 900');
	
	vMarcas:array[0..4] of string=('VOLVO','RENAULT','CHEVROLET','FORD','FIAT');
	
	vModelo:array[0..4] of string=('Base','Conect','S','A','Z');
	
	
procedure leerAleatorio(var a:auto);
begin
	a.patente:=vPatentes[random(5)];
	if (a.patente <> '0')then begin
		a.anio:=2010 + random(2018-2010+1);
		a.marca:=vMarcas[random(5)];
		a.modelo:=vModelo[random(5)];
	end;
end;

procedure agregarAuto(var aP:arbolP;a:auto);
var
	aux:arbolP;
begin
	if (aP=nil)then begin
		new(aux);
		aux^.dato:=a;
		aux^.hi:=nil;
		aux^.hd:=nil;
		aP:=aux;
	end
	else 
		if (a.patente<aP^.dato.patente) then
			agregarAuto(aP^.hi,a)
		else
			agregarAuto(aP^.hd,a);
end;


procedure mostrarArbol(aP:arbolP);
begin
	if (aP <> nil) then begin
		mostrarArbol(aP^.hi);
		writeln('---------------');
		writeln('Patente: ',aP^.dato.patente);
		writeln('Año: ',aP^.dato.anio);
		writeln('Marca: ',aP^.dato.marca);
		writeln('Modelo: ',aP^.dato.modelo);
		mostrarArbol(aP^.hd);
	end;
end;

procedure agregarListaAdelante(var L:listaA; a:auto);
var
	nue:listaA;
begin
	new(nue);
	nue^.dato:=a;
	nue^.sig:=L;
	L:=nue;
end;

procedure agregarArbolMarcas(var aM:arbolM; a:auto);
begin
	if(aM=nil) then begin
		new(aM);
		aM^.marca:=a.marca;
		agregarListaAdelante(aM^.ListaAutos,a);
		aM^.hi:=nil;
		aM^.hd:=nil;
	end
	else
		if(a.marca < aM^.marca)then
			agregarArbolMarcas(aM^.hi,a)
		else 
			if (a.marca >aM^.marca) then
				agregarArbolMarcas(aM^.hd,a)
			else
				agregarListaAdelante(aM^.ListaAutos,a);
end;

procedure generarArboles(var aP:arbolP;var aM:arbolM);
var
  a: auto;
begin
  leerAleatorio(a);
  while (a.patente <> '0') do begin
	agregarAuto(aP,a);
    agregarArbolMarcas(aM, a);
    
    leerAleatorio(a);
  end;
end;

procedure mostraLista(L:listaA);
begin
	while (L<> nil) do begin
		writeln('---------------');
		writeln('Patente: ',L^.dato.patente);
		writeln('Año: ',L^.dato.anio);
		writeln('Marca: ',L^.dato.marca);
		writeln('Modelo: ',L^.dato.modelo);
		L:=L^.sig;
	end;
end;

procedure mostrarArbolMarca(aM:arbolM);
begin
	if (aM <> nil) then begin
		mostrarArbolMarca(aM^.hi);
		writeln('Los Autos Marca: ', aM^.marca);
		mostraLista(aM^.ListaAutos);
		mostrarArbolMarca(aM^.hd);
	end;
end;


{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.}

function cantidadMarca(aP:arbolP;marca:string):integer;
begin
	if (aP=nil) then
		cantidadMarca:=0
	else begin
		if (aP^.dato.marca=marca) then
			cantidadMarca:= 1+ cantidadMarca(aP^.hi,marca)
			+cantidadMarca(aP^.hd,marca)
		else
			cantidadMarca:= cantidadMarca(aP^.hi,marca)
			+cantidadMarca(aP^.hd,marca);
	end;
end;

{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}

function cantidadMarcaII(aM:arbolM;marca:string):integer;
var 
	L:listaA; aux:integer;
begin
	if (aM=nil) then
		cantidadMarcaII:=0
	else begin
		if (aM^.marca=marca) then begin
			aux:=0;
			L:=aM^.ListaAutos;
			while (L<> nil) do begin
				aux:=aux +1;
				L:=L^.sig;
			end;
			cantidadMarcaII:=aux;
		end
		else
			if (marca<aM^.marca) then
				cantidadMarcaII:=cantidadMarcaII(aM^.hi,marca)
			else
				cantidadMarcaII:=cantidadMarcaII(aM^.hd,marca);
	end;
end;

{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}

procedure agregarAutoPorAnio(var aF:arbolF; a:auto);
begin
  if (aF = nil) then begin
    new(aF);
    aF^.anio := a.anio;
    aF^.ListaAutos := nil;
    aF^.hi := nil;
    aF^.hd := nil;
    agregarListaAdelante(aF^.ListaAutos, a);
  end
  else begin
    if (a.anio < aF^.anio) then
      agregarAutoPorAnio(aF^.hi, a)
    else if (a.anio > aF^.anio) then
      agregarAutoPorAnio(aF^.hd, a)
    else
      agregarListaAdelante(aF^.ListaAutos, a);
  end;
end;


procedure anioDeFabricacion(aP: arbolP; var aF: arbolF);
procedure recorrerArbol(aP: arbolP);
begin
    if (aP <> nil) then begin
        recorrerArbol(aP^.hi);
        agregarAutoPorAnio(aF, aP^.dato);
        recorrerArbol(aP^.hd);
    end;
end;
begin
    aF := nil;
    recorrerArbol(aP);
end;

procedure mostrarArbolAnio(aF:arbolF);
begin
	if (aF <> nil) then begin
		mostrarArbolAnio(aF^.hi);
		writeln();
		writeln();
		writeln('Los Autos del año: ', aF^.anio);
		mostraLista(aF^.ListaAutos);
		mostrarArbolAnio(aF^.hd);
	end;
end;

{e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.}

function modelo(aP:arbolP; patente:string):String;
begin
	if (aP= nil) then
		modelo:='El Modelo con esa patente no se encuentra'
	else begin
		if (aP^.dato.patente=patente) then
			modelo:=aP^.dato.modelo
		else begin
			modelo:=modelo(aP^.hi,patente);
			if (modelo= 'El Modelo con esa patente no se encuentra') then
				modelo:=modelo(aP^.hd,patente);
		end;
	end;
end;

{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

function modeloII(aM: arbolM; patente: string): string;
var
    L: listaA;
    encontrado: boolean;
begin
    if aM = nil then
        modeloII := 'El modelo con esa patente no se encuentra'
    else
    begin
        L := aM^.ListaAutos;
        encontrado := false;
        
        // Buscar en la lista de autos del nodo actual
        while (L <> nil) and not encontrado do
        begin
            if L^.dato.patente = patente then
            begin
                modeloII := L^.dato.modelo;
                encontrado := true;
            end
            else
                L := L^.sig;
        end;
        
        // Si no encontramos el modelo en la lista actual, buscar en los subárboles
        if not encontrado then
        begin
            modeloII := modeloII(aM^.hi, patente);
            if modeloII = 'El modelo con esa patente no se encuentra' then
                modeloII := modeloII(aM^.hd, patente);
        end;
    end;
end;

{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}

procedure vectorDeListas(aP: arbolP; var v: vectorF);
begin
	if (aP <> nil) then begin
		// Agrega el auto en la lista correspondiente al año
		agregarListaAdelante(v[aP^.dato.anio], aP^.dato);

		// Recorrer subárbol izquierdo y derecho
		vectorDeListas(aP^.hi, v);
		vectorDeListas(aP^.hd, v);
	end;
end;

procedure mostrarVectorDeListas(v: vectorF);
var
	i: rango;
begin
	for i := 2010 to 2018 do begin
		writeln('Autos del año ', i, ':');
		if (v[i] <> nil) then
			mostraLista(v[i])
		else
			writeln('No hay autos para este año.');
		writeln('--------------------------');
	end;
end;



var
	aP:arbolP;
	aM:arbolM;
	marca:string;
	aF:arbolF;
	patente:string;
	v:vectorF;
begin
	randomize();
	aP:=nil;
	aM:=nil;
	aF:=nil;
	generarArboles(aP,aM);
	writeln('Arbol de Autos por Patente');
	mostrarArbol(aP);
	writeln();
	writeln();
	writeln('--------------------------');
	writeln('Arbol de Autos por Marcas');
	mostrarArbolMarca(aM);
	writeln('Elija una marca para ver la cantida de autos de la misma: ');
	readln(marca);
	writeln();
	writeln();
	writeln('La cantidad de Autos de la marca ',marca,' es de ',cantidadMarca(aP,marca), ' autos.');
	writeln('La cantidad de Autos de la marca ',marca,' es de ',cantidadMarcaII(aM,marca), ' autos.');
	anioDeFabricacion(aP,aF);
	writeln();
	writeln();
	writeln('--------------------------');
	writeln('Arbol de Autos por Año de Fabricacion');
	mostrarArbolAnio(aF);
	writeln();
	writeln();
	writeln('--------------------------');
	writeln('seleccion una patente para ver que modelos de auto es: '); readln(patente);
	writeln('El auto con patente ',patente,' es modelo ', modelo(aP,patente));
	writeln('El auto con patente ',patente,' es modelo ', modeloII(aM,patente));
	vectorDeListas(aP,v);
	mostrarVectorDeListas(v);
end.



