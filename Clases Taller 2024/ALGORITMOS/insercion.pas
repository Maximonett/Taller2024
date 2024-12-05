type
    indice=1..100;

procedure insercion(var v:vector;dimL:indice);
var
    i,j:indice; actual:TipoElemen;
begin
    for i:=2 to dimL do begin
        actual:=v[i]; j:=i-1;
        while (j>0) and  (v[j].campo> actual.campo) do begin
            //(>ascendente) (<descendente)
            v[j+1]:=v[j]; j:=j-1;
        end;
        v[j+1]:=actual;
    end;
end;