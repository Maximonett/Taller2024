{3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program tres;

const 
    dimf = 40;

type
    rango_materia = 1..dimf;

    alumno = record
        legajo: integer;
        dni: integer;
        ingreso: integer;
        materias: array[rango_materia] of integer;
    end;

    arbolA = ^nodo;
    nodo = record
        dato: alumno;
        hi: arbolA;
        hd: arbolA;
    end;

procedure leerAlumnos(var a: alumno);
var
    codigo: integer;
begin
    WriteLn('Ingrese numero de legajo: '); ReadLn(a.legajo);
    if (a.legajo <> 0) then begin
        WriteLn('Ingrese numero de DNI: '); ReadLn(a.dni);
        WriteLn('Ingrese año de ingreso: '); ReadLn(a.ingreso);
        
        for codigo := 1 to dimf do
            a.materias[codigo] := -1;  // Inicializar todas las notas a -1

        repeat
            WriteLn('Ingrese codigo de Materia (1 a 40, -1 para finalizar): '); ReadLn(codigo);
            if (codigo <> -1) then begin
                WriteLn('Ingrese Nota de materia: '); ReadLn(a.materias[codigo]);
            end;
        until (codigo = -1);  // El bucle se detiene cuando se ingresa -1
    end;
end;

procedure insertar(var a: arbolA; al: alumno);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := al;
        a^.hi := nil;
        a^.hd := nil;
    end
    else if (al.legajo <= a^.dato.legajo) then
        insertar(a^.hi, al)
    else
        insertar(a^.hd, al);
end;

procedure cargarAlumnos(var a: arbolA);
var
    al: alumno;
begin
    leerAlumnos(al);
    if (al.legajo <> 0) then begin
        insertar(a, al);
        cargarAlumnos(a);
    end;
end;

procedure imprimirArbolEnOrden(a: arbolA);
var
    i: integer;
begin
    if (a <> nil) then begin
        imprimirArbolEnOrden(a^.hi);
        
        WriteLn('Numero de legajo: ', a^.dato.legajo);
        WriteLn('Numero de DNI: ', a^.dato.dni);
        WriteLn('Año de Ingreso: ', a^.dato.ingreso);
        
        for i := 1 to dimf do
            if a^.dato.materias[i] <> -1 then
                WriteLn('Codigo de Materia: ', i, ' Nota: ', a^.dato.materias[i]);
        
        imprimirArbolEnOrden(a^.hd);
    end;
end;

{b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.}

procedure dniEingreso(a:arbolA;valor:integer);
begin
    if (a<>nil) and (a^.dato.legajo<valor) then begin
        WriteLn('El DNI es:', a^.dato.dni);
        WriteLn('El año de ingreso es:', a^.dato.ingreso);
        dniEingreso(a^.hi,valor);
        dniEingreso(a^.hd,valor);
    end;
end;

{c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.}

function legajoMasGrande(a: arbolA): integer;
begin
    if (a = nil) then
        legajoMasGrande := -1
    else if (a^.hd = nil) then
        legajoMasGrande := a^.dato.legajo
    else
        legajoMasGrande := legajoMasGrande(a^.hd);
end;

{ d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande. }
function dniMasGrande(a: arbolA): integer;
var
    maxDNI: integer;
begin
    if (a = nil) then
        dniMasGrande := -1
    else begin
        maxDNI := a^.dato.dni;
        if (a^.hi <> nil) then
            if (dniMasGrande(a^.hi) > maxDNI) then
                maxDNI := dniMasGrande(a^.hi);
        if (a^.hd <> nil) then
            if (dniMasGrande(a^.hd) > maxDNI) then
                maxDNI := dniMasGrande(a^.hd);
        dniMasGrande := maxDNI;
    end;
end;

{ e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar. }
function contarLegajosImpares(a: arbolA): integer;
begin
    if (a = nil) then
        contarLegajosImpares := 0
    else begin
        if (a^.dato.legajo mod 2 <> 0) then
            contarLegajosImpares := 1 + contarLegajosImpares(a^.hi) + contarLegajosImpares(a^.hd)
        else
            contarLegajosImpares := contarLegajosImpares(a^.hi) + contarLegajosImpares(a^.hd);
    end;
end;

function contarLegajosPares(a:arbolA):integer;
begin
    if (a=nil) then 
        contarLegajosPares:=0
    else begin
        if (a^.dato.legajo mod 2 = 0)then
            contarLegajosPares:=1 +contarLegajosPares(a^.hi) + contarLegajosPares(a^.hd)
        else 
            contarLegajosPares:=contarLegajosPares(a^.hi) + contarLegajosPares(a^.hd);
    end;
end;

{ f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado. }
procedure legajosConPromedioMayor(a: arbolA; valor: real);
var
    sumaNotas, cantidadNotas, i: integer;
    promedio: real;
begin
    if (a <> nil) then begin
        sumaNotas := 0;
        cantidadNotas := 0;
        
        for i := 1 to dimf do begin
            if (a^.dato.materias[i] <> -1) then begin
                sumaNotas := sumaNotas + a^.dato.materias[i];
                cantidadNotas := cantidadNotas + 1;
            end;
        end;

        if (cantidadNotas > 0) then
            promedio := sumaNotas / cantidadNotas
        else
            promedio := 0;

        if (promedio > valor) then
            WriteLn('Legajo: ', a^.dato.legajo, ' Promedio: ', promedio:0:2);

        legajosConPromedioMayor(a^.hi, valor);
        legajosConPromedioMayor(a^.hd, valor);
    end;
end;



var
    a: arbolA;
    valor:integer;
    promedio:real;

begin
    a := nil;
    cargarAlumnos(a);
    
    WriteLn('----------');
    WriteLn('Alumnos: ');
    WriteLn('----------');
    imprimirArbolEnOrden(a);
    WriteLn('Ingresar un valor de legajo limite: ');Readln(valor);
    dniEingreso(a,valor);
    WriteLn('----------');
    WriteLn('El legajo mas grande es el numero: ', legajoMasGrande(a));
    WriteLn('----------');
    WriteLn('El dni mas grande es: ', dniMasGrande(a));
    WriteLn('----------');
    WriteLn('La cantidad de legajos impares es: ', contarLegajosImpares(a));
    WriteLn('----------');
    WriteLn('La cantidad de legajos Pares es: ', contarLegajosPares(a));
    WriteLn('----------');
    WriteLn('----------');
    WriteLn('Ingrese un promedio para ver los legajos con promedios mayores: ');ReadLn(promedio);
    WriteLn('Los Legajos con Promedio mayor a : ',promedio:0:2);
    legajosConPromedioMayor(a,promedio);
end.
