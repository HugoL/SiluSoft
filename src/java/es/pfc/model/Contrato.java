/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author ko
 */
public class Contrato implements Serializable{
    private int idContrato;
    private int idCliente;
    private String valor;  
    private Date fecha;
    
    public Contrato(){
        
    }
    
    public int getIdContrato(){
        return idContrato;
    }
    
    public void setIdContrato(int idContrato){
        this.idContrato=idContrato;
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
