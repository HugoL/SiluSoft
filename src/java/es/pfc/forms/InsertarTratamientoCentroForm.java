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
public class InsertarTratamientoCentroForm extends ValidatorForm {
    
    private int idCentro;
    private String tipo;
    private String descripcion;
    private int precio;

    /**
     * @return
     */
    public int getIdCentro(){
        return idCentro;
    }

    public void setIdCentro(int idCentro) {
        this.idCentro=idCentro;
    }
    
    public String getTipo() {
        return tipo;
    }
  
    public void setTipo(String tipo) {
        this.tipo=tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion=descripcion;
    }
    
    public int getPrecio(){
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio=precio;
    }

    /**
     *
     */
    public InsertarTratamientoCentroForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
  
}
