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
public class Permiso implements Serializable {
    private int idUsuario;
    private int idPermiso;
    private String permiso;
    private int idRol;
    private String rol;
    private boolean activado;
    
    public Permiso(){
        
    }
    
    public int getIdUsuario(){
        return idUsuario;
    }
    
    public void setIdUsuario(int idUsuario){
        this.idUsuario=idUsuario;
    }
    
    public String getPermiso(){
        return permiso;
    }
    
    public void setPermiso(String permiso){
        this.permiso=permiso;
    }
    
    public int getIdPermiso(){
        return idPermiso;
    }
    
    public void setIdPermiso(int idPermiso){
        this.idPermiso=idPermiso;
    }
    
    public String getRol(){
        return rol;
    }
    
    public void setRol(String rol){
        this.rol=rol;
    }
    
    public int getIdRol(){
        return idRol;
    }
    
    public void setIdRol(int idRol){
        this.idRol=idRol;
    }
    
    public boolean getActivado(){
        return activado;
    }
    
    public void setActivado(boolean activado){
        this.activado=activado;
    }
    
}
