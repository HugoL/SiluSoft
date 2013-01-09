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
public class Evento implements Serializable{
    private int idEvento;
    private String evento;
    private String columna;
    
    public Evento(){
        
    }
    
    public void setIdEvento(int idEvento){
        this.idEvento=idEvento;
    }
    
    public int getIdEvento(){
        return idEvento;
    }
    
    public void setEvento(String evento){
        this.evento=evento;
    }
    
    public String getEvento(){
        return evento;
    }
    
    public void setColumna(String columna){
        this.columna=columna;
    }
    
    public String getColumna(){
        return columna;
    }
}
