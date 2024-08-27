{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
c. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}

program dos;

type
    venta = record
        codP: integer;
        fecha: string;
        cantU: integer;
    end;

    arbolV = ^nodo;
    nodo = record
        dato: venta;
        HI: arbolV;
        HD: arbolV;
    end;

    producto = record
        codP: integer;
        cantTotalV: integer;
    end;

    arbolP = ^nodoP;
    nodoP = record
        dato: producto;
        HI: arbolP;
        HD: arbolP;
    end;

    listaV = ^nodoV;
    nodoV = record
        dato: venta;
        sig: listaV;
    end;

    arbolLV = ^nodoLV;
    nodoLV = record
        codigoP: integer;
        ventas: listaV;  // Este campo almacenará la lista de ventas para un producto.
        HI: arbolLV;
        HD: arbolLV;
    end;

procedure GenerarArbol(var aV: arbolV);

    procedure cargarVentas(var v: venta);
    var
        vFechas: array[0..9] of String = ('1 de marzo', '3 de octubre', '10 de enero', '11 de agosto', '3 de noviembre', '2 de junio', '22 de febrero', '6 de julio', '7 de enero', '21 de diciembre');
    begin
        v.codP := random(51) * 100;
        if (v.codP <> 0) then begin
            v.fecha := vFechas[random(10)];
            v.cantU := random(100);
        end;
    end;

    procedure InsertarElemento(var aV: arbolV; elem: venta);
    begin
        if (aV = nil) then begin
            new(aV);
            aV^.dato := elem;
            aV^.HI := nil;
            aV^.HD := nil;
        end
        else if (elem.codP < aV^.dato.codP) then
            InsertarElemento(aV^.HI, elem)
        else
            InsertarElemento(aV^.HD, elem);
    end;

var
    unaVenta: venta;
begin
    WriteLn('---Generando Arbol de Ventas----');
    cargarVentas(unaVenta);
    while (unaVenta.codP <> 0) do begin
        InsertarElemento(aV, unaVenta);
        cargarVentas(unaVenta);
    end;
end;

procedure mostrarArbol(a: arbolV);
begin
    if (a <> nil) then begin
        mostrarArbol(a^.HI);
        WriteLn('** Codigo de Producto: ', a^.dato.codP, '--**Fecha: ', a^.dato.fecha, '--**Cantidad de  Unidades Vendidas: ', a^.dato.cantU, ' **');
        mostrarArbol(a^.HD);
    end;
end;

procedure actualizarOInsertarProducto(var aP: arbolP; codP: integer; cantU: integer);
begin
    if (aP = nil) then begin  
        new(aP);
        aP^.dato.codP := codP;
        aP^.dato.cantTotalV := cantU;
        aP^.HI := nil;
        aP^.HD := nil;
    end
    else if (codP < aP^.dato.codP) then   
        actualizarOInsertarProducto(aP^.HI, codP, cantU)
    else if (codP > aP^.dato.codP) then
        actualizarOInsertarProducto(aP^.HD, codP, cantU)
    else
        aP^.dato.cantTotalV := aP^.dato.cantTotalV + cantU;  // Si ya existe el producto, sumamos la cantidad
end;

procedure generarArbolP(aV: arbolV; var aP: arbolP);
begin
    if aV <> nil then begin
        actualizarOInsertarProducto(aP, aV^.dato.codP, aV^.dato.cantU);
        generarArbolP(aV^.HI, aP);
        generarArbolP(aV^.HD, aP);
    end;
end;

procedure mostrarArbolP(a: arbolP);
begin
    if (a <> nil) then begin
        mostrarArbolP(a^.HI);
        WriteLn('El codigo de producto es: ', a^.dato.codP);
        WriteLn('La cantidad de Unidades Totales Vendidas es: ', a^.dato.cantTotalV);
        mostrarArbolP(a^.HD);
    end;
end;

procedure agregarVentaLista(var L: listaV; v: venta);
var
    nuevo: listaV;
begin
    new(nuevo);
    nuevo^.dato := v;
    nuevo^.sig := L;
    L := nuevo;
end;

procedure actualizarOInsertarArbolLV(var aLV: arbolLV; v: venta);
begin
    if (aLV = nil) then begin
        new(aLV);
        aLV^.codigoP := v.codP;
        aLV^.ventas := nil;
        agregarVentaLista(aLV^.ventas, v);
        aLV^.HI := nil;
        aLV^.HD := nil;
    end
    else if (v.codP < aLV^.codigoP) then
        actualizarOInsertarArbolLV(aLV^.HI, v)
    else if (v.codP > aLV^.codigoP) then
        actualizarOInsertarArbolLV(aLV^.HD, v)
    else
        agregarVentaLista(aLV^.ventas, v);  // Si ya existe el producto, añadimos la venta a la lista.
end;

procedure generarArbolLV(aV: arbolV; var aLV: arbolLV);
begin
    if aV <> nil then begin
        actualizarOInsertarArbolLV(aLV, aV^.dato);
        generarArbolLV(aV^.HI, aLV);
        generarArbolLV(aV^.HD, aLV);
    end;
end;

procedure mostrarListaVentas(L: listaV);
begin
    while L <> nil do begin
        WriteLn('   Venta - Fecha: ', L^.dato.fecha, ', Cantidad: ', L^.dato.cantU);
        L := L^.sig;
    end;
