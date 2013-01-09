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


import org.apache.struts.validator.ValidatorForm;


/**
 *
 * @author ko
 */
public class BuscarClientesForm extends ValidatorForm {
    
    private String dni;
    private String nombre;
    private String apellido1;
    private String apellido2;


    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
       this.dni=dni;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
       this.nombre=nombre;
    }
 
    public String getApellido1() {
        return apellido1;
    }
    
    public void setApellido1(String apellido1){
        this.apellido1=apellido1;
    }
    
    public String getApellido2() {
        return apellido2;
    }
    
    public void setApellido2(String apellido2){
        this.apellido2=apellido2;
    }



    /**
     *
     */
    public BuscarClientesForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    
   
}
