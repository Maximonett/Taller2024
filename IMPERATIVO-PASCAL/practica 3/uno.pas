{1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :}

program uno;

type

    socio=record
        nro:integer;
        nombre:string;
        edad:integer;
    end;
    
    arbol=^nodo;
    nodo=record
        dato:socio;
        hi:arbol;
        hd:arbol;
    end;

procedure leerSocios(var s:socio);
begin
    WriteLn('Escribir el numero de socio: '); readln(s.nro);
    if (s.nro<>0)then
    begin
        WriteLn('Escribir el nombre del socio: '); readln(s.nombre);
        WriteLn('Escribir la edad del socio: '); readln(s.edad);
    end;
end;

procedure agregarSocio(var a:arbol; s:socio);
begin
    if (a=nil) then begin
        New(a);
        a^.dato:=s;
        a^.hi:=nil;
        a^.hd:=nil;
    end 
    else 
        if (s.nro<=a^.dato.nro) then
            agregarSocio(a^.hi,s)
        else 
            agregarSocio(a^.hd,s);
end;

procedure cargarSocios(var a:arbol);
var
    s:socio;
begin
    leerSocios(s);
    while (s.nro<>0) do begin
        agregarSocio(a,s);
        leerSocios(s);
    end;
end;

procedure imprimirArbolPreorden(a: arbol);
begin
    if (a <> nil) then
    begin
        WriteLn('Número de socio: ', a^.dato.nro);
        WriteLn('Nombre del socio: ', a^.dato.nombre);
        WriteLn('Edad del socio: ', a^.dato.edad);
        imprimirArbolPreorden(a^.hi);
        imprimirArbolPreorden(a^.hd);
    end;
end;
procedure imprimirArbolInorden(a: arbol);
begin
    if (a <> nil) then
    begin
        imprimirArbolInorden(a^.hi);
        WriteLn('Número de socio: ', a^.dato.nro);
        WriteLn('Nombre del socio: ', a^.dato.nombre);
        WriteLn('Edad del socio: ', a^.dato.edad);
        imprimirArbolInorden(a^.hd);
    end;
end;

procedure imprimirArbolPostorden(a: arbol);
begin
    if (a <> nil) then
    begin
        imprimirArbolPostorden(a^.hi);
        imprimirArbolPostorden(a^.hd);
        WriteLn('Número de socio: ', a^.dato.nro);
        WriteLn('Nombre del socio: ', a^.dato.nombre);
        WriteLn('Edad del socio: ', a^.dato.edad);
    end;
end;
{i. Informe el número de socio más grande. 
Debe invocar a un módulo recursivo que
retorne dicho valor.}
function maximoSocio(a: arbol): integer;
begin
    if (a = nil) then
        maximoSocio := -1  { Indicador de árbol vacío }
    else if (a^.hd = nil) then
        maximoSocio := a^.dato.nro
    else
        maximoSocio := maximoSocio(a^.hd);
end;
{ii. Informe los datos del socio con el número de socio más chico. 
Debe invocar a un módulo recursivo que retorne dicho socio.}
function minimoSocio(a:arbol):socio;
begin
    if (a=nil) then
        WriteLn('Arbol Vacio.')
    else if (a^.hi=nil) then
        minimoSocio:=a^.dato
    else 
        minimoSocio:=minimoSocio(a^.hi);
end;
{iii. Informe el número de socio con mayor edad. Debe invocar a un 
módulo recursivo que retorne dicho valor.}

function socioConMayorEdad(a: arbol): integer;
var
    socioDerecha: integer;
begin
    if (a = nil) then
        socioConMayorEdad := -1  { Indicador de árbol vacío }
    else
    begin
        { Recursión para encontrar el socio con la edad máxima en el subárbol derecho }
        if (a^.hd = nil) then
            socioDerecha := a^.dato.nro
        else
            socioDerecha := socioConMayorEdad(a^.hd);
        
        { Comparación manual para determinar el socio con la mayor edad }
        if (a^.hd <> nil) and (a^.dato.edad < a^.hd^.dato.edad) then
            socioConMayorEdad := socioDerecha
        else
            socioConMayorEdad := a^.dato.nro;
    end;
end;

function menorEdad(a: arbol): integer;
var
    edadIzquierda: integer;
begin
    if (a = nil) then
        menorEdad := -1  { Indicador de árbol vacío }
    else
    begin
        { Recursión para encontrar la edad mínima en el subárbol izquierdo }
        if (a^.hi = nil) then
            edadIzquierda := a^.dato.edad
        else
            edadIzquierda := menorEdad(a^.hi);
        
        { Comparación manual para determinar la menor edad }
        if (edadIzquierda < a^.dato.edad) then
            menorEdad := edadIzquierda
        else
            menorEdad := a^.dato.edad;
    end;
end;

{iv. Aumente en 1 la edad de todos los socios.}
procedure aumentarEdad(var a: arbol);
begin
    if (a <> nil) then
    begin
        a^.dato.edad := a^.dato.edad + 1;
        aumentarEdad(a^.hi);
        aumentarEdad(a^.hd);
    end;
end;

