//ARMAR UN VECTOR DE LISTAS DE AUTOS ORDENADO POR 
//AÑO DE FABRICACION DE UN ARBOL 
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