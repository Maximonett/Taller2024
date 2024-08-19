{ACTIVIDAD 4: Crear un archivo ProgramaListasOrdenadas.pas
a) Implemente  un  módulo  CargarListaOrdenada  que  cree  una  lista  de 
enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se 
genere el 120. Los valores dentro de la lista deben quedar ordenados 
de menor a mayor. 
b) Reutilice el módulo ImprimirLista que reciba una lista generada en a) e 
imprima  todos  los  valores  de  la  lista  en  el  mismo  orden  que  están 
almacenados.
c) Implemente un módulo BuscarElementoOrdenado que reciba la lista 
generada en a) y un valor entero y retorne true si el valor se encuentra 
en la lista y false en caso contrario.
d) Invocar  desde  el  programa  principal  a  los  módulos  implementados 
para  crear  una  lista  ordenada,  mostrar  todos  sus  elementos  y 
determinar si un valor leído por teclado se encuentra o no en la lista}

program cuatro;

type
    lista=^nodo;

    nodo=record
        dato:integer;
        sig:lista;
    end;

procedure agregarOrdenado(var L:lista;num:integer);
var
    nue,act,ant:lista;
begin
    new(nue);
    nue^.dato:=num;
    act:=L; ant:=L; //{LOS UBICO AL INICIO DE LA LISTA}
    while (act<> nil) and (num > act^.dato) do begin // (> de menor a mayor) y (< de mayor a menor)
        ant:=act; act:=act^.sig;
    end;
    if (act=ant) then //{AL INICIO DE LA LISTA}
        L:=nue
    else //{AL MEDIO O AL FINAL}
        ant^.sig:=nue;
    nue^.sig:=act;    
end;

procedure cargarListaOrdenada(var L:lista);
var
    ale:integer;
begin
    randomize;
    repeat
        ale:=100 + random(150-100+1);
        agregarOrdenado(L,ale);
    until(ale=120);
end;

procedure ImprimirLista(L:lista);
var
    cantNodos:integer;
begin
    while (L<>nil) do begin
        write('-',L^.dato,'-');
        cantNodos:=cantNodos+1;
        L:=L^.sig;
    end;
    WriteLn();
    WriteLn('La cantidad de nodos es: ',cantNodos);
end;

function buescarElemento(L:lista; num:integer):boolean;
begin
    buescarElemento:=false;
    while (L<>nil) and (buescarElemento<>true) do begin
        if (L^.dato=num)then 
            buescarElemento:=true
        else 
            L:=L^.sig;
    end;
end;

var
    L:lista;
    num:integer;
begin
    L:=nil;
    cargarListaOrdenada(L);
    WriteLn();
    WriteLn('----Lista Ordenada----');
    WriteLn('**********************');
    ImprimirLista(L);
    WriteLn('Elegir un numero para comprobar si esta en la lista: ');
    readln(num);
    writeln('La busqueda dio un resultado: ',buescarElemento(L,num));
end.