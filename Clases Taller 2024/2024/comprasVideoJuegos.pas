{
   Implementar un módulo que lea compras de videojuegos. De cada compra 
se lee código del videojuego, código de cliente, día y mes. 
La lectura finaliza con el código de cliente 0. Se sugiere utilizar el 
módulo leerCompra(). Se deben retornar 2 estructuras de datos:
i. Una estructura eficiente para la búsqueda por código de cliente.
ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes.
b) Implementar un módulo que reciba la estructura generada en a) i, un código 
de cliente, retorne todas las compras que realizó dicho cliente.
c) Implementar un módulo que reciba la estructura generada en a) ii y 
retorne la misma estructura ordenada por cantidad de mayor a menor.
   
}


program comprasVideoJuegos;

type

	rango_dia=1..31;
	rango_mes=1..12;
	
	compra=record
		codV:integer;
		codC:integer; //finaliza con codC=0
		dia:rango_dia;
		mes:rango_mes;
	end;
	
	arbolC=^nodoC;
	nodoC=record
		dato:compra;
		hi:arbolC;
		hd:arbolC;
	end;
	
	vectorC=array[rango_mes] of integer;
	
procedure leerCompra(var c:compra);
begin
	c.codC:=random(100);
	if (c.codC<>0) then begin
		c.codV:=random(50)+1;
		c.dia:=random(31)+1;
		c.mes:=random(12)+1;
	end;	
end;

procedure agregarCompraArbol(var aC:arbolC; c:compra);
begin
	if( aC=nil) then begin
		new(aC);
		aC^.dato:=c;
		aC^.hi:=nil;
		ac^.hd:=nil;
	end
	else begin
		if(c.codC<aC^.dato.codC)then
			agregarCompraArbol(aC^.hi,c)
		else
			agregarCompraArbol(aC^.hd,c);
	end;
end;
procedure inicializarVector(var v:vectorC);
var
	i:integer;
begin
	for i:=1 to 12 do 
		v[i]:=0;
end;

procedure cargarArbolYVectorCompra(var aC:arbolC; var v:vectorC);
var
	c:compra;
begin
	leerCompra(c);
	while (c.codC<>0) do begin
		agregarCompraArbol(aC,c);
		v[c.mes]:=v[c.mes]+1;
		leerCompra(c);
	end;
end;

procedure mostrarArbol(aC:arbolC);
begin
	if (aC<>nil) then begin
		mostrarArbol(aC^.hi);
		writeln('Codigo de Cliente: ',aC^.dato.codC);
		writeln('Codigo de VideoJuego: ',aC^.dato.codV);
		writeln('Fecha ',aC^.dato.dia,'/',aC^.dato.mes);
		mostrarArbol(aC^.hd);
	end;
end;

procedure comprasXporCliente(var aC:arbolC; codC:integer);
begin
	if (aC<>nil) then begin
		if (aC^.dato.codC=codC)then begin
			writeln('Codigo de Cliente: ',aC^.dato.codC);
			writeln('Codigo de VideoJuego: ',aC^.dato.codV);
			writeln('Fecha ',aC^.dato.dia,'/',aC^.dato.mes);
		end;
			comprasXporCliente(aC^.hi,codC);
			comprasXporCliente(aC^.hd,codC);
	end;
end;

// Programa principal
var
    aC: arbolC;
    v: vectorC;
    i: integer;
    codC:integer;
begin
    randomize();
    aC := nil;
    inicializarVector(v);
    cargarArbolYVectorCompra(aC, v);
    
    mostrarArbol(aC);

    writeln('Cantidad de compras por mes:');
    for i := 1 to 12 do
        writeln('Mes ', i, ': ', v[i], ' compras.');
        
    writeln('--------------------------------------'); 
    
    writeln('codigo de cliente: ');read(codC); 
    comprasXporCliente(aC,codC);    
end.
