program uno;

type
    socio = record
        nro: integer;
        nombre: string;
        edad: integer;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato: socio;
        hi: arbol;
        hd: arbol;
    end;

procedure leerSocios(var s: socio);
begin
    Write('Escribir el numero de socio: '); readln(s.nro);
    if (s.nro <> 0) then
    begin
        Write('Escribir el nombre del socio: '); readln(s.nombre);
        Write('Escribir la edad del socio: '); readln(s.edad);
    end;
end;

procedure agregarSocio(var a: arbol; s: socio);
begin
    if (a = nil) then
    begin
        New(a);
        a^.dato := s;
        a^.hi := nil;
        a^.hd := nil;
    end
    else
    begin
        if (s.nro <= a^.dato.nro) then
            agregarSocio(a^.hi, s)
        else
            agregarSocio(a^.hd, s);
    end;
end;

procedure cargarSocios(var a: arbol);
var
    s: socio;
begin
    a := nil;
    leerSocios(s);
    while (s.nro <> 0) do
    begin
        agregarSocio(a, s);
        leerSocios(s);
    end;
end;

function maximoSocio(a: arbol): integer;
begin
    if (a = nil) then
        maximoSocio := -1  { Indicador de árbol vacío }
    else if (a^.hd = nil) then
        maximoSocio := a^.dato.nro
    else
        maximoSocio := maximoSocio(a^.hd);
end;

function minimoSocio(a: arbol): socio;
begin
    if (a = nil) then
        writeln('Árbol vacío')
    else if (a^.hi = nil) then
        minimoSocio := a^.dato
    else
        minimoSocio := minimoSocio(a^.hi);
end;

function mayorEdad(a: arbol): integer;
var
    edadDerecha: integer;
begin
    if (a = nil) then
        mayorEdad := -1  { Indicador de árbol vacío }
    else
    begin
        { Recursión para encontrar la edad máxima en el subárbol derecho }
        if (a^.hd = nil) then
            edadDerecha := a^.dato.edad
        else
            edadDerecha := mayorEdad(a^.hd);
        
        { Comparación manual para determinar la mayor edad }
        if (edadDerecha > a^.dato.edad) then
            mayorEdad := edadDerecha
        else
            mayorEdad := a^.dato.edad;
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

procedure aumentarEdad(var a: arbol);
begin
    if (a <> nil) then
    begin
        a^.dato.edad := a^.dato.edad + 1;
        aumentarEdad(a^.hi);
        aumentarEdad(a^.hd);
    end;
end;

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

function contarSocios(a: arbol): integer;
begin
    if (a = nil) then
        contarSocios := 0
    else
        contarSocios := 1 + contarSocios(a^.hi) + contarSocios(a^.hd);
end;

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
    a: arbol;
    nro: integer;
    nombre: string;
    promedioEdad: real;
begin
    a := nil;
    cargarSocios(a);

    {i. Informe el número de socio más grande}
    WriteLn('Número de socio más grande: ', maximoSocio(a));

    {ii. Informe los datos del socio con el número de socio más chico}
    WriteLn('Socio con el número más chico: ', minimoSocio(a).nombre, ', Edad: ', minimoSocio(a).edad);

    {iii. Informe el número de socio con mayor edad}
    WriteLn('Número de socio con mayor edad: ', mayorEdad(a));

    {iv. Aumente en 1 la edad de todos los socios}
    aumentarEdad(a);

    {v. Lea un valor entero e informe si existe o no existe un socio con ese valor}
    Write('Ingrese el número de socio a buscar: '); readln(nro);
    if existeSocioPorNumero(a, nro) then
        WriteLn('Socio con número ', nro, ' existe.')
    else
        WriteLn('Socio con número ', nro, ' no existe.');

    {vi. Lea un nombre e informe si existe o no existe un socio con ese nombre}
    Write('Ingrese el nombre del socio a buscar: '); readln(nombre);
    if existeSocioPorNombre(a, nombre) then
        WriteLn('Socio con nombre "', nombre, '" existe.')
    else
        WriteLn('Socio con nombre "', nombre, '" no existe.');

    {vii. Informe la cantidad de socios}
    WriteLn('Cantidad de socios: ', contarSocios(a));

    {viii. Informe el promedio de edad de los socios}
    promedioEdad := sumaEdad(a) / contarSocios(a);
    WriteLn('Promedio de edad: ', promedioEdad:0:2);

    {ix. Informe los números de socio en orden creciente}
    Write('Números de socio en orden creciente: ');
    imprimirNumerosSocio(a);
    WriteLn;

    {x. Informe los números de socio pares en orden decreciente}
    Write('Números de socio pares en orden decreciente: ');
    imprimirNumerosSocioPares(a);
    WriteLn;

    WriteLn('Programa terminado.');
end.
