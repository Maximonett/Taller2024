{ Aerolíneas Argentinas necesita procesar los pasajes vendidos durante 2023.
 De cada pasaje se conoce el código de vuelo, código del cliente, código ciudad destino y monto del pasaje.

a) Implementar un módulo que lea pasajes, genere y retorne una estructura adecuada para 
la búsqueda por código de ciudad destino, donde para cada código de ciudad destino 
se almacenan juntos todos los pasajes (código de vuelo, código de cliente y monto del pasaje). 
La lectura finaliza con el monto de pasaje 0. Se sugiere utilizar el módulo leerPasaje().

b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino 
y retorne todos los pasajes hacia esa ciudad destino.

c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de 
ciudad de destino con mayor cantidad de pasajes vendidos.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c
}

program aerolinea;

type
	
	pasaje=record
		codV:integer;
		codC:integer;
		codD:integer;
		precio:real;
	end;
	
	pasajeL=record
		codV:integer;
		codC:integer;
		precio:real;
	end;
	
	listaP=^nodo;
	nodo=record
		dato:pasajeL;
		sig:listaP;
	end;
	
	arbolP=^nodoP;
	nodoP=record
		codD:integer;
		ListaPasajes:listaP;
		hi:arbolP;
		hd:arbolP;
	end;
var	
	vPrecio:array[1..10] of real= (100.00,150.00,200.00,300.00,0.00,299.99,599.98,1050.50,1165.90,2000.00);
	
{a) BUSQUEDA POR CODIGO DE DESTINO / LISTA :CODDIGO DE VUELO,CODIGO DE CLIENTE,PRECIO PASAJE
LA LECTURA FINALIA CON PRECIO = 0}

procedure leerAleatorio(var p:pasaje);
begin
	p.precio:=vPrecio[random(10)+1];
	if (p.precio<>0) then begin
		p.codV:=random(200)+100;
		p.codC:=random(200)+100;
		p.codD:=random(200)+100;
	end;
end;


procedure agregarAdelante(var L:listaP; p:pasajeL);
var
	nue: listaP;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=L;
	L:=nue;
end;

procedure agregarArbolPasajes(var aP:arbolP;destino:integer;p:pasaje);
var
	pL:pasajeL;
begin
	if (aP=nil) then begin
		new(aP);
		aP^.codD:=destino;
		aP^.ListaPasajes:=nil;
		aP^.hi:=nil;
		aP^.hd:=nil;
	end;
	
	{Convertir pasaje en pasajeL}
	pL.codV:=p.codV;
	pL.codC:=p.codC;
	pL.precio:=p.precio;
	
	{--------------------------}
	if (destino =aP^.codD) then
		agregarAdelante(aP^.ListaPasajes,pL)
	else if(destino<aP^.codD) then
		agregarArbolPasajes(aP^.hi,destino,p)
	else
		agregarArbolPasajes(aP^.hd,destino,p);
end;


procedure cargarArbolesPasajes(var aP:arbolP);
var
	p:pasaje ;
begin
	leerAleatorio(p);
	while (p.precio<>0) do begin
		agregarArbolPasajes(aP,p.codD,p);
		leerAleatorio(p);
	end;
end; 

procedure imprimiLista(L:listaP);
begin
	while (L<>nil) do begin
		writeln('Codigo de Vuelo: ',L^.dato.codV,' Codigo de Cliente: ',L^.dato.codC,' Precio del pasaje: $',L^.dato.precio:0:2);
		L:=L^.sig;
	end;
end;

procedure imprimirArbol(aP:arbolP);
begin
	if(aP<>nil)then begin
		imprimirArbol(aP^.hi);
		writeln('Vuelos con codigo de ciudad: ',aP^.codD);
		imprimiLista(aP^.ListaPasajes);
		imprimirArbol(aP^.hd);
	end;
end;

{b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino 
y retorne todos los pasajes hacia esa ciudad destino.}

procedure pasajesDestino(aP:arbolP;destino:integer);
begin
	if (aP<> nil) then begin
		if (aP^.codD=destino) then begin
			writeln('Pasajes Destino: ',destino);
			imprimiLista(aP^.ListaPasajes);
		end
		else if (destino< aP^.codD) then
			pasajesDestino(aP^.hi,destino) //no olvidar subarboles!!!!!
		else 
			pasajesDestino(aP^.hd,destino)
	end
	else
		writeln('NO hay pasajes para ese destino');
end;

{c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de 
ciudad de destino con mayor cantidad de pasajes vendidos.}

procedure contarPasajes(L:listaP; var cant:integer);
begin
	while(L<>nil) do begin
		cant:=cant+1;
		L:=L^.sig;
	end;
end;

procedure mayorCantidadPasajes(aP: arbolP; var maxDestino:integer; var maxCant: integer);
var
    cant: integer;
begin
    if (aP <> nil) then begin
        cant := 0;  // Inicializamos el contador para cada nodo.
        contarPasajes(aP^.ListaPasajes, cant);
        
        if (cant > maxCant) then begin
            maxCant := cant;
            maxDestino := aP^.codD;
        end;
        
        // Recursión en los subárboles.
        mayorCantidadPasajes(aP^.hi, maxDestino, maxCant);
        mayorCantidadPasajes(aP^.hd, maxDestino, maxCant);
    end;
end;

function encontrarCiudadMaxPasajes(aP: arbolP): integer;
var
    maxDestino, maxCant: integer;
begin
    maxCant := -1;  // Iniciar en -1 para poder hacer la comparación.
    maxDestino := -1;  // Iniciar con un valor inválido.
    
    mayorCantidadPasajes(aP, maxDestino, maxCant);
    
    encontrarCiudadMaxPasajes := maxDestino;  // Retornar el código de la ciudad con más pasajes.
end;

function encontrarCantidadMaxPasajes(aP: arbolP): integer;
var
    maxDestino, maxCant: integer;
begin
    maxCant := -1;  // Iniciar en -1 para poder hacer la comparación.
    maxDestino := -1;  // Iniciar con un valor inválido.
    
    mayorCantidadPasajes(aP, maxDestino, maxCant);
    
    encontrarCantidadMaxPasajes:= maxCant;  // Retornar el código de la ciudad con más pasajes.
end;


var
	aP:arbolP; destino:integer; maxDestino:integer; maxCant:integer;
begin
	randomize();
	aP:=nil;
	cargarArbolesPasajes(aP);
	imprimirArbol(aP);
	writeln('Elegir un codigo de destino para ver los pasajes disponibles: ');
	readln(destino);
	pasajesDestino(aP,destino);
	maxDestino := encontrarCiudadMaxPasajes(aP);
    writeln('El codigo de destino con mas pasajes es ', maxDestino);
    maxCant:=encontrarCantidadMaxPasajes(aP);
    writeln('La cantidad de pasajes son: ', maxCant);
end.
	









