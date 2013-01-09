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

import es.pfc.model.Permiso;
import java.util.List;

/**
 *
 * @author ko
 */
public interface PermisosDAO {
    public List listarRoles() throws Exception;
    public List listarPermisos() throws Exception;
    public List listarPermisosUsuario(int idUsuario) throws Exception;
    public List listarPermisosDefecto() throws Exception;
    public List listarPermisosDefectoRol(String Rol) throws Exception;
    public boolean insertarPermisosUsuario(Permiso permiso) throws Exception;
}
