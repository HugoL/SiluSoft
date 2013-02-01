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
public class InsertarImcClienteForm extends ValidatorForm {
        
    private int id;
    private float peso;
    private float altura;
    /**
     * @return
     */
    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id=id;
    }

    
    public float getPeso() {
        return peso;
    }


    public void setPeso(float peso) {
        this.peso=peso;
    }
    
    public float getAltura() {
        return altura;
    }


    public void setAltura(float altura) {
        this.altura=altura;
    }

    /**
     *
     */
    public InsertarImcClienteForm() {
        super();
        // TODO Auto-generated constructor stub
    }
   
}
