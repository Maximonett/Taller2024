{2.- Escribir un programa que:}

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
        WriteLn('Fin de la Lista.')
    else begin
        writeln(L^.dato);
        imprimirListaOrdendeCarga(L^.sig);
    end;
end;

{c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.}

procedure imprimirListaOrdenInverso(L:lista);
begin
    if(L=nil) then
        WriteLn('Fin de la Lista.')
    else begin
        imprimirListaOrdenInverso(L^.sig);
        writeln(L^.dato);
    end;
end;

{d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.}

function Minimo(var L:lista):integer;
var
    min:integer;
begin
    if (L=nil) then
        Minimo:=999
    else begin
        min:=Minimo(L^.sig);
        if (L^.dato<min) then 
            Minimo:=L^.dato
        else 
            Minimo:=min;
    end; 
end;

{e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

function Buscar(L:lista; valor:integer):boolean;
begin
    if (L=nil) then
        Buscar:=false
    else if (L^.dato=valor) then 
        Buscar:=true
    else 
        Buscar:=Buscar(L^.sig,valor);
end;


var
    L:lista;
    valor:integer;
    encontro:boolean;
begin
    randomize();
    L:=Nil;
    cargarLista(L);
    writeln('Imprimir Lista en el orden de la carga');
    imprimirListaOrdendeCarga(L);
    writeln('Imprimir Lista en el orden Inverso a la carga');
    imprimirListaOrdenInverso(L);
    WriteLn('El minimo es : ', Minimo(L));
    Writeln('---------------------------------');
    Write('Elija un numero para comprobar si se encuentr en la lista: ');
    ReadLn(valor);
    encontro:=Buscar(L,valor);
    if (encontro) then
        WriteLn('El valor buscado se encuentra en la lista')
    else
        writeln('Lo siento, el valor buscado no se encuentra en la lista.');
end.