program SecuenciaCaracteres;

const
    dimF = 50;

type
    vector = array[1..dimF] of char;
    lista = ^nodo;
    nodo = record
        dato: char;
        sig: lista;
    end;

{ a. Módulo recursivo para leer una secuencia de caracteres terminada en punto y almacenarlos en un vector }
procedure leerSecuenciaRecursiva(var v: vector; var dimL: integer);
var
    c: char;
begin
    if dimL < dimF then
    begin
        Read(c);
        if c <> '.' then
        begin
            dimL := dimL + 1;
            v[dimL] := c;
            leerSecuenciaRecursiva(v, dimL);
        end;
    end;
end;

{ b. Módulo que recibe el vector e imprime su contenido }
procedure imprimirVector(v: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do
        Write(v[i], ' ');
    WriteLn;
end;

{ c. Módulo recursivo que recibe el vector e imprime su contenido }
procedure imprimirVectorRecursivo(v: vector; dimL: integer; i: integer);
begin
    if i <= dimL then
    begin
        Write(v[i], ' ');
        imprimirVectorRecursivo(v, dimL, i + 1);
    end;
end;

{ d. Módulo recursivo para leer una secuencia de caracteres terminada en punto y retornar la cantidad de caracteres leídos }
function contarCaracteres: integer;
var
    c: char;
begin
    Read(c);
    if c = '.' then
        contarCaracteres := 0
    else
        contarCaracteres := 1 + contarCaracteres();
end;

{ e. Módulo recursivo para leer una secuencia de caracteres terminada en punto y retornar una lista con los caracteres leídos }
procedure leerSecuenciaLista(var l: lista);
var
    c: char;
    nuevo: lista;
begin
    Read(c);
    if c <> '.' then
    begin
        new(nuevo);
        nuevo^.dato := c;
        nuevo^.sig := nil;
        leerSecuenciaLista(nuevo^.sig);
        l := nuevo;
    end;
end;

{ f. Módulo recursivo que recibe la lista y imprime los valores en el mismo orden }
procedure imprimirLista(l: lista);
begin
    if l <> nil then
    begin
        Write(l^.dato, ' ');
        imprimirLista(l^.sig);
    end;
end;

{ g. Módulo recursivo que recibe la lista e imprime los valores en orden inverso }
procedure imprimirListaInversa(l: lista);
begin
    if l <> nil then
    begin
        imprimirListaInversa(l^.sig);
        Write(l^.dato, ' ');
    end;
end;

var
    v: vector;
    dimL: integer;
    l: lista;
begin
    { a. Leer la secuencia de caracteres y almacenar en el vector }
    dimL := 0;
    WriteLn('Ingrese una secuencia de caracteres terminada en punto:');
    leerSecuenciaRecursiva(v, dimL);

    { b. Imprimir el contenido del vector }
    WriteLn('Contenido del vector:');
    imprimirVector(v, dimL);

    { c. Imprimir el contenido del vector de forma recursiva }
    WriteLn('Contenido del vector (recursivo):');
    imprimirVectorRecursivo(v, dimL, 1);
    WriteLn;

    { d. Leer la secuencia de caracteres y contar la cantidad de caracteres }
    WriteLn('Ingrese una nueva secuencia de caracteres terminada en punto:');
    WriteLn('Cantidad de caracteres leídos:', contarCaracteres);

    { e. Leer la secuencia de caracteres y almacenar en una lista }
    WriteLn('Ingrese otra secuencia de caracteres terminada en punto:');
    l := nil;
    leerSecuenciaLista(l);

    { f. Imprimir los valores de la lista en el mismo orden }
    WriteLn('Contenido de la lista:');
    imprimirLista(l);
    WriteLn;

    { g. Imprimir los valores de la lista en orden inverso }
    WriteLn('Contenido de la lista en orden inverso:');
    imprimirListaInversa(l);
    WriteLn;
end.
