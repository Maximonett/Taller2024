{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}

program dos;

const
    dimF=50;

type
    vector = array [1..dimF] of integer;

procedure leerNumerosRecursiva(var v:vector; var dimL:integer);
var
    num:integer;
begin
    if dimL<dimF then
    begin
    Read(num);
    if (num<>0) then
        begin
            dimL:=dimL+1;
            v[dimL]:=num;
            leerNumerosRecursiva(v,dimL);
        end;
    end;
end;

procedure imprimrRecursivamente(v:vector;dimL:integer;i:integer);
begin
    if i<=dimL then
    begin
        write(v[i],'  ');
        imprimrRecursivamente(v,dimL,i+1);    
    end;
end;


var 
    v:vector;
    dimL:integer;
    i:integer;

begin
    i:=1;
    dimL:=0;
    leerNumerosRecursiva(v,dimL);
    imprimrRecursivamente(v,dimL,i);
end.

