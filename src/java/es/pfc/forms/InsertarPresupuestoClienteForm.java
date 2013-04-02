/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.forms;

import org.apache.struts.validator.ValidatorForm;
/**
 *
 * @author HLanga
 */
public class InsertarPresupuestoClienteForm extends ValidatorForm {
    
    private String valor;
    private int idCliente;

    /**
     * @return
     */
    public String getValor() {
        return valor;
    }

    /**
     * @param string
     */
    public void setValor(String valor) {
        this.valor = valor;
    }

    /**
     * @return
     */
    public int getIdCliente() {
        return idCliente;
    }

    /**
     * @param i
     */
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

     public InsertarPresupuestoClienteForm() {
        super();
        // TODO Auto-generated constructor stub
    }  
}