end;

procedure mostrarArbolLV(a: arbolLV);
begin
    if (a <> nil) then begin
        mostrarArbolLV(a^.HI);
        WriteLn('Código de Producto: ', a^.codigoP);
        mostrarListaVentas(a^.ventas);
        mostrarArbolLV(a^.HD);
    end;
end;
{b. Implemente un módulo que reciba el árbol generado en i. 
y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.}

function cantidadProductos(a:arbolV; fecha:string):integer;
begin
    if(a=nil) then
        cantidadProductos:=0
    else begin
        if (a^.dato.fecha=fecha)then
            cantidadProductos:= a^.dato.cantU + cantidadProductos(a^.HI,fecha) 
                                            + cantidadProductos(a^.HD,fecha)
        else cantidadProductos:= cantidadProductos(a^.HI,fecha) 
                                + cantidadProductos(a^.HD,fecha)
    end;
end;

{c. Implemente un módulo que reciba el árbol generado en ii. 
y retorne el código de producto con mayor cantidad 
total de unidades vendidas.}

function codigoProductoMasVendido(aP:arbolP):integer;
var
    maxCodigo:integer;
    maxCantidad:integer;

    procedure buscarMaximo(aP:arbolP);
    begin
        if (aP<>nil) then begin
            if(aP^.dato.cantTotalV>maxCantidad)then begin
                maxCantidad:=aP^.dato.cantTotalV;
                maxCodigo:=aP^.dato.codP;
            end;
            buscarMaximo(aP^.HI);
            buscarMaximo(aP^.HD);
        end;
    end;
begin
    maxCantidad := -1;  // Inicia con un valor bajo
    maxCodigo := -1;    // Inicia con un código no válido
    buscarMaximo(aP);   // Llama a la función recursiva para encontrar el máximo
    codigoProductoMasVendido := maxCodigo;  // Retorna el código con más ventas
end;

{c. Implemente un módulo que reciba el árbol generado en iii. 
y retorne el código de producto con mayor cantidad de ventas.}

function contarVentas(L:listaV):integer;
var
    contador:integer;
begin
    contador:=0;
    while (L<>nil) do begin
        contador:=contador +1;
        L:=L^.sig;
    end;
    contarVentas:=contador;
end;

function codigoProductoMasVendidoII(aLV: arbolLV): integer;
var
    maxCodigo: integer;
    maxVentas: integer;

    procedure buscarMaximo(aLV: arbolLV);
    var
        cantidadVentas: integer;
    begin
        if aLV <> nil then begin
            cantidadVentas := contarVentas(aLV^.ventas);
            if cantidadVentas > maxVentas then begin
                maxVentas := cantidadVentas;
                maxCodigo := aLV^.codigoP;
            end;
            buscarMaximo(aLV^.HI);
            buscarMaximo(aLV^.HD);
        end;
    end;
begin
    maxVentas := -1;   // Inicia con un valor bajo
    maxCodigo := -1;   // Inicia con un código no válido
    buscarMaximo(aLV); // Llama al procedimiento recursivo para encontrar el máximo
    codigoProductoMasVendidoII := maxCodigo;  // Retorna el código con más ventas
end;

var
    a: arbolV;
    aP: arbolP;
    aLV:arbolLV;
    fecha:String;
begin
    randomize();
    a:=nil;
    aP := nil;
    GenerarArbol(a);
    WriteLn('+++++++++++++++++++++++++++++++');
    WriteLn('++++++Arbol del Ventas++++++');
    WriteLn('+++++++++++++++++++++++++++++++');
    mostrarArbol(a);

    WriteLn('+++++++++++++++++++++++++++++++');
    WriteLn('++++++Arbol del Productos++++++');
    WriteLn('+++++++++++++++++++++++++++++++');   
    generarArbolP(a, aP);
    mostrarArbolP(aP);
    WriteLn('+++++++++++++++++++++++++++++++++++++');
    WriteLn('++++++Arbol de Listas de Ventas++++++');
    WriteLn('+++++++++++++++++++++++++++++++++++++');
    aLV:=Nil;
    generarArbolLV(a,aLV);
    mostrarArbolLV(aLV);
    WriteLn();
    WriteLn('Elija una fecha para ver la cantidad de productos vendidos ese dia: ');
    ReadLn(fecha);
    WriteLn('La cantidad de productos vendidos el dia ', fecha,' fue ', cantidadProductos(a,fecha),' productos.');
    writeln();
    WriteLn('+++++++++++++++++++++++++++++++++++++++++++');
    WriteLn('++++++Codigo de Producto mas vendido ++++++');
    writeln();
    writeln('El codigo de producto mas vendido es: ',codigoProductoMasVendido(aP));
    writeln();
    WriteLn('++++++++++++++++++++++++++++++++++++++++++');
    writeln();
    WriteLn('+++++++++++++++++++++++++++++++++++++++++++');
    WriteLn('++++++Codigo de Producto mas vendido ++++++');
    writeln();
    writeln('El codigo de producto mas vendido es: ',codigoProductoMasVendidoII(aLV));
    writeln();
    WriteLn('++++++++++++++++++++++++++++++++++++++++++');
end.