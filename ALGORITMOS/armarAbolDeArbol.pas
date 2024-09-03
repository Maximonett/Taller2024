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