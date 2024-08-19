program cinco;

const
    dimF = 20;  { Tamaño máximo del vector }
type
    indice = 1..dimF;
    vector = array[indice] of integer;

procedure busquedaDicotomica(v: vector; ini, fin: indice; dato: integer; var pos: indice);
var
    medio: indice;
begin
    if ini > fin then
        pos := -1  { Si ini es mayor que fin, el dato no está en el vector }
    else
    begin
        medio := (ini + fin) div 2;  { Calcula el índice del elemento medio }

        if v[medio] = dato then
            pos := medio  { Si el dato es igual al elemento medio, lo hemos encontrado }
        else if v[medio] > dato then
            busquedaDicotomica(v, ini, medio - 1, dato, pos)  { Busca en la mitad izquierda }
        else
            busquedaDicotomica(v, medio + 1, fin, dato, pos);  { Busca en la mitad derecha }
    end;
end;

var
    v: vector;
    pos, i: indice;
    dato: integer;
begin
    { Suponemos que el vector ya está ordenado }
    for i := 1 to dimF do
        v[i] := i * 2;  { Ejemplo de vector ordenado [2, 4, 6, 8, ..., 40] }

    Write('Ingrese el número que desea buscar: ');
    ReadLn(dato);

    pos := -1;  { Inicializa pos con -1 }
    busquedaDicotomica(v, 1, dimF, dato, pos);

    if pos = -1 then
        WriteLn('El número ', dato, ' no se encuentra en el vector.')
    else
        WriteLn('El número ', dato, ' se encuentra en la posición ', pos, ' del vector.');
end.
