program tres;

type
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;

procedure leerNumerosLista(var l: lista);
var
    num: integer;
    nuevo: lista;
begin
    num := Random(101);  { Genera un número aleatorio entre 0 y 99 }
    if num <> 0 then
    begin
        new(nuevo);
        nuevo^.dato := num;
        nuevo^.sig := nil;
        leerNumerosLista(nuevo^.sig);  { Procesa el siguiente nodo recursivamente }
        l := nuevo;  { Asigna el nuevo nodo al principio de la lista }
    end
    else
        l := nil;  { Termina la lista cuando se genera el número 0 }
end;


procedure imprimirLista(l: lista);
begin
    if l <> nil then
    begin
        Write(l^.dato, ' ');
        imprimirLista(l^.sig);
    end;
end;

function maximo(l:lista):integer;
var
    num_max: integer;
begin
    if (l<>nil) then 
    begin  //si no llego al final
        num_max := maximo(l^.sig);  //llama a la recursion
        if(l^.dato > num_max)then   //si el valor de la lista es menor al maximo,actualiza maximo
        maximo := l^.dato
    else
        maximo := num_max;   //si no es menor, mantengo el del backtracking
end
else
    maximo := -1;  //si llego al final, o la lista esta vacia, "inicializo" el maximo
end;

function minimo(l:lista):integer;
var
    num_min: integer;
begin
    if (l<>nil) then 
    begin  //si no llego al final
        num_min := minimo(l^.sig);  //llama a la recursion
        if(l^.dato < num_min)then   //si el valor de la lista es menor al minimo,actualiza minimo
            minimo := l^.dato
        else
            minimo := num_min;   //si no es menor, mantengo el del backtracking
    end
    else
        minimo := 999;  //si llego al final, o la lista esta vacia, "inicializo" el minimo
end;

var
    l: lista;
begin
    l := nil;
    leerNumerosLista(l);
    Write('Lista: ');
    writeln();
    imprimirLista(l);
    writeln();
    writeln('El numero maximo es: ',maximo(l));
    writeln();
    writeln('El numero minimo es: ',minimo(l));
end.
