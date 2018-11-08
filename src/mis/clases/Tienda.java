/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mis.clases;

import java.util.Random;

/**
 *
 * @author Wilder
 */
public class Tienda {
    
    private int codSucursal;
    private String distrito;
    
    private CajaDePago []cajas;
    private final int TAM_CAJAS = 10;
    private int ncajas;

    //Constructor con parámetro (código de sucursal, distrito) aquí el arreglo se crea vacío.
    public Tienda(int codSucursal, String distrito) {
        this.codSucursal = codSucursal;
        this.distrito = distrito;
        this.cajas = new CajaDePago[TAM_CAJAS];
        this.ncajas = 0;
    }
    
    // Método que seleccione aleatoriamente una caja e inserte un nuevo cliente a la cola,
    // en caso la caja no este habilitado debe crearla para insertar al cliente en la cola.
    
    public void insertarclienteACaja(Cliente c){
        Random ran = new Random();
        int num = ran.nextInt(TAM_CAJAS);
        //Quiero validar el caso en que la caja este llena de clientes, y el caso en que todas las cajas esten llenas
        while(num != -1){
            if(cajas[num]==null){
                CajaDePago nuevaCaja = new CajaDePago();
                cajas[num]= nuevaCaja;
            }
            
            if(!cajas[num].getClientes().colaLlena())
            cajas[num].agregarCliente(c);
        }
        
    
    
    
    
    
}
