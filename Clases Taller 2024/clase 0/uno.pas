{ACTIVIDAD 1 (continuación) 
Taller de Programación }

program ProgramaNumAleatorio;

var ale: integer;

begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
     ale := random (100); {devuelve un valor aleatorio en el intervalo 0 a 99}

     writeln ('El numero aleatorio generado es: ', ale);

	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.

{c) Modifique el programa para que imprima 20 números 
aleatorios.}

program veinteNumAle;

var 
    ale:integer;
    i:integer;
begin
    randomize;
    
    for i:=1 to 20 do begin
        ale:=random(100);
        Write(ale,' ');
    end;
end.

{d) Modifique el programa para que imprima N números 
aleatorios  en  el  rango  (A,B),  donde  N,  A  y  B  son 
números enteros que se leen por teclado.}

program d;

var
    N:integer;
    A:integer;
    B:integer;
    ale:integer;
    i:integer;
begin
    randomize;
    WriteLn('Elegir la cantidad de numeros que desea generar: ');readln(N);
    WriteLn('Elegir el rango inferio: ');readln(A);
    WriteLn('Elegir el rango superior: ');readln(B);

    writeln('----------------------------------------------');
    writeln('----------Los numeros generados son ----------');
    for i:=1 to N do begin
        ale:= A + random(B-A +1);
        write(ale,'-');
    end;
end.

{e)  Modifique  el  programa  para  que  imprima  números 
aleatorios en el rango (A,B) hasta que se genere un 
valor igual a F, el cual no debe imprimirse. F, A y B 
son números enteros que se leen por teclado.}

program E;

var 
    A,B,F,i,ale:integer;

begin
    randomize;
    WriteLn('Elegir el numero en el que se finaliza: ');readln(F);
    WriteLn('Elegir el rango inferio: ');readln(A);
    WriteLn('Elegir el rango superior: ');readln(B);
    
    writeln('----------------------------------------------');
    writeln('----------Los numeros generados son ----------');
    ale:= A + random(B-A +1);
    while (ale <> F) do begin
        write(ale,'-');
        ale:= A + random(B-A +1);
    end;

end.
