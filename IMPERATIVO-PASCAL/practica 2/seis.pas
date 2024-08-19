program seis;

procedure DecimalABinarioRecursivo(n: integer);
begin
    if n < 2 then
        Write(n)  { Si el número es menor a 2, lo escribimos directamente (0 o 1) }
    else
    begin
        DecimalABinarioRecursivo(n div 2);  { Llamada recursiva con la división entera por 2 }
        Write(n mod 2);  { Escribe el dígito binario correspondiente }
    end;
end;

var
    num: integer;
begin
    repeat
        Write('Ingrese un número (0 para terminar): ');
        ReadLn(num);
        if num <> 0 then
        begin
            Write('El equivalente binario de ', num, ' es: ');
            DecimalABinarioRecursivo(num);
            WriteLn;  { Nueva línea para la siguiente salida }
        end;
    until num = 0;
    WriteLn('Programa terminado.');
end.
