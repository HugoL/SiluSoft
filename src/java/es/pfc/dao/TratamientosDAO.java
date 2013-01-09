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

import es.pfc.model.Tratamiento;
import java.util.List;

/**
 *
 * @author ko
 */
public interface TratamientosDAO {
    public Tratamiento create(Tratamiento tratamiento) throws Exception;
    public boolean createTratamientoCentro(Tratamiento tratamiento) throws Exception;
    public Tratamiento read(int id) throws Exception;
    public Tratamiento update(Tratamiento tratamiento) throws Exception;
    public List list (int IdCliente) throws Exception;
    public List listGeneral (int idCentro) throws Exception;
    public boolean delete(int id) throws Exception;
    public boolean deleteTratamientoCentro(int id) throws Exception;
    public List find(int Id, String Nombre) throws Exception;
    public boolean comprobarTratamientoCliente(int idTratamiento) throws Exception;
}
