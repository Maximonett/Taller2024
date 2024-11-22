{
   La Facultad de Informática desea procesar la información de los finales 
rendidos por sus alumnos. De cada alumno se conoce el número de alumno 
(entre 1 y 7000), el código de materia (entre 300 y 356) y nota de 
finales (entre 0 y 10)-
a) Realizar un módulo que lea la información de los finales y retorne una estructura 
de datos agrupada por número de alumno con todas las notas de los finales 
rendidos por cada uno de los alumnos. La lectura finaliza con el número de alumno 0. 
Se sugiere utilizar el módulo leerRegistro ().
b) Realizar un módulo recursivo que reciba la estructura generada en el inciso a), 
y retorne una nueva estructura que contenga el promedio de cada alumno.
c)Realizar un módulo que reciba la estructura generada en inciso b) 
y retorne la misma estructura con la información ordenada por promedio.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
   
   
}




program facultadDeInformatica;

type

	rango_nota=0..10;
	rango_nro=0..7000;
	rango_materia=300..356;
	
	vNotas=array[rango_materia] of rango_nota;
	
	alumno=record
		nro:rango_nro;
		materia:rango_materia;
		nota:rango_nota;
	end;
	
	
	arbolA=^nodoA;
	nodoA=record
		dato:alumno;
		notas:vNotas;
		hi:arbolA;
		hd:arbolA;
	end;
	
	arbolP=^nodoP;
	nodoP=record
		dato:alumno;
		notas:vNotas;
		promedio:real;
		hi:arbolP;
		hd:arbolP;
	end;
	
	
procedure leerAleatorioAlumno(var a:alumno);
begin
	a.nro:=random(10);
	if (a.nro<>0)then begin
		a.materia:=300+random(356-300+1);
		a.nota:=random(10)+1;
	end;
end;
	
	
procedure inicializarVectorNotas(var notas:vNotas);
var
	i:integer;
begin
	for i:=300 to 356 do 
		notas[i]:=0;
end;	

	
procedure agregarArbolAlumnos(var aA:arbolA; var a:alumno);
var
	materia:rango_materia;
begin
	if (aA=nil) then begin
		new(aA);
		aA^.dato.nro:=a.nro;
		inicializarVectorNotas(aA^.notas);
		materia:=a.materia;
		aA^.notas[materia]:=a.nota;
		aA^.hi:=nil;
		aA^.hd:=nil;
	end
	else begin
		if (a.nro<aA^.dato.nro) then 
			agregarArbolAlumnos(aA^.hi,a)
		else
			agregarArbolAlumnos(aA^.hd,a);	
	end;
end;

procedure cargarArbolAlumnos(var aA:arbolA);
var
	a:alumno;
begin
	leerAleatorioAlumno(a);
	while (a.nro<>0) do begin
		agregarArbolAlumnos(aA,a);
		leerAleatorioAlumno(a);
	end;
end;



procedure insertarNodo(var aP: arbolP; alumno: alumno; notas: vNotas; promedio: real);
begin
    if (aP = nil) then
    begin
        new(aP);
        aP^.dato := alumno;
        aP^.notas := notas;
        aP^.promedio := promedio;
        aP^.hi := nil;
        aP^.hd := nil;
    end
    else if (promedio < aP^.promedio) then
        insertarNodo(aP^.hi, alumno, notas, promedio)
    else
        insertarNodo(aP^.hd, alumno, notas, promedio);
end;

procedure nuevaEstructura(aA: arbolA; var aP: arbolP);
var
    suma, cant, i: integer;
    promedio: real;
begin
    if (aA <> nil) then
    begin
        // Calcular promedio del nodo actual
        suma := 0;
        cant := 0;
        for i := 300 to 356 do
        begin
            if (aA^.notas[i] <> 0) then
            begin
                suma := suma + aA^.notas[i];
                cant := cant + 1;
            end;
        end;
        if (cant > 0) then
            promedio := suma / cant
        else
            promedio := 0;

        // Insertar nodo actual en aP
        insertarNodo(aP, aA^.dato, aA^.notas, promedio);

        // Procesar subárbol izquierdo y derecho
        nuevaEstructura(aA^.hi, aP);
        nuevaEstructura(aA^.hd, aP);
    end;
end;


procedure mostrarArbolA (aA:arbolA);
var
	i:integer;
begin
	if (aA<>nil) then begin
		mostrarArbolA(aA^.hi);
		writeln('Numero de Alumno: ',aA^.dato.nro);
		for i:=300 to 356 do begin
			if (aA^.notas[i]<>0) then
				writeln('MATERIA: ',i,' la nota es: ',aA^.notas[i]);
		end;
		mostrarArbolA(aA^.hd);
	end;
end;
procedure mostrarArbolP(aP:arbolP);
var
	i:integer;
begin
	if (aP<>nil) then begin
		mostrarArbolP(aP^.hi);
		writeln('Numero de Alumno: ',aP^.dato.nro);
		for i:=300 to 356 do begin
			if ((aP^.notas[i])<>0) then 
				writeln('MATERIA: ',i,' la nota es: ',aP^.notas[i]);
		end;
		writeln('Promedio: ',(aP^.promedio):0:2);
		mostrarArbolP(aP^.hd);
	end;
end;

var
	aA:arbolA;aP:arbolP;
begin 
	randomize();
	aA:=nil;
	cargarArbolAlumnos(aA);
	aP:=nil;
	nuevaEstructura(aA,aP);
	writeln('--------------------');
	writeln('arbol sin promedio');
	writeln('--------------------');
	mostrarArbolA(aA);
	writeln('--------------------');
	writeln('arbol con promedio');
	writeln('--------------------');
	mostrarArbolP(aP);
end.
