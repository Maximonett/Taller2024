
function busquedaLinealRecursiva(v: vOficinas; cod, pos, dimL: integer): integer;
begin
    if (pos > dimL) then
        busquedaLinealRecursiva := -1  {Si llegamos al final de la lista sin encontrar el código, devolvemos -1}
    else if v[pos].cod = cod then
        busquedaLinealRecursiva := pos  {Si encontramos el código, devolvemos la posición}
    else
        busquedaLinealRecursiva := busquedaLinealRecursiva(v, cod, pos + 1, dimL);  {Si no, seguimos buscando recursivamente}
end;
