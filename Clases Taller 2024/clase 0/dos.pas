{ACTIVIDAD 2:  Crear un nuevo archivo ProgramaVectores.pas
a) Implemente  un  módulo  CargarVector  que  cree  un  vector  de  enteros 
con  a  lo  sumo  50  valores  aleatorios.  Los  valores,  generados 
aleatoriamente (entre un mínimo y máximo recibidos por parámetro), 
deben  ser  almacenados  en  el  vector  en  el  mismo  orden  que  se 
generaron, hasta que se genere el cero.
b) Implemente un módulo ImprimirVector que reciba el vector generago 
en a) e imprima todos los valores del vector en el mismo orden que 
están almacenados. Qué cambiaría para imprimir en orden inverso?
c) Escriba  el  cuerpo  principal  que  invoque  a  los  módulos  ya 
implementados.}

program vectores;
const
    dimF=50;
type
    vector=array[1..50] of integer;

procedure inicializarVector(var v:vector);
var
    i:integer;
begin
    for i:=1 to dimf do begin
        v[i]:=0;
    end;
end;

procedure caragarVector(var v:vector; var dimL:integer);
var 
    ale,min,max:integer;
begin
    randomize;
    writeln('Elegir el rango minimo: '); readln(min);
    writeln('Elegir el rango maximo: '); readln(max);
    dimL:=0;
    repeat
        ale:=min + random(max-min +1);
        dimL:=dimL+1;
        v[dimL]:=ale;
    until(ale=0) or (dimL=dimF);
end;

procedure imprimirVector(v:vector; dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        write(v[i],' ');
    end;
end;

procedure imprimirInverso(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=dimL downto 1 do
        Write(v[i],' ');
end;

var
    v:vector;
    dimL:integer;
begin
    inicializarVector(v);
    caragarVector(v,dimL);
    imprimirVector(v,dimL);
    writeln();
    writeln();
    imprimirInverso(v,dimL);
    writeln();
    writeln();
    writeln('La dimension Logica quedo en:',dimL);
end.