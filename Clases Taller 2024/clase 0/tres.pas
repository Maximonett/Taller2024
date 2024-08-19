{ACTIVIDAD 3:  Crear un archivo ProgramaListas.pas
a) Implemente un módulo CargarLista que cree una lista de enteros y le 
agregue valores aleatorios entre el 100 y 150, hasta que se genere el 
120.
b) Implemente un módulo ImprimirLista que reciba una lista generada en 
a) e imprima todos los valores de la lista en el mismo orden que están 
almacenados.
c) Implemente un módulo BuscarElemento que reciba la lista generada 
en a) y un valor entero y retorne true si el valor se encuentra en la lista 
y false en caso contrario.
d) Invocar  desde  el  programa  principal  a  los  módulos  implementados 
para  crear  una  lista  ordenada,  mostrar  todos  sus  elementos  y 
determinar si un valor leído por teclado se encuentra o no en la lista}

program listas;

type

lista=^nodo;
nodo=record
    dato:integer;
    sig:lista;
end;

procedure agregarAdelante(var L:lista; num:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=num;
	nue^.sig:=L;
	L:=nue;
end;

procedure agregarAtras(var L: lista; num: integer);
var
    nue, act: lista;
begin
    new(nue);
    nue^.dato := num;
    nue^.sig := nil;
    
    if (L = nil) then
        L := nue
    else begin
        act := L;
        while (act^.sig <> nil) do
            act := act^.sig;
        act^.sig := nue;
    end;
end;

procedure CargarListaInversa(var L:lista);
var
    ale:integer;
begin
    randomize;
    repeat
        ale:=(100 + random(150-100+1));
        agregarAdelante(L,ale);
    until (ale = 120);
end;

procedure CargarListaEnOrden(var L:lista); //en orden de atras a adelante
var
    ale:integer;
begin
    randomize;
    repeat
        ale:=(100 + random(150-100+1));
        agregarAtras(L,ale);
    until (ale = 120);
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

procedure RevertirLista(var L: lista);
var
    ant, act, sig: lista;
begin
    ant := nil;
    act := L;
    while (act <> nil) do begin
        sig := act^.sig;
        act^.sig := ant;
        ant := act;
        act := sig;
    end;
    L := ant;
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
    num:integer;
    L:lista;
begin
    L:=nil;
    CargarListaInversa(L);
    WriteLn('--Imprimir Lista Inversa--'); 
    // si al metodo cargar se lo
    //hace con un agregar adelante se imprime una lista INVERSA
    WriteLn();
    ImprimirLista(L);
    WriteLn();
    WriteLn();
    // si al metodo cargar se lo
    //hace con un agregar aatras se imprime una lista en elORDEN DE CARGA
    WriteLn('--Imprimir Lista en Orden--');
    CargarListaEnOrden(L);
    ImprimirLista(L);
    WriteLn('Elegir un numero para comprobar si esta en la lista: ');
    readln(num);
    writeln('La busqueda dio un resultado: ',buescarElemento(L,num));
end.