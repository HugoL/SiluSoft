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
    along with this program.  If not, see <http://www.gnu.org/licenses/>..
 */
package es.pfc.model;

import java.io.Serializable;

/**
 *
 * @author ko
 */
public class Sesiones implements Serializable {
    private int idCliente;
    private int fit;
    private int confort;
    private int total;
    private int resconfort;
    private int resfit;
    
    public Sesiones(){
        
    }
    
    public int getIdCliente(){
        return idCliente;
    }
    
    public void setIdCliente(int idCliente){
        this.idCliente=idCliente;
    }
    
    public int getFit(){
        return fit;
    }
    
    public void setFit(int fit){
        this.fit=fit;
    }
    
    public int getConfort(){
        return confort;
    }
    
    public void setConfort(int confort){
        this.confort=confort;
    }
    
    public int getTotal(){
        return total;
    }
    
    public void setTotal(int total){
        this.total=total;
    }
    
    public int getResFit(){
        return resfit;
    }
    
    public void setResFit(int resfit){
        this.resfit=resfit;
    }
    
    public int getResConfort(){
        return resconfort;
    }
    
    public void setResConfort(int resconfort){
        this.resconfort=resconfort;
    }
}
