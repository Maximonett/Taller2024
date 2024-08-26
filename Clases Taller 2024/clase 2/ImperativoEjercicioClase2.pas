{1.- Implementar un programa que invoque a los siguientes m�dulos.
a. Un m�dulo recursivo que retorne un vector de a lo sumo 15 n�meros enteros 
�random� mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
b. Un m�dulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un m�dulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un m�dulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores 
pares contenidos en el vector.
e. Un m�dulo recursivo que reciba el vector generado en a) y devuelva el m�ximo valor del vector.
f. Un m�dulo recursivo que reciba el vector generado en a) y un valor y devuelva 
verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un m�dulo que reciba el vector generado en a) e imprima, para cada 
n�mero contenido en el vector, sus d�gitos en el orden en que aparecen en el n�mero. 
Debe implementarse un m�dulo recursivo que reciba el n�mero e imprima lo pedido. 
Ejemplo si se lee el valor 142, se debe imprimir 1  4  2}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var 
    valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     
{Esta manera imprime de menor a mayor ya que se usa la llamada recursiva primero}
procedure ImprimirVectorRecursivo(v: vector; dimL: integer);
begin
    if (dimL > 0) then begin
        ImprimirVectorRecursivo(v, dimL - 1);
        writeln('-Elemento-', dimL, ': ', v[dimL]);
    end;
end;
{ Esta manera imprime de manera inversa de mayor a menor ya que se imprime antes de la llamada recursiva}
procedure ImprimirVectorRecursivoInversa(v: vector; dimL: integer);
begin
    if (dimL > 0) then begin
        writeln('-Elemento-', dimL, ': ', v[dimL]);
        ImprimirVectorRecursivoInversa(v, dimL - 1);
    end;
end;


    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos <= dimL)  then //cado base 
        SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else 
        SumarRecursivo:=0  
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function ObtenerMaximo(v: vector; dimL: integer): integer;
begin
    if (dimL = 1) then
        ObtenerMaximo := v[dimL]  // Caso base: el máximo de un solo elemento es él mismo
    else begin
        // Comparamos el último elemento con el máximo de los anteriores
        if (v[dimL] > ObtenerMaximo(v, dimL - 1)) then
            ObtenerMaximo := v[dimL]
        else
            ObtenerMaximo := ObtenerMaximo(v, dimL - 1);
    end;
end;
    
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
    If (dimL=0) then
        BuscarValor:=false// Caso base: si llegamos al final del vector sin encontrar el valor
    else if (v[dimL]=valor)then
        BuscarValor:=true
    else
        BuscarValor:=BuscarValor(v,dimL-1,valor); // Buscar en el resto del vector
end; 

procedure ImprimirDigitosNumero(n: integer);
begin
    if (n <> 0) then begin
        ImprimirDigitosNumero(n div 10);  // Llama recursivamente con el número sin el último dígito
        writeln(n mod 10);  // Imprime el último dígito
    end;
end;

procedure ImprimirDigitos(v: vector; dimL: integer);
var
    i: integer;
begin
    for i := 1 to dimL do begin
        writeln('Número ', v[i], ':');
        if (v[i] = 0) then
            writeln(0)  // Si el número es 0, imprimimos 0 directamente
        else
            ImprimirDigitosNumero(v[i]);
    end;
end;
 

var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin
  randomize();
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                       writeln('--------');
                       ImprimirVectorRecursivo (v, dimL);
                       writeln('--------');
                       ImprimirVectorRecursivoInversa(v,dimL);
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.