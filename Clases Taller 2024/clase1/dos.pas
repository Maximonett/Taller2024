{2.- El administrador  de un  edificio de oficinas cuenta, en papel, 
con la información  del pago de las expensas  de dichas oficinas.  
Implementar  un programa que  invoque  a módulos  para cada uno de los 
siguientes  puntos:  
a. Genere  un vector, sin orden, con a lo sumo las 300 oficinas que administra.  
De cada oficina se ingresa  el código de identificación,  DNI del propietario  
y valor de la expensa. La lectura  finaliza  cuando se ingresa el código de identificación  -1,
el cual no se procesa. 
c. Ordene  el vector aplicando el método de selección, por código de 
identificación  de la oficina}

program dos;

const 
    dimF=300;
type
    rangoOf=1..dimF;

    oficina=record
        codigoId:Integer;
        dni:integer;
        expensas:real;
    end;
    
    vector=array [rangoOf] of oficina;

procedure leerOficina(var O:oficina);
begin
    writeln('Ingrese el codigo de Identificacion: ');readln(O.codigoId);
    if (O.codigoId<>-1) then begin
        writeln('Ingrese el DNI del propietario: ');readln(O.dni);
        writeln('Ingrese el valor de las expensas: ');readln(O.expensas);
    end;
end;    


procedure cargarVector(var v:vector; var dimL:integer);
var
    O:oficina;
    i:integer;
begin
    dimL:=0;
    leerOficina(O);
    while (O.codigoId<>-1) and (dimL<dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=O;
        leerOficina(O);
    end;
end;
{b. Ordene  el vector, aplicando el método de inserción, por código de 
identificación  de la oficina.  }

procedure OrdenacionPorInsercion(var v: vector; dimL: integer);
var 
	i, j: integer;
    actual:oficina;
begin
	for i:= 2 to dimL do begin
   	    actual:=v[i];
   		j:= i-1;
   		while (j > 0) and (v[j].codigoId > actual.codigoId) do begin
     		v[j+1]:=v[j];
     		j := j-1;
     	end;
		v[j+1] := actual;
	end;
end;

{c. Ordene  el vector aplicando el método de selección, por código de 
identificación  de la oficina}

Procedure OrdenarSeleccion ( var v: vector; dimL: integer);
var
  i, j, p: integer;
  item: oficina;   //item es del tipo del registro
begin
  for i:=1 to dimL-1 do begin {busca el mínimo v[p] entre v[i] , ..., v[N] }
    p := i;
    for j := i+1 to dimL do
      if v[j].codigoId < v[p].codigoId then   // se debe acceder al campo del registro por el cual se desea ordenar el vector
        p:=j;
    {intercambia v[i] y v[p] }
    item := v[p];
    v[p] := v[i];
    v[i] := item;
  end;
end;

procedure ImprimirVector(v:vector; dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        WriteLn('Codigo de Oficina: ',v[i].codigoId);
        WriteLn('DNI del propietario: ',v[i].dni);
        WriteLn('Valor de las expensas: $',v[i].expensas:0:2);
    end;
end;


var
    v:vector;
    dimL:integer;
begin
cargarVector(v,dimL);
WriteLn('----Lista de Oficinas en Orden de carga ----');
WriteLn('--------------------------------------------');
ImprimirVector(v,dimL);
OrdenacionPorInsercion(v,dimL);
WriteLn();
WriteLn('----Lista de Oficinas en Orden por Insercion ----');
WriteLn('-------------------------------------------------');
ImprimirVector(v,dimL);
OrdenarSeleccion(v,dimL);
WriteLn();
WriteLn('----Lista de Oficinas en Orden por Seleccion ----');
WriteLn('-------------------------------------------------');
ImprimirVector(v,dimL);


end.