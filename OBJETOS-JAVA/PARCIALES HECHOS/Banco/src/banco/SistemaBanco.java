/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package banco;

/**
 *Se desea representar un Banco. El Banco tiene su nombre, cantidad de empleados y la información de sus 
 * cuentas (máximo N cuentas). De cada cuenta se conoce su CBU, alias, DNI del ttular, 
 * moneda y monto. Existen dos tipos de bancos: el tradicional que posee su dirección, 
 * localidad y cantidad de cuentas en dólares abiertas y el digital que define su dirección web.
1- Genere las clases necesarias. Provea constructores para iniciar los objetos del modelo a partir 
* de la Información necesaria. En partícular, los bancos deben iniciarse para un máximo de N cuentas, 
* (inicialmente sin cuentas), el banco tradicional debe Iniciar con cantidad 0 de cuentas en dólares abiertas; 
* una cuenta debe iniciarse con monto en 0.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) agregarCuenta: Agrega una cuenta al banco. Considerar que un banco tradicional puede tener un máximo de 
* 100 cuentas abiertas en dólares, El método debe retornar true si pudo agregarse y false en caso contrario.
b) obtenerCuenta: Dado un CBU, obtener la cuenta con dicho CBU
c) depositarDinero: Dado un CBU y un monto, incrementar el monto de la cuenta en dicha cantidad.
d) puedeRecibir Tarjeta: Recibe un CBU y retorna si es posible asociarle una tarjeta de débito a la cuenta. Este
método retorna verdadero en las siguientes situaciones:
•
Si el banco es digital, la cuenta debe ser en pesos y su saldo superior a $100.000.
Si el banco es tradicional, la cuenta debe ser en dólares o pesos. Si es en dólares, con saldo
superior a USS 500. Si es en pesos con saldo superior a $70.000.
3- Realice un programa que instancie un banco tradicional y otro digital. Agregue cuentas bancarias y realice
las operaciones de los puntos 2.0 y 2.d.
 * @author maximosimonetti
 */
public class SistemaBanco {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Banco b1=new BancoDigital("www.bancodigital.com", 100);
        
        Cuenta c1=new Cuenta(123, "dameplata", "25789456", "pesos");
        Cuenta c2=new Cuenta(124, "plata", "25469456", "pesos");
        
        b1.agregarCuenta(c2);
        b1.agregarCuenta(c1);
        
        b1.depositarDinero(123, 120000);
        b1.depositarDinero(124, 25000);
        
        System.out.println(b1.obtenerCuenta(123));
        
        
    }
    
}
