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

import es.pfc.dao.UsuarioDAOImpl;
import es.pfc.model.Usuario;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko
 */
public class UsuariosBO {
    
    public static boolean ComprobarAdmin(Usuario usuario){
        UsuarioDAOImpl usuariocomprobado = new UsuarioDAOImpl();
        int rol;
        try {
            rol=usuariocomprobado.dameROl(usuario.getDni());
            if(rol==-1){
                System.out.print("Error al comprobar rol: -1");
                return false;
            }else{
                if(rol==1){
                    //es administrador
                    return true;
                }else{
                    //no es administrador
                    return false;
                }
      
            }
            
        } catch (Exception ex) {
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
    public static Usuario insertaUsuarioCentro(Usuario usuario){
        UsuarioDAOImpl usuarioinsertado = new UsuarioDAOImpl();
        boolean insertado=false;
        Usuario miusuario = new Usuario();
        try{
            insertado=usuarioinsertado.insertarUsuario(usuario);
            System.out.println("Usuario insertado: "+insertado);
            miusuario = usuarioinsertado.consultarUsuario(usuario.getNombre(), usuario.getPassword());
            System.out.println();
            usuario.setIdUsuario(miusuario.getIdUsuario());                           
        }catch(Exception ex){
             Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return miusuario;
    }
    
    public static boolean insertaUsuario(Usuario usuario){
        UsuarioDAOImpl usuarioinsertado = new UsuarioDAOImpl();
        boolean insertado=false;
        Usuario miusuario = new Usuario();
        try{
            insertado=usuarioinsertado.insertarUsuario(usuario);
            System.out.println("Usuario insertado: "+insertado);
            miusuario = usuarioinsertado.consultarUsuario(usuario.getNombre(), usuario.getPassword());
            usuario.setIdUsuario(miusuario.getIdUsuario());
            if(insertado)
            return true;
        }catch(Exception ex){
             Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public static List listaUsuarios(int idCentro){
        UsuarioDAOImpl listausuarios = new UsuarioDAOImpl();
        try{
            
            return listausuarios.listarUsuarios(idCentro);
            
        }catch(Exception ex){
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static List listaRoles(){
        List lista = new ArrayList();
        UsuarioDAOImpl dameroles = new UsuarioDAOImpl();
        try{            
            lista=dameroles.consultarRoles();
        }catch(Exception ex){
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }    
        return lista;
    }        
}
