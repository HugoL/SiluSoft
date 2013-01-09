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
package es.pfc.model;

import java.io.Serializable;

/**
 *
 * @author ko
 */
public class Medidas implements Serializable {

    private String fecha;
    private int idCliente;
    private int idZona;
    private String zona;
    private float medida;
    
    
    public Medidas(){
        
    }
    
    
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha=fecha;
    }
    
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente=idCliente;
    }
    
    public int getIdZona() {
        return idZona;
    }

    public void setIdZona(int idZona) {
        this.idZona=idZona;
    }
    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona=zona;
    }
    
    public float getMedida() {
        return medida;
    }

    public void setMedida(float medida) {
        this.medida=medida;
    }
    
}
