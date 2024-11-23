{
   bibliotecaSarmiento.pas
   
   La biblioteca Sarmiento necesita un sistema para obtener estadísticas sobre 
los libros prestados. De cada préstamo se conoce: el número de préstamo, 
ISBN del libro y código de socio. La lectura finaliza con código de socio 0 y todos los
préstamos realizados a un mismo socio se leen consecutivamente.
a) Implementar un módulo que lea información de los prestamos y genere:
i) Uno estructura de datos eficiente para la búsqueda por ISBN del libro
ii) Una estructura donde se almacenen códigos de socios junto a su cantidad de préstamos.
b) Implementar un módulo que reciba la estructura generada en a) y un ISBN 
y retorne la cantidad de préstamos de ese ISBN.
c) Realizar un módulo recursivo que reciba la estructura generada 
en a) ii y un valor X y retorne la cantidad de
socios con cantidad de préstamos superior al valor X.
   
   
}

program bibliotecaSarmiento;

type
    prestamo = record
        nro: integer;
        isbn: integer;
        codS: integer;
    end;

    arbolL = ^nodoL;
    nodoL = record
        dato: prestamo;
        hi: arbolL;
        hd: arbolL;
    end;

    listaS = ^nodoS;
    nodoS = record
        codS: integer;
        cant: integer;
        sig: listaS;
    end;

procedure leerAleatorioPrestamos(var p: prestamo);
begin
    p.codS := random(100);
    if (p.codS <> 0) then begin
        p.nro := random(100) + 1;
        p.isbn := random(100) + 1;
    end;
end;

procedure agregaArbolLibros(var aL: arbolL; p: prestamo);
begin
    if (aL = nil) then begin
        new(aL);
        aL^.dato := p;
        aL^.hi := nil;
        aL^.hd := nil;
    end
    else if (p.isbn < aL^.dato.isbn) then
        agregaArbolLibros(aL^.hi, p)
    else
        agregaArbolLibros(aL^.hd, p);
end;

procedure armarLista(var L: listaS; codS: integer);
var
    act, ant, nuevo: listaS;
begin
    act := L;
    ant := nil;

    while (act <> nil) and (act^.codS <> codS) do begin
        ant := act;
        act := act^.sig;
    end;

    if (act = nil) then begin // si el socio no esta, cre un nuevo nodo
        new(nuevo);
        nuevo^.codS := codS;
        nuevo^.cant := 1;
        nuevo^.sig := nil;

        if (ant = nil) then // inserta al princiopo o depues del ultino nodo
            L := nuevo
        else
            ant^.sig := nuevo;
    end
    else
        act^.cant := act^.cant + 1;
end;

procedure moduloA(var aL: arbolL; var L: listaS);
var
    p: prestamo;
begin
    L := nil;
    aL := nil;

    leerAleatorioPrestamos(p);
    while (p.codS <> 0) do begin
        agregaArbolLibros(aL, p);
        armarLista(L, p.codS);
        leerAleatorioPrestamos(p);
    end;
end;

procedure mostrarArbolLibros(aL: arbolL);
begin
    if (aL <> nil) then begin
        mostrarArbolLibros(aL^.hi);
        writeln('ISBN: ', aL^.dato.isbn, ', Número de Préstamo: ', aL^.dato.nro, ', Código de Socio: ', aL^.dato.codS);
        mostrarArbolLibros(aL^.hd);
    end;
end;

procedure mostrarListaSocios(L: listaS);
begin
    while (L <> nil) do begin
        writeln('Código de Socio: ', L^.codS, ', Cantidad de Préstamos: ', L^.cant);
        L := L^.sig;
    end;
end;

function buscarCantidadPrestamos(aL: arbolL; isbn: integer): integer;
begin
    if (aL = nil) then
        buscarCantidadPrestamos := 0
    else begin
        if (isbn = aL^.dato.isbn) then
            buscarCantidadPrestamos := 1 + buscarCantidadPrestamos(aL^.hi, isbn) + buscarCantidadPrestamos(aL^.hd, isbn)
        else
            buscarCantidadPrestamos := buscarCantidadPrestamos(aL^.hi, isbn) + buscarCantidadPrestamos(aL^.hd, isbn);
    end;
end;


function contarSociosConMasPrestamos(L: listaS; x: integer): integer;
begin
    if (L = nil) then
        contarSociosConMasPrestamos := 0
    else if (L^.cant > x) then
        contarSociosConMasPrestamos := 1 + contarSociosConMasPrestamos(L^.sig, x)
    else
        contarSociosConMasPrestamos := contarSociosConMasPrestamos(L^.sig, x);
end;

{ Programa principal }
var
    aL: arbolL;
    L: listaS;
    isbnBuscado, cantidad, x, sociosConMasPrestamos: integer;
begin
    randomize();
    moduloA(aL, L);

    writeln('Árbol de Libros por ISBN:');
    mostrarArbolLibros(aL);

    writeln('Lista de Socios con Cantidad de Préstamos:');
    mostrarListaSocios(L);

    writeln('Ingrese el ISBN a buscar:');
    readln(isbnBuscado);
    cantidad := buscarCantidadPrestamos(aL, isbnBuscado);
    writeln('Cantidad de préstamos con ISBN ', isbnBuscado, ': ', cantidad);

    writeln('Ingrese el valor X para buscar socios con más préstamos:');
    readln(x);
    sociosConMasPrestamos := contarSociosConMasPrestamos(L, x);
    writeln('Cantidad de socios con más de ', x, ' préstamos: ', sociosConMasPrestamos);
end.
