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
public class ActualizarCentroForm extends ValidatorForm {
    
    private int id;
    private String nombre;
    private String direccion;
    private String telefono;


    public int getIdCentro(){
        return id;
    }
    
    public void setIdCentro(int id){
        this.id=id;       
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre=nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion=direccion;
    }
    
    public String getTelefono(){
        return telefono;
    }
    
    public void setTelefono(String telefono){
        this.telefono=telefono;
    }

    public ActualizarCentroForm() {
        super();
        // TODO Auto-generated constructor stub
    }

   
}