{v. Lea un valor entero e informe si existe o no existe 
un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor 
leído y retorne verdadero o falso.}
function existeSocioPorNumero(a: arbol; nro: integer): boolean;
begin
    if (a = nil) then
        existeSocioPorNumero := false
    else if (a^.dato.nro = nro) then
        existeSocioPorNumero := true
    else if (nro < a^.dato.nro) then
        existeSocioPorNumero := existeSocioPorNumero(a^.hi, nro)
    else
        existeSocioPorNumero := existeSocioPorNumero(a^.hd, nro);
end;
{vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. 
Debe invocar a un módulo recursivo que reciba el nombre 
leído y retorne verdadero o falso.}
function existeSocioPorNombre(a: arbol; nombre: string): boolean;
begin
    if (a = nil) then
        existeSocioPorNombre := false
    else if (a^.dato.nombre = nombre) then
        existeSocioPorNombre := true
    else
    begin
        existeSocioPorNombre := existeSocioPorNombre(a^.hi, nombre) or
                                existeSocioPorNombre(a^.hd, nombre);
    end;
end;
{vii. Informe la cantidad de socios. 
Debe invocar a un módulo recursivo que retorne dicha
cantidad.}
function contarSocios(a: arbol): integer;
begin
    if (a = nil) then
        contarSocios := 0
    else
        contarSocios := 1 + contarSocios(a^.hi) + contarSocios(a^.hd);
end;
{viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente}
function sumaEdad(a: arbol): integer;
begin
    if (a = nil) then
        sumaEdad := 0
    else
        sumaEdad := a^.dato.edad + sumaEdad(a^.hi) + sumaEdad(a^.hd);
end;

procedure imprimirNumerosSocio(a: arbol);
begin
    if (a <> nil) then
    begin
        imprimirNumerosSocio(a^.hi);
        Write(a^.dato.nro, ' ');
        imprimirNumerosSocio(a^.hd);
    end;
end;

procedure imprimirNumerosSocioPares(a: arbol);
begin
    if (a <> nil) then
    begin
        imprimirNumerosSocioPares(a^.hd);
        if (a^.dato.nro mod 2 = 0) then
            Write(a^.dato.nro, ' ');
        imprimirNumerosSocioPares(a^.hi);
    end;
end;


var
    a:arbol;
    nro:integer;
    nombre: string;
    promedioEdad: real;

begin
    a:=nil;
    cargarSocios(a);
    WriteLn('-----------------------------');
    WriteLn('-----------------------------');
    WriteLn('Impresión en orden Preorden:');
    imprimirArbolPreorden(a);
    WriteLn('-----------------------------');
    WriteLn('Impresión en orden Inorden:');
    imprimirArbolInorden(a);
    WriteLn('-----------------------------');
    WriteLn('Impresión en orden Postorden:');
    imprimirArbolPostorden(a);
    WriteLn('-----------------------------');
    WriteLn('Numero de socio mas grande: ',maximoSocio(a));
    WriteLn('-----------------------------');
    WriteLn('-----------------------------');
    WriteLn('-----------------------------');
    WriteLn('Socio con el número más chico: ', minimoSocio(a).nombre, ', Edad: ', minimoSocio(a).edad);
    WriteLn('-----------------------------');
    WriteLn('Numero de socio con mayor edad es: ',socioConMayorEdad(a));
    WriteLn('-----------------------------');
    WriteLn('-----------------------------');
    WriteLn('Aumento de Edad');
    aumentarEdad(a);
    WriteLn('-----------------------------');
    {v. Lea un valor entero e informe si existe o no existe un socio con ese valor}
    Write('Ingrese el número de socio a buscar: '); readln(nro);
    if existeSocioPorNumero(a, nro) then
        WriteLn('Socio con número ', nro, ' existe.')
    else
        WriteLn('Socio con número ', nro, ' no existe.');
    WriteLn('-----------------------------');
    {vi. Lea un nombre e informe si existe o no existe un socio con ese nombre}
    Write('Ingrese el nombre del socio a buscar: '); readln(nombre);
    if existeSocioPorNombre(a, nombre) then
        WriteLn('Socio con nombre "', nombre, '" existe.')
    else
        WriteLn('Socio con nombre "', nombre, '" no existe.');
    WriteLn('-----------------------------');
    {vii. Informe la cantidad de socios}
    WriteLn('Cantidad de socios: ', contarSocios(a));
    WriteLn('-----------------------------');
    {viii. Informe el promedio de edad de los socios}
    promedioEdad := sumaEdad(a) / contarSocios(a);
    WriteLn('Promedio de edad: ', promedioEdad:0:2);
    WriteLn('-----------------------------');
    {ix. Informe los números de socio en orden creciente}
    Write('Números de socio en orden creciente: ');
    imprimirNumerosSocio(a);
    WriteLn;
    WriteLn('-----------------------------');
    {x. Informe los números de socio pares en orden decreciente}
    Write('Números de socio pares en orden decreciente: ');
    imprimirNumerosSocioPares(a);
    WriteLn;
    WriteLn('-----------------------------');
    WriteLn('Programa terminado.');
end.