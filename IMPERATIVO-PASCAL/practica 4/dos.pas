{2.Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:}

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
    
    contadorP = record
        isbn: integer;
        cantidad: integer;
    end;

    arbolContadorP = ^nodoContadorP;
    nodoContadorP = record
        dato: contadorP;
        hi: arbolContadorP;
        hd: arbolContadorP;
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
{b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.}

function Maximo(aP:arbolP):Integer;
begin
    if (aP=nil)then
        Maximo:=-1
    else 
        if (aP^.hd=nil) then
            Maximo:=aP^.dato.isbn
        else 
            Maximo:=Maximo(aP^.hd);       
end;

{c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.}
function Minimo(aLP:arbolLP):integer;
begin
    if (aLP=nil)then 
        Minimo:=999
    else 
        if (aLP^.hi=nil) then
            Minimo:=aLP^.isbn
        else 
            Minimo:=Minimo(aLP^.hi);
end;

{d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}

function cantidadPrestamos(aP:arbolP; socio:integer):integer;
begin
    if (aP=nil)then
        cantidadPrestamos:=0
    else if (aP^.dato.numS=socio)then
        cantidadPrestamos:=1 + cantidadPrestamos(aP^.hi,socio) + cantidadPrestamos(aP^.hd,socio)
    else
        cantidadPrestamos := cantidadPrestamos(aP^.hi, socio) + cantidadPrestamos(aP^.hd, socio);    
end;

{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}

function contarPrestamosEnLista(L: listaP; socio: integer): integer;
begin
    if (L = nil) then
        contarPrestamosEnLista := 0
    else if (L^.dato.numS = socio) then
        contarPrestamosEnLista := 1 + contarPrestamosEnLista(L^.sig, socio)
    else
        contarPrestamosEnLista := contarPrestamosEnLista(L^.sig, socio);
end;

function cantidadPrestamosII(aLP: arbolLP; socio: integer): integer;
begin
    if (aLP = nil) then 
        cantidadPrestamosII := 0
    else 
        cantidadPrestamosII := contarPrestamosEnLista(aLP^.prestamos, socio) 
                            + cantidadPrestamosII(aLP^.hi, socio) 
                            + cantidadPrestamosII(aLP^.hd, socio);
end;

{f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}

procedure agregarOActualizar(var aC: arbolContadorP; isbn: integer);
begin
    if (aC = nil) then begin
        new(aC);
        aC^.dato.isbn := isbn;
        aC^.dato.cantidad := 1;
        aC^.hi := nil;
        aC^.hd := nil;
    end
    else if (isbn = aC^.dato.isbn) then
        aC^.dato.cantidad := aC^.dato.cantidad + 1
    else if (isbn < aC^.dato.isbn) then
        agregarOActualizar(aC^.hi, isbn)
    else
        agregarOActualizar(aC^.hd, isbn);
end;
procedure construirArbolContador(aP: arbolP; var aC: arbolContadorP);
begin
    if (aP <> nil) then begin
        agregarOActualizar(aC, aP^.dato.isbn);
        construirArbolContador(aP^.hi, aC);
        construirArbolContador(aP^.hd, aC);
    end;
end;

{g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}

procedure agregarOActualizar(var aC: arbolContadorP; isbn: integer; cant: integer);
begin
    if (aC = nil) then begin
        new(aC);
        aC^.dato.isbn := isbn;
        aC^.dato.cantidad := cant;
        aC^.hi := nil;
        aC^.hd := nil;
    end
    else if (isbn = aC^.dato.isbn) then
        aC^.dato.cantidad := aC^.dato.cantidad + cant
    else if (isbn < aC^.dato.isbn) then
        agregarOActualizar(aC^.hi, isbn, cant)
    else
        agregarOActualizar(aC^.hd, isbn, cant);
end;

function contarPrestamosEnLista(L: listaP): integer;
begin
    if (L = nil) then
        contarPrestamosEnLista := 0
    else
        contarPrestamosEnLista := 1 + contarPrestamosEnLista(L^.sig);
end;

procedure construirArbolContadorDesdeArbolLP(aLP: arbolLP; var aC: arbolContadorP);
var
    cant: integer;
begin
    if (aLP <> nil) then begin
        cant := contarPrestamosEnLista(aLP^.prestamos);
        agregarOActualizar(aC, aLP^.isbn, cant);
        construirArbolContadorDesdeArbolLP(aLP^.hi, aC);
        construirArbolContadorDesdeArbolLP(aLP^.hd, aC);
    end;
end;

{h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.}

procedure mostraArbolContador(aC:arbolContadorP);
begin
    If (aC <>nil) then begin
        mostraArbolContador(aC^.hi);
        WriteLn('El ISBN es: ',aC^.dato.isbn);
        WriteLn('La cantida de prestamos que tuvo fue de: ',aC^.dato.cantidad);
        mostraArbolContador(aC^.hd);
    end;
end;

{i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}




{j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}


var
    aP: arbolP;
    aLP: arbolLP;
    socio:integer;
    aC:arbolContadorP;

begin
    aP := nil;
    aLP := nil;
    aC:=nil;

    cargarPrestamos(aP, aLP);

    writeln('Arbol de Préstamos: ');
    mostrarArbolPrestamos(aP);

    writeln('Arbol de Listas de Préstamos: ');
    mostrarArbolListaPrestamos(aLP);
    writeln('---------------------------------------------');
    writeln('El maximo ISBN en la estructura i es el numero: ',Maximo(aP));
    writeln('El minimo ISBN en la estructura ii es el numero: ',Minimo(aLP));
    WriteLn('Elija un numero de socio para ver la cantida de libros prestados: ');ReadLn(socio);
    writeln('-----Estructura i-----');
    writeln('La cantidad de prestamos otorgados al socio ',socio,' es: ',cantidadPrestamos(aP,socio));
    writeln('-----Estructura ii----');
    writeln('La cantidad de prestamos otorgados al socio ',socio,' es: ',cantidadPrestamosII(aLP,socio));
    
    construirArbolContador(aP,aC);
    construirArbolContadorDesdeArbolLP(aLP,aC);
    writeln('-----------------------');
    writeln('-----Arbol Contador----');
    writeln('-----------------------');
    mostraArbolContador(aC);

end.