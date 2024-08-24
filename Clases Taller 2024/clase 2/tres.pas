{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}


program tres;

const   
    dimF=20;
    Vmin=300;
    Vmax=1550;
Type
    indice=integer;
    vector=array[1..dimF] of integer;

procedure vectorRandom(var v: vector; var dimL: integer);
var
    ale: integer;
begin
    if dimL < dimF then begin
        ale := Vmin + random(Vmax - Vmin + 1);
        v[dimL] := ale;
        dimL := dimL + 1;
        vectorRandom(v, dimL);
    end;
end;

{b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)}
procedure ordenarSeleccion(var v:vector;dimL:integer);
var
    i,j,p,item:integer;
begin
    for i:=1 to dimL-1 do begin
        p:=i;
        for j:=i+1 to dimL do
            if v[j]<v[p] then //ordena de menor a mayor
                p:=j;
        {intercambia v[i] por v[p]}
        item:=v[p];
        v[p]:=v[i];
        v[i]:=item;
    end;
end;

{c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

procedure busquedaDicotomica(v:vector;ini,fin:indice; dato:integer; var pos:indice);
var 
    medio:indice;
begin
    if (ini>fin)then
        pos:=-1 //no se encuentra el dato en el vector
    else begin
        medio:=(ini + fin)div 2; //calcular la posicion media
        
        if (v[medio]=dato) then
            pos:=medio //si el dato se encuentra, se asigna la posicion
        else if (v[medio]<dato) then
            busquedaDicotomica(v,medio+1,fin,dato,pos) // busca en la mitad superior
        else 
            busquedaDicotomica(v,ini,medio-1,dato,pos); //busca en la mitad inferior
    end;
end;


procedure imprimir(v:vector; dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        writeln('posicion ',i,': ',v[i]);
    end;    
end;

procedure inicializarVector(var v:vector);
var
    i:integer;
begin
    for i:=1 to dimF do
        v[i]:=0;
end;

//Programa Principal

var
    v:vector;
    dimL:integer;
    pos:integer;
    ini:indice;
    fin:indice;
    dato:Integer;
begin
    randomize;
    dimL:=0;
    {inicializarVector(v);}
    vectorRandom(v,dimL);
    writeln('----------------');
    WriteLn('Vector sin orden');
    writeln('----------------');
    imprimir(v,dimL);
    ordenarSeleccion(v,dimL);
    writeln('-----------------------------');
    WriteLn('Vector ordenado por seleccion');
    writeln('-----------------------------');
    imprimir(v,dimL);
    writeln('-----------------------------');
    WriteLn('------Busqueda dicotomica----');
    writeln('-----------------------------');
    {WriteLn('Elige un rango inferior: ');ReadLn(ini);
    WriteLn('Elige un rango superior: ');ReadLn(fin);}
    ini:=1;
    fin:=20;
    WriteLn('Elige un un valor a encontrar: ');ReadLn(dato);
    pos:=-1;
    busquedaDicotomica(v,ini,fin,dato,pos);
    if (pos<>-1) then
        WriteLn('El dato se encuentra en la posicion: ',pos)
    else 
        WriteLn('El dato no se ecuentra en el vector.');
end.