{1.Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir)}


program uno;

type
    venta = record
        codigoV: integer;
        codigoP: integer;
        cantV: integer;
        precioU: real;
    end;

    producto = record
        codigoP: integer;
        cantTotal: integer;
        montoTotal: real;
    end;

    arbolV = ^nodoV;
    nodoV = record
        dato: venta;
        hi: arbolV;
        hd: arbolV;
    end;

    arbolP = ^nodoP;
    nodoP = record
        dato: producto;
        hi: arbolP;
        hd: arbolP;
    end;

procedure leerVentas(var v: venta);
begin
    writeln('Codigo de Venta: '); readln(v.codigoV);
    if (v.codigoV <> -1) then begin
        writeln('Codigo de Producto: '); readln(v.codigoP);
        writeln('Cantidad Vendida: '); readln(v.cantV);
        writeln('Precio por unidad: '); readln(v.precioU);
    end;
end;

procedure agregarVenta(var aV: arbolV; v: venta);
begin
    if (aV = nil) then begin
        new(aV);
        aV^.dato := v;
        aV^.hi := nil;
        aV^.hd := nil;
    end
    else if (v.codigoP < aV^.dato.codigoP) then
        agregarVenta(aV^.hi, v)
    else
        agregarVenta(aV^.hd, v);
end;

procedure cargarVentas(var a: arbolV);
var
    v: venta;
begin
    leerVentas(v);
    while (v.codigoV <> -1) do begin
        agregarVenta(a, v);
        leerVentas(v);
    end;
end;

procedure agregarOActualizarProducto(var aP: arbolP; p: producto);
begin
    if (aP = nil) then begin
        new(aP);
        aP^.dato := p;
        aP^.hi := nil;
        aP^.hd := nil;
    end
    else if (p.codigoP < aP^.dato.codigoP) then
        agregarOActualizarProducto(aP^.hi, p)
    else if (p.codigoP > aP^.dato.codigoP) then
        agregarOActualizarProducto(aP^.hd, p)
    else begin
        // Producto ya existe, actualizar cantidades y monto
        aP^.dato.cantTotal := aP^.dato.cantTotal + p.cantTotal;
        aP^.dato.montoTotal := aP^.dato.montoTotal + p.montoTotal;
    end;
end;

procedure cargarProductos(var aP: arbolP; a: arbolV);
var
    p: producto;
begin
    if (a <> nil) then begin
        // Recorrer árbol en in-order
        cargarProductos(aP, a^.hi);

        // Procesar la venta actual
        p.codigoP := a^.dato.codigoP;
        p.cantTotal := a^.dato.cantV;
        p.montoTotal := a^.dato.cantV * a^.dato.precioU;
        agregarOActualizarProducto(aP, p);

        cargarProductos(aP, a^.hd);
    end;
end;

procedure ImprimirArbol(aP: arbolP);
begin
    if (aP <> nil) then begin
        writeln('Codigo de Producto: ', aP^.dato.codigoP);
        writeln('Cantidad Total Vendido: ', aP^.dato.cantTotal);
        writeln('Monto ganado Total: $', aP^.dato.montoTotal:0:2);
        ImprimirArbol(aP^.hi);
        ImprimirArbol(aP^.hd);
    end;
end;

function ContarMenores(aP: arbolP; codigo: integer): integer;
begin
    if (aP = nil) then
        ContarMenores := 0
    else if (aP^.dato.codigoP < codigo) then
        ContarMenores := 1 + ContarMenores(aP^.hi, codigo) + ContarMenores(aP^.hd, codigo)
    else
        ContarMenores := ContarMenores(aP^.hi, codigo);
end;

function MontoTotalEntre(aP: arbolP; codigoInf, codigoSup: integer): real;
begin
    if (aP = nil) then
        MontoTotalEntre := 0
    else if (aP^.dato.codigoP <= codigoInf) then
        MontoTotalEntre := MontoTotalEntre(aP^.hd, codigoInf, codigoSup)
    else if (aP^.dato.codigoP >= codigoSup) then
        MontoTotalEntre := MontoTotalEntre(aP^.hi, codigoInf, codigoSup)
    else
        MontoTotalEntre := aP^.dato.montoTotal + MontoTotalEntre(aP^.hi, codigoInf, codigoSup) 
        + MontoTotalEntre(aP^.hd, codigoInf, codigoSup);
end;

var
    aV: arbolV;
    aP: arbolP;
    codigoBuscar, codigoInf, codigoSup: integer;
    montoTotal: real;
begin
    aV := nil;
    aP := nil;
    cargarVentas(aV);  // Cargar el árbol de ventas
    cargarProductos(aP, aV);  // Procesar ventas y cargar árbol de productos
    writeln('Arbol de Productos en Pre orden');
    ImprimirArbol(aP);


    writeln('Ingrese un código de producto para contar menores: '); readln(codigoBuscar);
    writeln('Cantidad de códigos menores: ', ContarMenores(aP, codigoBuscar));
    writeln('------------------------------------------');
    writeln('------------------------------------------');
    writeln('------------MONTO TOTAL ENTRE LOS PRODUCTOS INF Y SUP-----------------------');
    writeln('Ingrese el código inferior: '); readln(codigoInf);
    writeln('Ingrese el código superior: '); readln(codigoSup);
    montoTotal := MontoTotalEntre(aP, codigoInf, codigoSup);
    writeln('Monto total entre códigos ', codigoInf, ' y ', codigoSup, ': $ ', montoTotal:0:2);
end.
