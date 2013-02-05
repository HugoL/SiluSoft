/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.forms;

import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author Administrador
 */
public class CalcularSesionesForm extends ValidatorForm {
    
    private int idCliente;
    private float imc;
    private int kilossobran;

    /**
     * @return
     */
    public float getImc() {
        return imc;
    }

    /**
     * @param string
     */
    public void setImc(float imc) {
        this.imc=imc;
    }

    /**
     * @return
     */
    public int getKilossobran() {
        return kilossobran;
    }

    /**
     * @param i
     */
    public void setKilossobran(int kilossobran) {
        this.kilossobran=kilossobran;
    }
    
     public int getIdCliente() {
        return idCliente;
    }
       
    public void setIdCliente(int idCliente) {
        this.idCliente=idCliente;
    }

    /**
     *
     */
    public CalcularSesionesForm() {
        super();
        // TODO Auto-generated constructor stub
    }
}
