{2.- Escribir un programa que:
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program dos;

const
    min=100;
    max=200;

type

    lista=^nodo;
    nodo=record
        dato:integer;
        sig:lista;
    end;

{a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.}

procedure agregarAdelante(var L:lista;num:integer);
var
    nue:lista;
begin
    New(nue);
    nue^.dato:=num;
    nue^.sig:=L;
    L:=nue;
end;

procedure cargarLista(var L:lista);
var
    num:integer;
begin
    num:=min + random(max-min +1);
    if (num<>100) then begin
        agregarAdelante(L,num);
        cargarLista(L);
    end;
end;

{b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.}

procedure imprimirListaOrdendeCarga(L:lista);
begin
    if(L=nil) then
        WriteLn('La lista esta vacia.')
    else begin
        writeln(L^.dato);
        imprimirListaOrdendeCarga(L^.sig);
    end;
end;

var
    L:lista;
begin
    randomize();
    L:=Nil;
    cargarLista(L);
    imprimirListaOrdendeCarga(L);
end.