{4.- Una librería requiere  el procesamiento de la información de sus productos. 
De cada producto  se conoce el código del producto,  código de rubro  (del  1 al 8) y precio.  
Implementar  un programa que  invoque  a módulos  para cada uno de los siguientes  puntos:  
a. Lea los datos de los productos  y los almacene ordenados por código de producto y agrupados 
por rubro,  en una  estructura  de datos adecuada. El ingreso de  los productos  
finaliza  cuando se lee el precio 0. 
b. Una vez almacenados, muestre  los códigos de los productos  pertenecientes  a cada rubro.  
c. Genere  un vector (de a lo sumo 30 elementos)  con los productos  del rubro  3. 
Considerar  que puede  haber  más o menos  de 30 productos del  rubro  3. 
Si la cantidad  de productos  del rubro  3 es mayor a 30, almacenar los primeros  30 
que  están en la lista e ignore el resto.  
d.  Ordene,  por  precio,  los  elementos  del  vector  generado  en  c)  
utilizando  alguno  de  los  dos métodos vistos en la teoría.  
e. Muestre  los precios  del vector resultante  del punto d). 
f. Calcule el promedio  de los precios del vector resultante  del punto  d).}

program cuatro;

type
    rubro=1..8;

    producto=record
        codigoP:integer;
        codigoR:rubro;
        precio:real;
    end;
lista=^nodo;
nodo=record
    dato:producto;
    sig:lista;
end;
vector = array [rubro] of lista;

procedure leerProducto(var p:producto);
begin
    writeln('Ingrese el precio del producto: ');readln(p.precio); 
    if (p.precio<>0)then begin
        writeln('Ingrese el codigo de producto: ');readln(p.codigoP);
        writeln('Ingrese el codigo de rubro');readln(p.codigoR);
    end;
end;

procedure agregarOrdenado(var L: lista; p: producto);
var
    nue, act, ant: lista;
begin
    new(nue);
    nue^.dato := p;
    act := L; ant := L;
    while (act <> nil) and (p.codigoP > act^.dato.codigoP) do begin //ordeno por codigo de producto
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then  // Inserción al inicio
        L := nue
    else  // Inserción en medio o al final
        ant^.sig := nue;
    nue^.sig := act;
end;
{ Procedimiento para inicializar el vector de listas }
procedure inicializarVector(var v: vector);
var
    i: rubro;
begin
    for i := 1 to 8 do
        v[i] := nil;
end;


{ Procedimiento para cargar la lista de productos agrupadas por rubro }
procedure cargarVectordDeListas(var v:vector);
var 
    p:producto;
begin
    leerProducto(p);
    while (p.precio<>0) do begin
        agregarOrdenado(v[p.codigoR],p); //inserto en el vector por codigo de rubro
        leerProducto(p);
    end;
end;

procedure mostrarCodigosPorRubro(v: vector);
var
    i: integer;
    aux: lista;  // Variable auxiliar para recorrer la lista
begin
    for i := 1 to 8 do begin
        WriteLn('Rubro: ', i);
        aux := v[i];  // Inicializamos la variable auxiliar con la lista correspondiente
        while (aux <> nil) do begin
            WriteLn('Codigo de Producto: ', aux^.dato.codigoP);
            aux := aux^.sig;  // Avanzamos en la lista con la variable auxiliar
        end;
    end;
end;


var
    v:vector;

begin
    inicializarVector(v);
    cargarVectordDeListas(v);
    mostrarCodigosPorRubro(v);
end.