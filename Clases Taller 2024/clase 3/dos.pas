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

    venta=record
        codP:integer;
        fecha:string;
        cantU:integer;
    end;

    arbolV=^nodo;
    nodo=record
        dato:venta;
        HI:arbolV;
        HD:arbolV;
    end;
        
    producto=record
        codP:integer;
        cantTotalV:integer;
    end;

    arbolP=^nodoP;
    nodoP=record
        dato:producto;
        HI:arbolP;
        Hd:arbolP;
    end;


procedure GenerarArbol(var aV:arbolV);

    procedure cargarVentas(var v:venta);
    var
        vFechas:array[0..9]of String=('1 de marzo','3 de octubre','10 de enero','11 de agosto','3 de noviembre', '2 de junio','22 de febrero', '6 de julio','7 de enero','21 de diciembre');
    begin
        v.codP:=random(51)*100;
        if (v.codP<>0) then
            v.fecha:=vFechas[random(10)];
            v.cantU:=random(100);
    end;

    procedure InsertarElemento(var aV:arbolV; elem:venta);
    begin
        if (aV=nil) then begin
            new(aV);
            aV^.dato:=elem;
            aV^.HI:=nil;
            aV^.HD:=nil;
        end
        else 
            if (elem.codP<aV^.dato.codP) then
                InsertarElemento(aV^.HI,elem)
            else 
                InsertarElemento(aV^.HD,elem);
    end;

var 
    unaVenta:venta;
begin
    aV:=nil;
    WriteLn('---Generando Arbol de Ventas----');
    cargarVentas(unaVenta);
    while (unaVenta.codP<>0) do begin
        InsertarElemento(aV,unaVenta);
        cargarVentas(unaVenta);
    end;
end;

procedure mostrarArbol(a:arbolV);
begin
    if (a<> nil)then begin
        mostrarArbol(a^.HI);
        WriteLn('** Codigo de Producto: ',a^.dato.codP,'--**Fecha: ', a^.dato.fecha,'--**Cantidad de  Unidades Vendidas: ',a^.dato.cantU,' **');
        mostrarArbol(a^.HD);
    end;
end;

function sumar(a:arbolV):integer;
begin
    if (a=nil) then
        sumar:=0
    else
        sumar:=a^.dato.cantU +sumar(a^.HI)+ sumar(a^.HD);
end;

procedure InsertarElementoP(var aP:arbolP; p:producto);
    begin
        if (aP=nil) then begin
            new(aP);
            aP^.dato:=p;
            aP^.HI:=nil;
            aP^.HD:=nil;
        end
        else 
            if (p.codP<aP^.dato.codP) then
                InsertarElementoP(aP^.HI,p)
            else 
                InsertarElementoP(aP^.HD,p);
    end;

{ii. Generar y retornar otro árbol binario de búsqueda de productos 
vendidos ordenado por código de producto. 
Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.}

procedure generarArbolP(aV:arbolV;var aP:arbolP);
var
    p:producto;
begin
    p.codP:=aV^.dato.codP;
    if (p.codP<>0) then begin
        p.cantTotalV:=sumar(aV);
        InsertarElementoP(aP,p);
    end; 
end;

procedure mostrarArbolP(a:arbolP);
var 
    a:arbolV;
    aP:arbolP;
begin
    randomize();
    GenerarArbol(a);
    mostrarArbol(a);
    generarArbolP(a,aP)
    mostrarArbolP(aP);
end.