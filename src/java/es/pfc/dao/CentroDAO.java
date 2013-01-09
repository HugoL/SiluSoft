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
import java.util.List;

/**
 *
 * @author ko
 */
public interface CentroDAO {
    public boolean create(Centro centro) throws Exception;
    public Centro read(int id) throws Exception;
    public Centro update(Centro centro) throws Exception;
    public List list () throws Exception;
    public boolean delete(int id) throws Exception;
    public boolean insertaTratamiento(String nombre, String descripcion, int idCentro) throws Exception;
    public int dameIdCentro(Centro centro) throws Exception;
    public List listarUsuarios() throws Exception;
    public boolean insertaSala(int idCentro, String nombre) throws Exception;
}
