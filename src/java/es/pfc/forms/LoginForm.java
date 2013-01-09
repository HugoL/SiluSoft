/*
 SiluSoft
    Copyright (C) 2012  Hugo Langa Roy

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package es.pfc.forms;

import es.pfc.model.Usuario;
import org.apache.struts.validator.ValidatorForm;


/**
 * @author ko
 */
public class LoginForm extends ValidatorForm{//org.apache.struts.action.ActionForm {
    
    private String nombre = null;
    private String password = null;  
  
     Usuario usuario = new Usuario();
     
    public String getNombre(){
        return nombre;
    }
    
    public void setNombre(String nombre){
        this.nombre=nombre;
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
    
    
    public LoginForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    
}
