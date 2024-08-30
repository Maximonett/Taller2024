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
	
	rangoF=2010..2018;
		
	auto=record
		patente:string;
		año:rangoF;
		marca:string;
		modelo:string;
	end;
	
	arbolP=^nodoP;
	nodoP:record
		dato:auto;
		hi:arbolP;
		hd:arbolP;
	en;
	
	
	
var 
	vPatentes:array[0.5] of string=('AD YB 018','0','AT IU 000','ER GU 098','AD YR 900');
	
	vMarcas:array[0.5] of string=('VOLVO','RENAULT','CHEVROLET','FORD','FIAT');
	
	vMarcas:array[0.5] of string=('Base','Conect','S','A','Z');
	
	
procedure leerAleatorio(var a:auto);
begin
	a.patente:=vPatentes[random(5)];
	if (a.patente<> '0')then begin
		a.año:=2018 + random(2018-2010+1);
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
		aux.hi:=nil;
		aux^.hd:=nil;
		aP:=aux;
	end
	else 
		if (a.patente<aP^.dato.patente) then
			agregarAuto(aP^.hi,a)
		else
			agregarAuto(aP^.hd,a);
end;

procedure generarArbol(var aP:arbolP);
var
	a:auto;
begin
	leerAleatorio(a);
	while (aP.patente<>'0') do begin
		agregarAuto(aP,a);
		leerAleatorio(a);
	end;
end;

procedure mostraArbol(a:arbolP);
begin
	writeln('Arbol de Autos')
	if (aP<>nil) then begin
		mostraArbol(aP^.hi);
		writeln('---------------')
		writeln('Patente: ',aP^.dato.patente);
		writeln('Año: ',aP^.dato.año);
		writeln('Marca: ',aP^.dato.marca);
		writeln('Modelo: ',aP^.dato.modelo);
		mostraArbol(aP^.hd);
	end;
end;




