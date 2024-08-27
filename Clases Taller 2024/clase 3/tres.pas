{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos
de la Facultad de Informática y los almacene en una estructura de datos. 
La información que se lee es legajo,código de materia, fecha y nota. La 
lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para 
cada alumno deben guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad 
de alumnos con legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, 
su legajo y su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. 
Este módulo debe retornar los legajos y promedios de los alumnos cuyo 
promedio supera el valor ingresado.}


program tres;

type
    rangoN = 0..10;

    final = record
        codigoM: integer;
        nota: rangoN;
        fecha: string;
    end;

    listaF = ^nodoF;
    nodoF = record
        dato: final;
        sig: listaF;
    end;

    alumno = record
        legajo: integer;
        finales: listaF;
    end;

    arbolA = ^nodoA;
    nodoA = record
        dato: alumno;
        hi: arbolA;
        hd: arbolA;
    end;

var
    vFechas: array[0..9] of string = ('1 de marzo', '3 de octubre', '10 de enero', '11 de agosto', '3 de noviembre', '2 de junio', '22 de febrero', '6 de julio', '7 de enero', '21 de diciembre');

procedure agregarAdelante(var L: listaF; unFinal: final);
var
    nue: listaF;
begin
    new(nue);
    nue^.dato := unFinal;
    nue^.sig := L;
    L := nue;
end;

procedure leerAleatorio(var al: alumno);
var
    unFinal: final;
begin
    al.legajo := random(100) * 100;
    al.finales := nil; //inicializo la lista de finales
    while (random(10) > 2) do begin //esto limita la cantidad de finales que puede tener el alumno 
        unFinal.codigoM := random(20) + 1;
        unFinal.fecha := vFechas[random(10)];
        unFinal.nota := random(11);
        agregarAdelante(al.finales, unFinal);
    end;
end;



procedure insertarAlumno(var a: arbolA; al: alumno);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := al;
        a^.hi := nil;
        a^.hd := nil;
    end
    else if (al.legajo < a^.dato.legajo) then
        insertarAlumno(a^.hi, al)
    else
        insertarAlumno(a^.hd, al);
end;

procedure cargarArbolAlumnos(var a: arbolA);
var
    al: alumno;
begin
    repeat
        leerAleatorio(al);
        if (al.legajo <> 0) then
            insertarAlumno(a, al);
    until al.legajo = 0;
end;

procedure mostrarListaFinales(L: listaF);
begin
    while (L <> nil) do begin
        writeln('  Código de materia: ', L^.dato.codigoM, ' - Fecha: ', L^.dato.fecha, ' - Nota: ', L^.dato.nota);
        L := L^.sig;
    end;
end;

procedure mostrarArbolAlumnos(a: arbolA);
begin
    if (a <> nil) then begin
        mostrarArbolAlumnos(a^.hi);
        writeln('Legajo del alumno: ', a^.dato.legajo);
        writeln('Finales rendidos:');
        mostrarListaFinales(a^.dato.finales);
        mostrarArbolAlumnos(a^.hd);
    end;
end;

var
    arbol: arbolA;

begin
    randomize;
    arbol := nil;
    cargarArbolAlumnos(arbol);
    writeln('--- Árbol de Alumnos ---');
    mostrarArbolAlumnos(arbol);
end.
