function busquedaDicotomica(v:vOficinas;cod,dimL:Integer):Integer;
var
    izq,der,medio:Integer;
begin
    izq:=0; //inicializa el limite inferior del rango de busqueda
    der:=dimL-1;    // inicializa el limite superior de busqueda

    while izq<=der do begin
        medio:=(izq+der)div 2;
        if (v[medio].cod=cod) then
            busquedaDicotomica:=medio
        else if v[medio].cod<cod then
            izq:=medio + 1 //si el codigo es mayor 
        else
            der:=medio-1;// si el codigo es menor
    end;
    if  izq > der then 
        busquedaDicotomica:=-1; // si no encuentra,retorna -1
end;