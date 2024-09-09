{a) Implementar un módulo que lea compras de videojuegos. De cada compra 
se lee código del videojuego, código de cliente, día y mes. 
La lectura finaliza con el código de cliente 0. Se sugiere utilizar el 
módulo leerCompra(). Se deben retornar 2 estructuras de datos:
i. Una estructura eficiente para la búsqueda por código de cliente.
ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes.
b) Implementar un módulo que reciba la estructura generada en a) i, un código 
de cliente, retorne todas las compras que realizó dicho cliente.
c) Implementar un módulo que reciba la estructura generada en a) ii y 
retorne la misma estructura ordenada por cantidad de mayor a menor.} 

program play;

type
  rango_dia = 1..31;
  rango_mes = 1..12;

  compra = record
    codV: integer;
    dia: rango_dia;
    mes: rango_mes;
  end;

  listaC = ^nodo;
  nodo = record
    dato: compra;
    sig: listaC;
  end;

  arbolC = ^nodoC;
  nodoC = record
    codC: integer;
    ListaVideos: listaC;
    hi, hd: arbolC;
  end;

  vCompras = array[1..12] of integer;

var
  aC: arbolC;
  v: vCompras;

procedure leerAleatorio(var c: compra; var codC: integer);
begin
  codC := random(101);
  if (codC <> 0) then begin
    c.codV := random(30) + 1;
    c.dia := random(31) + 1;
    c.mes := random(12) + 1;
  end;
end;

procedure agregarLista(var L: listaC; c: compra);
var
  nue: listaC;
begin
  new(nue);
  nue^.dato := c;
  nue^.sig := L;
  L := nue;
end;

procedure agregarArbolCompras(var aC: arbolC; c: compra; codC: integer);
begin
  if (aC = nil) then begin
    new(aC);
    aC^.codC := codC;
    aC^.ListaVideos := nil;
    agregarLista(aC^.ListaVideos, c);
    aC^.hi := nil;
    aC^.hd := nil;
  end
  else begin
    if (codC < aC^.codC) then
      agregarArbolCompras(aC^.hi, c, codC)
    else if (codC > aC^.codC) then
      agregarArbolCompras(aC^.hd, c, codC)
    else
      agregarLista(aC^.ListaVideos, c);
  end;
end;

procedure cargarArbolCompras(var aC: arbolC);
var
  codC: integer;
  c: compra;
begin
  leerAleatorio(c, codC);
  while (codC <> 0) do begin
    agregarArbolCompras(aC, c, codC);
    leerAleatorio(c, codC);
  end;
end;

procedure inicializarVector(var v: vCompras);
var
  i: integer;
begin
  for i := 1 to 12 do
    v[i] := 0;
end;

procedure cargarVectorComprasPorMes(L: listaC; var v: vCompras);
begin
  while (L <> nil) do begin
    v[L^.dato.mes] := v[L^.dato.mes] + 1;
    L := L^.sig;
  end;
end;

procedure cargarVectorCompras(aC: arbolC; var v: vCompras);
begin
  if (aC <> nil) then begin
    cargarVectorCompras(aC^.hi, v);
    cargarVectorComprasPorMes(aC^.ListaVideos, v);
    cargarVectorCompras(aC^.hd, v);
  end;
end;

procedure buscarCliente(aC: arbolC; codC: integer; var L: listaC);
begin
  if (aC <> nil) then begin
    if (codC = aC^.codC) then
      L := aC^.ListaVideos
    else if (codC < aC^.codC) then
      buscarCliente(aC^.hi, codC, L)
    else
      buscarCliente(aC^.hd, codC, L);
  end
  else
    L := nil;
end;

procedure imprimirComprasCliente(L: listaC);
begin
  while (L <> nil) do begin
    writeln('Código de videojuego: ', L^.dato.codV, ' Día: ', L^.dato.dia, ' Mes: ', L^.dato.mes);
    L := L^.sig;
  end;
end;

procedure ordenarVectorPorCompras(var v: vCompras);
var
  i, j, temp: integer;
begin
  for i := 1 to 11 do
    for j := i + 1 to 12 do
      if (v[i] < v[j]) then begin
        temp := v[i];
        v[i] := v[j];
        v[j] := temp;
      end;
end;

procedure imprimirVectorCompras(v: vCompras);
var
  i: integer;
begin
  writeln('Cantidad de compras por mes:');
  for i := 1 to 12 do begin
    writeln('Mes ', i, ': ', v[i], ' compras');
  end;
end;




begin
  randomize();
  aC := nil;
  inicializarVector(v);
  
  writeln('Cargando compras de videojuegos...');
  cargarArbolCompras(aC);
  
  writeln('Cargando vector de compras por mes...');
  cargarVectorCompras(aC, v);
  
  writeln('Vector de compras antes de ordenar:');
  imprimirVectorCompras(v);
  
  writeln('Ordenando vector de compras por cantidad de mayor a menor...');
  ordenarVectorPorCompras(v);
  
  writeln('Vector de compras después de ordenar:');
  imprimirVectorCompras(v);
end.
