package es.pfc.forms;

import org.apache.struts.validator.ValidatorForm;

/**
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
public class InsertarSesionesClienteForm extends ValidatorForm {
        
    private int idCliente;
    private int fit;
    private int comfort;
    private float precio;
    
    public int getIdCliente() {
        return idCliente;
    }


    public void setIdCliente(int idCliente) {
        this.idCliente=idCliente;
    }

    public int getFit() {
        return fit;
    }

    public void setFit(int fit) {
        this.fit=fit;
    }
    
    public int getComfort() {
        return comfort;
    }

    public void setComfort(int comfort) {
        this.comfort=comfort;
    }
    
    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio=precio;
    }
    
    public InsertarSesionesClienteForm() {
        super();
        // TODO Auto-generated constructor stub
    }


    
}
