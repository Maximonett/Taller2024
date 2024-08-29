{3.Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados}

program tres;

const
	mMax = 30;  // Máximo de materias

type
	// Rangos de notas
	rangoA = 4..10;  // Notas aprobadas
	rangoNota = -1..10;  // Todas las notas

	// Registro de final rendido
	final = record
		codA: integer;  // Código de alumno
		codM: integer;  // Código de materia
		nota: rangoNota;  // Nota obtenida
	end;

	// Lista de finales aprobados de un alumno
	listaFinales = ^nodo;
	nodo = record
		codM: integer;  // Código de materia
		nota: rangoA;  // Nota obtenida
		sig: listaFinales;
	end;

	// Nodo del árbol de alumnos
	alumno = record
		codA: integer;  // Código de alumno
		materiasAprobadas: listaFinales;  // Lista de materias aprobadas
	end;

	arbolAlumnos = ^nodoA;
	nodoA = record
		dato: alumno;
		hi, hd: arbolAlumnos;
	end;

	// Registro de finales por materia
	finalPorMateria = record
		codA: integer;  // Código de alumno
		nota: rangoNota;  // Nota obtenida
	end;

	listaFinalesMateria = ^nodoM;
	nodoM = record
		dato: finalPorMateria;
		sig: listaFinalesMateria;
	end;

	// Vector de materias
	vMaterias = array[1..mMax] of listaFinalesMateria;


procedure inicializarMaterias(var v: vMaterias);
var
	i: integer;
begin
	for i := 1 to mMax do
		v[i] := nil;
end;

procedure agregarFinalAlumno(var L: listaFinales; codM: integer; nota: rangoA);
var
	nue: listaFinales;
begin
	new(nue);
	nue^.codM := codM;
	nue^.nota := nota;
	nue^.sig := L;
	L := nue;
end;

procedure agregarFinalMateria(var L: listaFinalesMateria; codA: integer; nota: rangoNota);
var
	nue: listaFinalesMateria;
begin
	new(nue);
	nue^.dato.codA := codA;
	nue^.dato.nota := nota;
	nue^.sig := L;
	L := nue;
end;

procedure insertarAlumno(var a: arbolAlumnos; codA, codM: integer; nota: rangoA);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codA := codA;
		a^.dato.materiasAprobadas := nil;
		agregarFinalAlumno(a^.dato.materiasAprobadas, codM, nota);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (codA < a^.dato.codA) then
		insertarAlumno(a^.hi, codA, codM, nota)
	else if (codA > a^.dato.codA) then
		insertarAlumno(a^.hd, codA, codM, nota)
	else
		agregarFinalAlumno(a^.dato.materiasAprobadas, codM, nota);
end;


procedure leerFinales(var a: arbolAlumnos; var materias: vMaterias);
var
	f: final;
begin
	repeat
		f.codA:=random(1000);
		f.codM:=random(mMax);
		f.nota:=(-1)+random(10-(-1)+1);
		 
		if (f.nota <> -1) then begin
			// Guardar en el árbol de alumnos (si es aprobada)
			if (f.nota >= 4) then
				insertarAlumno(a, f.codA, f.codM, f.nota);
			// Guardar en la lista de la materia
			agregarFinalMateria(materias[f.codM], f.codA, f.nota);
		end;

	until (f.nota = -1);
end;


{procedure leerFinales(var a: arbolAlumnos; var materias: vMaterias);
var
	f: final;
begin
	repeat
		writeln('Ingrese el código de alumno: ');
		readln(f.codA);
		writeln('Ingrese el código de materia: ');
		readln(f.codM);
		writeln('Ingrese la nota obtenida: ');
		readln(f.nota);
		 
		if (f.nota <> -1) then begin
			// Guardar en el árbol de alumnos (si es aprobada)
			if (f.nota >= 4) then
				insertarAlumno(a, f.codA, f.codM, f.nota);
			// Guardar en la lista de la materia
			agregarFinalMateria(materias[f.codM], f.codA, f.nota);
		end;

	until (f.nota = -1);
end;}

procedure procesarAlumnosMayores(a: arbolAlumnos; codMin: integer);
var
	cantidad: integer;
	total: integer;
	promedio: real;
	L:listaFinales;
