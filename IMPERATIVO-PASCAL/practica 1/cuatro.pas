{4.-Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

program cuatro;

type
    rango_rubro = 1..8;

    producto = record
        precio: real;
        codR: rango_rubro;
        codP: integer;
    end;

    listaP = ^nodo;
    nodo = record
        dato: producto;
        sig: listaP;
    end;

    listaRubro = array[rango_rubro] of listaP;  {vector de listas de productos}
    vectorTreinta = array[1..30] of producto;

procedure leerProducto(var p: producto);
begin
    WriteLn('Ingrese el precio del producto: '); 
    ReadLn(p.precio);
    if (p.precio <> 0) then 
    begin
        WriteLn('Ingrese el código de rubro: '); 
        ReadLn(p.codR);
        WriteLn('Ingrese el código de Producto: '); 
        ReadLn(p.codP);
    end;
end;

procedure insertarOrdenado(var L: listaP; p: producto);
var
    nue, act, ant: listaP; {punteros auxiliares para recorrido}
begin
    new(nue);
    nue^.dato := p;
    act := L; {ubico act al inicio de la lista}
    ant := nil; {inicializo ant en nil}

    while (act <> nil) and (p.codP > act^.dato.codP) do 
    begin
        ant := act;
        act := act^.sig;
    end;

    if (ant = nil) then {al inicio o lista vacía}
    begin
        nue^.sig := L;
        L := nue;
    end
    else {al medio o al final}
    begin
        ant^.sig := nue;
        nue^.sig := act;
    end;
end;

procedure cargarLista(var L: listaRubro);
var
    p: producto;
begin
    leerProducto(p);
    while (p.precio <> 0) do 
    begin
        insertarOrdenado(L[p.codR], p);
        leerProducto(p);
    end;
end;

procedure imprimirVectorLista(L: listaRubro);
var
    i: Integer;
    act: listaP;
begin
    for i := 1 to 8 do 
    begin
        act := L[i];
        WriteLn('Rubro ', i, ':');
        while (act <> nil) do 
        begin
            WriteLn('  Precio: ', act^.dato.precio:0:2);
            WriteLn('  Código de rubro: ', act^.dato.codR);
            WriteLn('  Código de producto: ', act^.dato.codP);
            act := act^.sig;
        end;
    end;
end;

procedure crearVectorRubroTres(L: listaRubro; var v: vectorTreinta; var dimLog: integer);
var 
    act: listaP;
begin
    act := L[3]; {Inicializa el puntero al inicio de la lista del rubro 3}
    dimLog := 0; {Inicializa la dimensión lógica en 0}
    while (act <> nil) and (dimLog < 30) do 
    begin
        dimLog := dimLog + 1;
        v[dimLog] := act^.dato; {Almacena el producto en el vector}
        act := act^.sig; {Avanza al siguiente nodo en la lista}
    end;
end;

procedure imprimirVectorRubroTres(v: vectorTreinta; dimLog: integer);
var
    i: Integer;
begin
    for i := 1 to dimLog do
    begin
        WriteLn('Precio: ', v[i].precio:0:2);
        WriteLn('Código de Rubro: ', v[i].codR);
        WriteLn('Código de Producto: ', v[i].codP);
    end;
end;

procedure ordenarPorPrecio(var v: vectorTreinta; dimLog: integer);
var
    i, j, p: integer;
    item: producto; // item es del tipo del registro
begin
    for i := 1 to dimLog - 1 do
    begin
        p := i;
        for j := i + 1 to dimLog do
            if v[j].precio < v[p].precio then
                p := j;
        // Intercambia v[i] y v[p]
        item := v[p];
        v[p] := v[i];
        v[i] := item;
    end;
end;

function promedioPrecios(v: vectorTreinta; dimLog: integer): real;
var
    i: integer;
    suma: real;
begin
    suma := 0.0;
    for i := 1 to dimLog do
        suma := suma + v[i].precio;
    if dimLog > 0 then
        promedioPrecios := suma / dimLog
    else
        promedioPrecios := 0;
end;

var
    L: listaRubro;
    i, dimLog: Integer;
    v: vectorTreinta;
begin
    for i := 1 to 8 do
        L[i] := nil; {Inicializar todas las listas de rubros como vacías}
    
    cargarLista(L);
    imprimirVectorLista(L);
    
    crearVectorRubroTres(L, v, dimLog);
    
    WriteLn('-------------');
    WriteLn('Sin ordenar');
    WriteLn('-------------');
    imprimirVectorRubroTres(v, dimLog);
    
    ordenarPorPrecio(v, dimLog);
    
    WriteLn('-------------');
    WriteLn('Ordenado de menor a mayor');
    WriteLn('-------------');
    imprimirVectorRubroTres(v, dimLog);
    
    WriteLn('-------------');
    WriteLn('Promedio de precios');
    WriteLn('-------------');
    WriteLn('Promedio: ', promedioPrecios(v, dimLog):0:2);
end.
