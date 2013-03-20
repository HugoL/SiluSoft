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
public class InsertarClienteForm extends ValidatorForm {
    
    private String dni;
    private String nombre;
    private String apellidos;
    private String apellido2;
    private int idCentro;
    private String telefono;
    private String email;
    private int rol;
    private String url;

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre=nombre;
    }
    
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos=apellidos;
    }
    
    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2=apellido2;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url=url;
    }
    /**
     *
     */
    public InsertarClienteForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    
}
