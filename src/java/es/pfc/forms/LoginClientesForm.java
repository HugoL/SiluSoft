/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.forms;

import es.pfc.model.Usuario;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author ko
 */
public class LoginClientesForm extends ValidatorForm {
    
   private String identificador = null;
    private String password = null;  
  
     Usuario usuario = new Usuario();
     
    public String getIdentificador(){
        return identificador;
    }
    
    public void setIdentificador(String identificador){
        this.identificador=identificador;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String Password){
        this.password=Password;
    }
    
    public Usuario getUsuario(){
        
        return usuario;
    }
    
    public void setUsuario(Usuario usuario){
        this.usuario=usuario;
    }
   

    /**
     *
     */
    public LoginClientesForm() {
        super();
        // TODO Auto-generated constructor stub
    }

}