begin
	if (a <> nil) then begin
		procesarAlumnosMayores(a^.hi, codMin);
		
		if (a^.dato.codA > codMin) then begin
			cantidad := 0;
			total := 0;
			// Recorre la lista de materias aprobadas para calcular el promedio
			L := a^.dato.materiasAprobadas;
			while (L <> nil) do begin
				cantidad := cantidad + 1;
				total := total + L^.nota;
				L := L^.sig;
			end;
			promedio := total / cantidad;
			writeln('Código de alumno: ', a^.dato.codA, ' - Promedio: ', promedio:0:2);
		end;

		procesarAlumnosMayores(a^.hd, codMin);
	end;
end;

function contarAlumnosPorCantidadFinales(a: arbolAlumnos; codMin, codMax, cantFinales: integer): integer;
var
	cantAprobadas: integer;
	L: listaFinales;
begin
	if (a = nil) then
		contarAlumnosPorCantidadFinales := 0
	else begin
		cantAprobadas := 0;
		if (a^.dato.codA >= codMin) and (a^.dato.codA <= codMax) then begin
			L := a^.dato.materiasAprobadas;
			while (L <> nil) do begin
				cantAprobadas := cantAprobadas + 1;
				L := L^.sig;
			end;
			if (cantAprobadas = cantFinales) then
				contarAlumnosPorCantidadFinales := 1 + contarAlumnosPorCantidadFinales(a^.hi, codMin, codMax, cantFinales)
			else
				contarAlumnosPorCantidadFinales := contarAlumnosPorCantidadFinales(a^.hi, codMin, codMax, cantFinales);
		end
		else
			contarAlumnosPorCantidadFinales := contarAlumnosPorCantidadFinales(a^.hi, codMin, codMax, cantFinales);
			
		contarAlumnosPorCantidadFinales := contarAlumnosPorCantidadFinales + contarAlumnosPorCantidadFinales(a^.hd, codMin, codMax, cantFinales);
	end;
end;

procedure mostrarListaFinales(L: listaFinales);
begin
	while (L <> nil) do begin
		writeln('   Materia: ', L^.codM, ' - Nota: ', L^.nota);
		L := L^.sig;
	end;
end;

procedure mostrarArbol(a: arbolAlumnos);
begin
	if (a <> nil) then begin
		// Primero se muestra el subárbol izquierdo
		mostrarArbol(a^.hi);
		
		// Luego se muestra el nodo actual
		writeln('Código de alumno: ', a^.dato.codA);
		writeln('Materias aprobadas: ');
		mostrarListaFinales(a^.dato.materiasAprobadas);
		
		// Finalmente se muestra el subárbol derecho
		mostrarArbol(a^.hd);
	end;
end;

procedure mostrarVectorMaterias(v: vMaterias);
var
	i: integer;
	L: listaFinalesMateria;
begin
	for i := 1 to mMax do begin
		writeln('Materia: ', i);
		L := v[i];
		while (L <> nil) do begin
			writeln('  Código de alumno: ', L^.dato.codA, ' - Nota: ', L^.dato.nota);
			L := L^.sig;
		end;
	end;
end;


var
	sup:integer;
	inf:integer;
	num:integer;
	arbol: arbolAlumnos;
	materias: vMaterias;
begin
	randomize();
	arbol := nil;
	inicializarMaterias(materias);
	leerFinales(arbol, materias);
	writeln('imprime el arbol');
	mostrarArbol(arbol);
	
	// Mostrar el vector de materias y sus finales
	writeln('Mostrar finales por cada materia:');
	mostrarVectorMaterias(materias);

	writeln('Procesando alumnos con códigos mayores a un valor dado...');
	procesarAlumnosMayores(arbol, 500);  // Ejemplo con un código mínimo de 500
	
	writeln('Elegir un campo inferior,uno superior y numero de finales:');
	readln(inf);
	readln(sup);
	readln(num);
	writeln('Cantidad de alumnos:', contarAlumnosPorCantidadFinales(arbol, inf, sup, num));  // Ejemplo con códigos entre 100 y 200, y 5 finales aprobados
end.


	
