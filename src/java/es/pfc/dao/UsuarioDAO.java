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
package es.pfc.dao;

import es.pfc.model.Centro;
import es.pfc.model.Usuario;
import java.util.List;

/**
 *
 * @author ko
 */
public interface UsuarioDAO {
    
     public List listarUsuarios(int idCentro) throws Exception;
     public boolean insertarUsuario(Usuario usuario) throws Exception;
     //public boolean insertarPermisos(Usuario usuario) throws Exception;
     public Usuario consultarUsuario (String Nombre, String Password) throws Exception;
     public boolean comprobarDatosUsuario (String nombre, String password) throws Exception;
     public int consultarCentro (Usuario usuario) throws Exception;
     public List consultaPermisosNuevo(int idUsuario) throws Exception;
     public List consultarRoles() throws Exception;
     public boolean modificarPerfil(Usuario usuario) throws Exception;
    
}
