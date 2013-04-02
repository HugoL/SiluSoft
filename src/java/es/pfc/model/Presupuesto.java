/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.model;

import java.sql.Date;

/**
 *
 * @author ko
 */
public class Presupuesto {
    private int idPresupuesto;
    private int idCliente;
    private String valor;  
    private Date fecha;
    
    public Presupuesto(){
        
    }
    
    public int getIdPresupuesto(){
        return idPresupuesto;
    }
    
    public void setIdPresupuesto(int idPresupuesto){
        this.idPresupuesto = idPresupuesto;
    }
    
    public int getIdCliente(){
        return idCliente;
    }
    
    public void setIdCliente(int idCliente){
        this.idCliente=idCliente;
    }
    
    public String getValor(){
        return valor;
    }
    
    public void setValor(String valor){
        this.valor=valor;
    }
    
    public Date getFecha(){
        return fecha;
    }
    
    public void setFecha(Date fecha){
        this.fecha=fecha;
    }
}
