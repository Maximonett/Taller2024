{3.- Netflix ha publicado  la lista de películas que estarán disponibles  durante  el mes de diciembre 
de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura ,  
3:  drama,  4:  suspenso,  5:  comedia,  6:  bélico,  7:  documental  y  8:  terror)  y  puntaje  promedio  
otorgado por las críticas.  
Implementar  un programa que  invoque  a módulos  para cada uno de los siguientes  puntos:
a.  Lea  los  datos  de  películas,  los  almacene  por  orden  de  llegada
y  agrupados  por  código  de género,  y  retorne  en  una  estructura  
de  datos  adecuada.  La  lectura  finaliza  cuando  se  lee  el 
código de la película  -1.
b.  Genere  y  retorne  en  un  vector, para  cada  género, el  código de  
película  con  mayor  puntaje obtenido  entre todas las críticas,
a partir  de la estructura  generada en a)..  
c.  Ordene  los  elementos  del  vector  generado  en  b)  por  puntaje  utilizando  alguno  de  los  dos 
métodos vistos en la teoría.  
d. Muestre  el código de película  con mayor puntaje  y el código de  película  con menor  puntaje,  
del vector obtenido en el punto  c).}

program tres;

type
    genero = 1..8;
    pelicula = record
        codigoP: integer;
        codigoG: genero;
        puntajePro: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: pelicula;
        sig: lista;
    end;

    vector = array[genero] of lista;
    vectorMax = array[genero] of integer;

{ Procedimiento para leer datos de una película }
procedure leerPelicula(var p: pelicula);
begin
    WriteLn('Ingrese el codigo de pelicula: '); ReadLn(p.codigoP);
    if (p.codigoP <> -1) then begin
        WriteLn('Ingrese el codigo de Genero: '); ReadLn(p.codigoG);
        WriteLn('Ingrese el Puntaje promedio: '); ReadLn(p.puntajePro);
    end;
end;

{ Procedimiento para agregar una película a la lista de manera ordenada por código de género }
procedure agregarOrdenado(var L: lista; p: pelicula);
var
    nue, act, ant: lista;
begin
    new(nue);
    nue^.dato := p;
    act := L; ant := L;
    while (act <> nil) and (p.codigoG > act^.dato.codigoG) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then  // Inserción al inicio
        L := nue
    else  // Inserción en medio o al final
        ant^.sig := nue;
    nue^.sig := act;
end;

{ Procedimiento para cargar la lista de películas agrupadas por género }
procedure cargarLista(var v: vector);
var
    p: pelicula;
begin
    leerPelicula(p);
    while (p.codigoP <> -1) do begin
        agregarOrdenado(v[p.codigoG], p);  
        leerPelicula(p);
    end;
end;

{ Función para encontrar la película con el mayor puntaje en una lista }
function maximo(L: lista): integer;
var
    maxCodigo: integer;
    maxPuntaje: real;
begin
    maxCodigo := -1;
    maxPuntaje := -1;
    while (L <> nil) do begin
        if (L^.dato.puntajePro > maxPuntaje) then begin
            maxPuntaje := L^.dato.puntajePro;
            maxCodigo := L^.dato.codigoP;
        end;
        L := L^.sig;
    end;
    maximo := maxCodigo;
end;

{ Procedimiento para generar un vector con las películas de mayor puntaje por género }
procedure vectorMayorPuntaje( v: vector; var vMax: vectorMax);
var
    i: genero;
begin
    for i := 1 to 8 do
        vMax[i] := maximo(v[i]);
end;

{ Procedimiento para mostrar los resultados }
procedure mostrarResultados(vMax: vectorMax);
var
    i: genero;
begin
    for i := 1 to 8 do
        if vMax[i] <> -1 then
            writeln('Genero ', i, ': Código de la película con mayor puntaje: ', vMax[i])
        else
            writeln('Genero ', i, ': No hay películas registradas.');
end;

var
    v: vector;
    vMax: vectorMax;
    i: genero;

begin
    { Inicializar vector de listas }
    for i := 1 to 8 do
        v[i] := nil;

    { Cargar lista }
    cargarLista(v);

    { Obtener el vector con el código de película de mayor puntaje por género }
    vectorMayorPuntaje(v, vMax);

    { Mostrar los códigos de las películas con mayor puntaje }
    mostrarResultados(vMax);
end.
