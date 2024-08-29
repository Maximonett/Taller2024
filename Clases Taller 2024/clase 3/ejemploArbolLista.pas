{Realizar un arbol que lea y almacene correos electronicos.
La lectura finaliza con codigo de cliente 0.. 
De cada cliente se lee ID, su direccion de correo y todo lo que refiere al mensaje..
Toda la info debe quedar agrupada por cliente.
Leer un codigo de cliente e informar la cantidad de correos sin leer.
Leer una direccon de correo e informar la cantidad de correos enviado pdesde dicha dir. }

program arbolLista;

const
    maxCod = 1000;

type
    rangoCod = 0..maxCod;

    mensaje = record
        emisor: string;
        texto: string;
        asunto: string;
        fecha: string;
        leido: boolean;
    end;

    cliente = record
        cod: rangoCod;
        email: string;
    end;

    mensajeLeido = record
        msj: mensaje;
        cli: cliente;
    end;

    lista = ^nodo;
    nodo = record
        dato: mensaje;
        sig: lista;
    end;

    datoCliente = record
        cli: cliente;
        mensajes: lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato: datoCliente;
        hi: arbol;
        hd: arbol;
    end;

var
    vFechas: array[0..9] of string = (
        '1 de marzo', '3 de octubre', '10 de enero', '11 de agosto', 
        '3 de noviembre', '2 de junio', '22 de febrero', '6 de julio', 
        '7 de enero', '21 de diciembre'
    );

    vTextos: array[0..9] of string = (
        'Hola, ¿qué tal?', 'Buenos días.', '¿Cómo estás?', '¡Mucho gusto!', 
        'Hasta luego.', 'Buenas tardes.', '¿Qué haces?', 'Nos vemos pronto.', 
        'Buenas noches.', '¡Adiós!'
    );

    vEmails: array[0..9] of string = (
        'user1@example.com', 'contact@domain.com', 'info@company.com', 
        'support@service.org', 'sales@business.net', 'admin@website.com', 
        'no-reply@notification.com', 'newsletter@news.org', 
        'feedback@survey.com', 'jobs@careers.com'
    );

    vAsuntos: array[0..9] of string = (
        'Important Update', 'Meeting Reminder', 'Invoice Attached', 
        'Welcome to Our Service', 'Account Verification', 
        'Password Reset Request', 'Newsletter - August Edition', 
        'Event Invitation', 'Your Order Confirmation', 'Feedback Request'
    );

procedure leerAleatorio(var m: mensajeLeido);
begin
    m.cli.cod := random(maxCod);  // Genera un código de cliente entre 1 y 1000
    if (m.cli.cod <> 0) then begin
        m.cli.email := vEmails[random(10)];
        m.msj.emisor := vEmails[random(10)];
        m.msj.texto := vTextos[random(10)];
        m.msj.asunto := vAsuntos[random(10)];
        m.msj.fecha := vFechas[random(10)];
        m.msj.leido := random(2) = 1;  // Genera un valor booleano
    end;
end;

procedure agregaAdelante(var L: lista; m: mensaje);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := m;
    nue^.sig := L;
    L := nue;
end;

procedure agregarArbol(var a: arbol; m: mensajeLeido);
var
    aux: arbol;
begin
    if (a = nil) then begin
        new(aux);
        aux^.dato.cli := m.cli;
        aux^.dato.mensajes := nil;
        agregaAdelante(aux^.dato.mensajes, m.msj);
        aux^.hi := nil;
        aux^.hd := nil;
        a := aux;
    end
    else begin
        if (a^.dato.cli.cod = m.cli.cod) then
            agregaAdelante(a^.dato.mensajes, m.msj)
        else if (a^.dato.cli.cod > m.cli.cod) then
            agregarArbol(a^.hi, m)
        else
            agregarArbol(a^.hd, m);
    end;
end;

procedure cargarArbol(var a: arbol);
var
    m: mensajeLeido;
begin
    leerAleatorio(m);
    if (m.cli.cod <> 0) then begin
        agregarArbol(a, m);
        cargarArbol(a);
    end;
end;



procedure mostrarLista(L: lista);
begin
    while (L <> nil) do begin
        writeln('Emisor: ', L^.dato.emisor);
        writeln('Texto: ', L^.dato.texto);
        writeln('Asunto: ', L^.dato.asunto);
        writeln('Fecha: ', L^.dato.fecha);
        writeln('Leído: ', L^.dato.leido);
        writeln('-------------------------');
        L := L^.sig;
    end;
end;

procedure mostrarArbol(a: arbol);
begin
    if (a <> nil) then begin
        mostrarArbol(a^.hi);  // Mostrar subárbol izquierdo
        writeln('Código de cliente: ', a^.dato.cli.cod);
        writeln('Dirección de correo: ', a^.dato.cli.email);
        writeln('Lista de mensajes:');
        mostrarLista(a^.dato.mensajes);  // Mostrar lista de mensajes
        mostrarArbol(a^.hd);  // Mostrar subárbol derecho
    end;
end;


var
    a: arbol;

begin
    randomize;  // Inicializa la generación de números aleatorios
    a := nil;
    cargarArbol(a);
    mostrarArbol(a);
end.




		
		
