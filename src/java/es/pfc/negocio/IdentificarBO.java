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
import es.pfc.model.Centro;
import es.pfc.model.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ko
 */
public class IdentificarBO {
    public static Usuario esUsuarioAutorizado (String Nombre, String Password) throws Exception {

            UsuarioDAOImpl loginDAO = new UsuarioDAOImpl ();
            Usuario miusuario = new Usuario();
            try {
                  miusuario=loginDAO.consultarUsuario(Nombre,Password);                                     
                  return miusuario;                  
            } catch (Exception e) {
                  throw e;
            }          
      }
    
    public static List damePermisosdeUsuario(int idUsuario) throws Exception{
        UsuarioDAOImpl usuarioop = new UsuarioDAOImpl ();
        List listaPermisosUsuario = new ArrayList();
        try {
             listaPermisosUsuario = usuarioop.consultaPermisosNuevo(idUsuario);
             return listaPermisosUsuario;
                                    
            } catch (Exception e) {
                  throw e;
            }


    }
    
    public static int dameCentro (Usuario usuario) throws Exception {

            UsuarioDAOImpl usuariocentro = new UsuarioDAOImpl ();
            int idCentro;

            try {
                  idCentro=usuariocentro.consultarCentro(usuario);             
                  return idCentro;
                  
            } catch (Exception e) {
                  throw e;
            }
      }
   
}
