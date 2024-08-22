{2.Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program dos;

type
    dias=1..31;
    meses=1..12;

    prestamo=record
        isbn:integer;
        numS:integer;
        dia:dias;
        mes:meses;
        cantD:integer;
    end;

{a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).}

    arbolP=^nodoP;
    nodoP=record
        dato:prestamo;
        hi:arbolP;
        hd:arbolP;
    end;

    listaP=^nodo;
    nodo=record
        dato:prestamo;
        sig:listaP;
    end;

    arbolLP = ^nodoLP;
    nodoLP = record
        isbn: integer;
        prestamos: listaP;
        hi: arbolLP;
        hd: arbolLP;
    end;

procedure leerPrestamos(var p:prestamo);
begin
    writeln('Ingrese el ISBN: ');readln(p.isbn);
    if (p.isbn<>-1)then begin
        writeln('Ingrese el numero de socio: ');readln(p.numS);
        writeln('Ingrese el dia del prestamo: ');readln(p.dia);
        writeln('Ingrese el mes del prestamos: ');readln(p.mes);
        writeln('Ingrese la cantidad de dias prestado: ');readln(p.cantD);
    end;
end;

procedure agregarPrestamos(var aP:arbolP; p:prestamo);
begin
    if (aP=nil) then begin
        new(aP);
        aP^.dato:=p;
        aP^.hi:=nil;
        aP^.hd:=nil;
    end
    else 
        if (p.isbn<aP^.dato.isbn)then
            agregarPrestamos(aP^.hi,p)
        else
            agregarPrestamos(aP^.hd,p);
end;

procedure agregaAdelante(var L:listaP; p:prestamo);
var 
    nue: listaP;
begin
    new(nue);
    nue^.dato:=p;
    nue^.sig:=L;
    L:=nue;
end;    


procedure agregarListaPrestamosISBN(var aLP: arbolLP; p: prestamo);
begin
    if (aLP = nil) then begin
        new(aLP);
        aLP^.isbn := p.isbn;
        aLP^.prestamos := nil;
        agregaAdelante(aLP^.prestamos, p);
        aLP^.hi := nil;
        aLP^.hd := nil;
    end
    else if (p.isbn = aLP^.isbn) then
        agregaAdelante(aLP^.prestamos, p)  //agrego los prestamos que poseen el mismo isbn a la lista Prestamos
    else if (p.isbn < aLP^.isbn) then
        agregarListaPrestamosISBN(aLP^.hi, p) //agrego la lista de isbn 
    else
        agregarListaPrestamosISBN(aLP^.hd, p);
end;


procedure cargarPrestamos(var aP:arbolP; var aLP:arbolLP);
var 
    p:prestamo;
    L:listaP;
begin
    leerPrestamos(p);
    while (p.isbn <> -1) do begin
        agregarPrestamos(aP,p);
        agregarListaPrestamosISBN(aLP,p);
        leerPrestamos(p);
    end;
end;

procedure mostrarArbolPrestamos(aP: arbolP);
begin
    if aP <> nil then begin
        mostrarArbolPrestamos(aP^.hi);  // Recorre el subárbol izquierdo
        writeln('ISBN: ', aP^.dato.isbn, ' - Numero de Socio: ', aP^.dato.numS,
                ' - Dia: ', aP^.dato.dia, ' - Mes: ', aP^.dato.mes,
                ' - Cantidad de Dias: ', aP^.dato.cantD);
        mostrarArbolPrestamos(aP^.hd);  // Recorre el subárbol derecho
    end;
end;

procedure mostrarListaPrestamos(L: listaP);
begin
    while L <> nil do begin
        writeln('    Numero de Socio: ', L^.dato.numS,
                ' - Dia: ', L^.dato.dia, ' - Mes: ', L^.dato.mes,
                ' - Cantidad de Dias: ', L^.dato.cantD);
        L := L^.sig;
    end;
end;

procedure mostrarArbolListaPrestamos(aLP: arbolLP);
begin
    if aLP <> nil then begin
        mostrarArbolListaPrestamos(aLP^.hi);  // Recorre el subárbol izquierdo
        writeln('ISBN: ', aLP^.isbn);
        mostrarListaPrestamos(aLP^.prestamos);  // Muestra la lista de préstamos para ese ISBN
        mostrarArbolListaPrestamos(aLP^.hd);  // Recorre el subárbol derecho
    end;
end;


var
    aP: arbolP;
    aLP: arbolLP;
begin
    aP := nil;
    aLP := nil;
    cargarPrestamos(aP, aLP);

    writeln('Arbol de Préstamos: ');
    mostrarArbolPrestamos(aP);

    writeln('Arbol de Listas de Préstamos: ');
    mostrarArbolListaPrestamos(aLP);
end.