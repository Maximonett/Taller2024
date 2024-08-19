{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program cuatro;

const
    dimF=20;
type
    vector=array[0..dimF] of integer;


procedure vectorVeinte(var v:vector;var dimL:integer);
var
    num:integer;
begin
    num:= Random(99)+1;
    if(dimL<dimF)then begin
        dimL:=dimL+1;
        v[dimL]:=num;
        vectorVeinte(v,dimL);
    end;
end;


procedure imprimirVectorRecursivo(v:vector;dimL:integer;i:integer);
begin
    if (i <= dimL) then begin
        Write(v[i],' ');
        imprimirVectorRecursivo(v,dimL,i+1);
    end;
end;

function maximo(v:vector;dimL:integer;i:integer):integer;
var    
    maxRestante:integer;
begin
    if (i=dimL) then
        maximo:=v[i]
    else
    begin
        maxRestante:=maximo(v,dimL,i+1);
        if v[i] > maxRestante then
            maximo:=v[i]
        else 
            maximo:=maxRestante;
    end;
end;

function sumaVector(v: vector; dimL, i: integer): integer;
begin
    if i > dimL then
        sumaVector := 0
    else
        sumaVector := v[i] + sumaVector(v, dimL, i + 1);
end;

var
    v:vector;
    dimL:integer;
    i:integer;
begin
    Randomize();
    dimL:=0;
    i:=1;
    vectorVeinte(v,dimL);
    imprimirVectorRecursivo(v,dimL,i);
    WriteLn();
    WriteLn('El maximo numero es: ',maximo(v,dimL,i));
    WriteLn();
    WriteLn('La suma de los valores del vector es: ',sumaVector(v,dimL,i));
end.
