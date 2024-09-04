{2.Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
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
modelo del auto con dicha patente}


program dos;

type
	
	rango_anio=2010..2018;
	
	auto=record
		anio:rango_anio;
		marca:string ;
		modelo:string;
	end;
	
	autoM=record
		patente:String;
		anio:rango_anio;
		modelo:String;
	end;
	
	arbolAM=^nodoAM;
	nodoAM=record
		marca:String;
		dato:autoM;
		hi:arbolAM;
		hd:arbolAM
	end;
	
	arbolA=^nodoA;
	nodoA=record
		patente:String;
		dato:auto;
		hi:arbolA;
		hd:arbolA;
	end;
	
var
	Vmodelo:array[1..5] of String=('A','B','C','D','E');
	Vmarca:array[1..5] of String=('FORD','RENAULT','FIAT','FORD','MMM');
	Vpatente:array[1..5] of String=('AI 897 OIA','BO 876 TRE','CA 987 TTT','DE 098 TY','EA 00 1998');
	
	
procedure leerAleatorio(var a:auto;var patente:string);
begin
	a.marca:=Vmarca[random(5)+1];
	if (a.marca <> 'MMM') then begin
		patente:=Vpatente[random(5)+1];
		a.modelo:=Vmodelo[random(5)+1];
		a.anio:=2010+ random(2018-2010+1);
	end;
end;


procedure agregarArbolPatente(var aP:arbolA;a:auto; patente:string);
begin
	if (aP=nil) then begin
		new(aP);
		aP^.patente:=patente;
		aP^.dato:=a;
		aP^.hi:=nil;
		aP^.hd:=nil;
	end
	else if (patente<aP^.patente) then
		agregarArbolPatente(aP^.hi,a,patente)
	else
		agregarArbolPatente(aP^.hd,a,patente);
end;
	
procedure agregarArbolMarca(var aM:arbolAM;a:autoM;marca:String);
begin
	if (aM=nil)then begin
		new(aM);
		aM^.marca:=marca;
		aM^.dato:=a;
		aM^.hi:=nil;
		aM^.hd:=nil;
	end
	else if (marca< aM^.marca) then
		agregarArbolMarca(aM^.hi,a,marca)
	else
		agregarArbolMarca(aM^.hd,a,marca);
end;


procedure cargarArboles(var aP:arbolA;var aM:arbolAM);
var
	a:auto;patente:string;auM:autoM;
begin
	leerAleatorio(a,patente);
	while (a.marca<> 'MMM') do begin
		agregarArbolMarca(aM,auM,a.marca);
		agregarArbolPatente(aP,a,patente);
		leerAleatorio(a,patente);
	end;
end;

{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.}

function cantidadAutosMarca(aP:arbolA; marca:string):integer;
begin
	if (aP=nil) then 
		cantidadAutosMarca:=0
	else if (aP^.dato.marca=marca) then
		cantidadAutosMarca:= 1 + cantidadAutosMarca(aP^.hi,marca) + cantidadAutosMarca(aP^.hd,marca)
	else 
		cantidadAutosMarca:= cantidadAutosMarca(aP^.hi,marca) + cantidadAutosMarca(aP^.hd,marca);
end;

{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}

function cantidadAutosMarcaII(aM:arbolAM;marca:string):integer;
begin
	if (aM=nil) then 
		cantidadAutosMarcaII:=0
	else if (aM^.marca=marca) then
		cantidadAutosMarcaII:=1 + cantidadAutosMarcaII(aM^.hi,marca)+ cantidadAutosMarcaII(aM^.hd,marca)
	else
		cantidadAutosMarcaII:= cantidadAutosMarcaII(aM^.hi,marca)+ cantidadAutosMarcaII(aM^.hd,marca);
end;


var
	aM:arbolAM; aP:arbolA;
	marca:string;
begin
	randomize();
	aM:=nil;
	aP:=nil;
	cargarArboles(aP,aM);
	writeln('Estructuras creadas!!!');
	writeln('Elija una marca para ver cuantos autos hay de la misma');
	readln(marca);
	writeln('La cantidad de autos de la Marca ',marca,' son ',cantidadAutosMarca(aP,marca));
	writeln('La cantidad de autos de la Marca ',marca,' son ',cantidadAutosMarcaII(aM,marca));
end.
	
	
	
	
	
	
	
	
	
