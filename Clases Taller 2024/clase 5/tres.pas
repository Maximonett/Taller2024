{3.Un supermercado requiere el procesamiento de sus productos. 
De cada producto se conoce código, rubro (1..10), stock y precio unitario. 
Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. 
A su vez, para cada rubro, se requiere que la búsqueda de un producto por 
código sea lo más eficiente posible. El ingreso finaliza con el código 
de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), 
un rubro y un código de producto y retorne si dicho código existe o no para ese 
rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, 
para cada rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos 
valores ingresados}

program tres;

const   
    dimF=10;

type
	rangoRubro=1..10;
	
	producto=record
		cod:integer;
		rubro:rangoRubro;
		stock:integer;
		precioU:real;
	end;
	
	arbolP=^nodoP;
	nodoP=record
		dato:producto;
		hi:arbolP;
		hd:arbolP;
	end;
	
	vectorDeArbol=array[rangoRubro] of arbolP;
var
	vPrecios:array[1..5] of real=(30.55,2.99,1.99,90.99,100.32);

procedure leerAleatorio(var p:producto);
begin
	p.cod:=random(20);
	if (p.cod<>0) then begin
		p.rubro:=random(10)+1;
		p.stock:=random(200)+1;
		p.precioU:=vPrecios[random(5)];
	end;
end;

procedure agregarProducto(var a:arbolP;p:producto);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:=p;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (p.cod< a^.dato.cod) then
		agregarProducto(a^.hi,p)
	else 
		agregarProducto(a^.hd,p);
end;


procedure inicializarVector(var v:vectorDeArbol);
var 
	i:rangoRubro;
begin
	for i:=1 to dimF do 
		v[i]:=nil;
end;

procedure cargarVectorDeArboles(var v:vectorDeArbol);
var
	p:producto;
begin
	leerAleatorio(p);
	while (p.cod<>0) do begin
		agregarProducto(v[p.rubro],p); //cada lugar en el vector posee un arbol
		leerAleatorio(p);
	end;
end;

{b) Implementar un módulo que reciba la estructura generada en a), 
un rubro y un código de producto y retorne si dicho código existe o no para ese 
rubro.}

function existe(a:arbolP;codigo:integer):boolean;
begin
	if (a=nil) then 
		existe:=false
	else if (a<>nil) and (codigo=a^.dato.cod) then
		existe:=true
	else if (codigo<a^.dato.cod) then
		existe:=existe(a^.hi,codigo)
	else
		existe:=existe(a^.hd,codigo);
end;

{c) Implementar un módulo que reciba la estructura generada en a), y retorne, 
para cada rubro, el código y stock del producto con mayor código.}

function mayorCodigo(a:arbolP):integer;

begin
	if (a=nil) then 
		mayorCodigo:=-1 
	else if (a^.hd=nil) then
		mayorCodigo:=a^.dato.cod
	else
		mayorCodigo:=mayorCodigo(a^.hd);
end;

function stockMayorCodigo(a:arbolP): integer;
begin
	if (a=nil) then
		stockMayorCodigo:=-1
	else if (a^.hd=nil) then
		stockMayorCodigo:=a^.dato.stock
	else
		stockMayorCodigo:=stockMayorCodigo(a^.hd);
		
end;


procedure imprimirPorRubro(v:vectorDeArbol);
var
	i:rangoRubro;
begin
	for i:=1 to dimF do begin
		writeln('Rubro ',i,' Codigo: ',mayorCodigo(v[i]),' Stock: ',stockMayorCodigo(v[i]));
	end;
end;


{d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos 
valores ingresados}

function cantidad(a:arbolP;ini,fin:integer):integer;
begin
	if (a=nil) then //caso base
		cantidad:=0
	else if (a^.dato.cod>=ini) and (a^.dato.cod<=fin)then //entre  rango
		cantidad:= 1+ cantidad(a^.hi,ini,fin) + cantidad(a^.hd,ini,fin)
	else if (a^.dato.cod < ini) then //menor que el rango
		cantidad:=cantidad(a^.hd,ini,fin) 
	else  // mayor que el rango
		cantidad:=cantidad(a^.hi,ini,fin);
end;

procedure cantidadPrductosEntre(v:vectorDeArbol;ini,fin:integer);
var
	i:rangoRubro;
begin
	for i:=1 to dimF do begin
		writeln('Rubro Nº ',i,' cantidad de productos entre ',ini,' y ',fin,' : ',cantidad(v[i],ini,fin));
	end;
end;


var
	v:vectorDeArbol;
	rubro:rangoRubro;
	codigo:integer;
	encuentro:boolean;
	ini, fin:rangoRubro;
begin
	randomize;
	inicializarVector(v);
	cargarVectorDeArboles(v);
	writeln('Elija un rubro y un codigo: ');
	readln(rubro);
	readln(codigo);
	encuentro:=existe(v[rubro],codigo);
	if (encuentro) then
		writeln('El producto del rubro ',rubro,' y codigo ',codigo,' se encuentra en la estructura.')
	else
		writeln('El producto No se encuentra en la estructura.');
	writeln();
	imprimirPorRubro(v);
	writeln('Elegir un rango de codigos para contar los producos.');
	readln(ini);
	readln(fin);
	cantidadPrductosEntre(v,ini,fin);
end.


	
	
