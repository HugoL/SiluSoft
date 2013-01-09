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
package es.pfc.negocio;

import es.pfc.dao.PermisosDAOImp;
import es.pfc.model.Permiso;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ko
 */
public class PermisosBO {
    
    public static List listarRoles() throws Exception{
        List listaRoles = new ArrayList();
        PermisosDAOImp permisosop = new PermisosDAOImp();
        try{
            listaRoles=permisosop.listarRoles();
        } catch (Exception e) {
            throw e;
        }
        
        return listaRoles;
    }
    
    public static List listarPermisosDefecto() throws Exception{
        List listaPermisos = new ArrayList();        
        PermisosDAOImp permisosop = new PermisosDAOImp();
        try{
            listaPermisos=permisosop.listarPermisosDefecto();
        }catch(Exception e){
            throw e;
        }
        
        return listaPermisos;
    }
    
    public static List listarPermisos() throws Exception{
        List listaPermisos = new ArrayList();        
        PermisosDAOImp permisosop = new PermisosDAOImp();
        try{
            listaPermisos=permisosop.listarPermisos();
        }catch(Exception e){
            throw e;
        }
        
        return listaPermisos;
    }
    
    public static boolean insertarPermisosUsuario(Permiso permiso) throws Exception{
        PermisosDAOImp permisosop = new PermisosDAOImp();
        try{
            return permisosop.insertarPermisosUsuario(permiso);
        }catch(Exception e){
            throw e;
        }
    }
    
}
