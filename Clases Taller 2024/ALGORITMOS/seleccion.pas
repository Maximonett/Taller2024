procedure seleccion(var v:vector; dimL:indice);
var
    i,j,pos:integer; item:TipoElemen;

begin
    for i:=1 to dimL-1 do begin {buesca el minimo y gaurda en pos la posicion}
        pos:=i;
        for j:=i+1 to dimL do
            if (v[j].campo< v[pos].compo) then
                // (< ascendente) (>descendente)
                pos:=j;
            item:=v[pos];
            v[pos]:=v[i];
            v[i]:=item;
    end;
end;