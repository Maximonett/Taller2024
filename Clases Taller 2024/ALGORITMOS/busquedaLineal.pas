function busquedaLineal(v: vOficinas; cod, pos, dimL: integer): integer;
begin
    while (pos <= dimL) do begin
        if v[pos].cod = cod then
            busquedaLineal := pos;  {Retorna la posición cuando encuentra el código}
        pos := pos + 1;  {Avanza a la siguiente posición}
    end;
    busquedaLineal := -1;  {Si no encuentra el código, devuelve -1}
end;