program dos;

type
    venta = record
        codP: integer;
        fecha: string;
        cantV: integer;
    end;

    producto = record
        codP: integer;
        totalVendida: integer;
    end;

    arbolV = ^nodo1;
    nodo1 = record
        dato: venta;
        hd: arbolV;
        hi: arbolV;
    end;

    arbolP = ^nodo2;
    nodo2 = record
        dato: producto;
        hd: arbolP;
        hi: arbolP;
    end;

procedure leerVentas(var v: venta);
begin
    Write('Ingrese codigo de producto: '); ReadLn(v.codP);
    if (v.codP <> 0) then begin
        Write('Ingrese la fecha: '); ReadLn(v.fecha);
        Write('Ingrese la cantidad vendida: '); ReadLn(v.cantV);
    end;
end;

procedure agregarVenta(var aV: arbolV; v: venta);
begin
    if (aV = nil) then begin
        New(aV);
        aV^.dato := v;
        aV^.hd := nil;
        aV^.hi := nil;
    end
    else if (v.codP <= aV^.dato.codP) then
        agregarVenta(aV^.hi, v)
    else
        agregarVenta(aV^.hd, v);
end;

procedure agregarProducto(var aP: arbolP; codP: integer; cant: integer);
begin
    if (aP = nil) then begin
        New(aP);
        aP^.dato.codP := codP;
        aP^.dato.totalVendida := cant;
        aP^.hd := nil;
        aP^.hi := nil;
    end
    else if (codP < aP^.dato.codP) then
        agregarProducto(aP^.hi, codP, cant)
    else if (codP > aP^.dato.codP) then
        agregarProducto(aP^.hd, codP, cant)
    else
        aP^.dato.totalVendida := aP^.dato.totalVendida + cant;
end;

procedure cargarVentas(var aV: arbolV; var aP: arbolP);
var
    v: venta;
begin
    leerVentas(v);
    if (v.codP <> 0) then begin
        agregarVenta(aV, v);
        agregarProducto(aP, v.codP, v.cantV);
        cargarVentas(aV, aP);
    end;
end;

procedure mostrarVentasPreOrden(aV: arbolV);
begin
    if (aV <> nil) then begin
        WriteLn('----------------');
        WriteLn('Codigo de Producto: ', aV^.dato.codP);
        WriteLn('Fecha de la Venta: ', aV^.dato.fecha);
        WriteLn('Cantidad de Producto vendidos: ', aV^.dato.cantV);
        WriteLn('----------------');
        mostrarVentasPreOrden(aV^.hi);
        mostrarVentasPreOrden(aV^.hd);
    end;
end;

procedure mostrarProductosPreOrden(aP: arbolP);
begin
    if (aP <> nil) then begin
        WriteLn('----------------');
        WriteLn('Codigo de Producto: ', aP^.dato.codP);
        WriteLn('Tatal Vendido: ', aP^.dato.totalVendida);
        WriteLn('----------------');
        mostrarProductosPreOrden(aP^.hi);
        mostrarProductosPreOrden(aP^.hd);
    end;
end;

function totalVendidaProducto(aV: arbolV; codP: integer): integer;
begin
    if (aV = nil) then
        totalVendidaProducto := 0
    else if (codP = aV^.dato.codP) then
        totalVendidaProducto := aV^.dato.cantV
    else if (codP < aV^.dato.codP) then
        totalVendidaProducto := totalVendidaProducto(aV^.hi, codP)
    else
        totalVendidaProducto := totalVendidaProducto(aV^.hd, codP);
end;

var
    aV: arbolV;
    aP: arbolP;
begin
    aV := nil;
    aP := nil;
    cargarVentas(aV, aP);
    WriteLn('----------------');
    WriteLn('----------------');
    WriteLn('Ventas Realizadas: ');
    WriteLn('----------------');
    WriteLn('----------------');
    mostrarVentasPreOrden(aV);
    mostrarProductosPreOrden(aP)
end.
