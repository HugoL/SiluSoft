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

import es.pfc.model.Cliente;
import es.pfc.model.Observacion;
import es.pfc.model.Sesiones;
import java.util.List;

/**
 *
 * @author ko
 */
public interface ClienteDAO {
    public Cliente create(Cliente cliente,int IdCentro) throws Exception;
    public Cliente read(String dni) throws Exception;
    public Cliente readPorId(int id) throws Exception;
    public List readPeso(int idCliente) throws Exception;
    public Cliente update(Cliente cliente) throws Exception;
    public List list (int IdCentro) throws Exception;
    public List listNoCentro () throws Exception;
    public List listpag (int idCentro, int numpag, int numregpag) throws Exception;
    public List listalf (int idCentro, String letra) throws Exception;
    public boolean delete(int id) throws Exception;
    public List find(int Id, String Dni, String Nombre, String Apellido1, String Apellido2) throws Exception;
    public boolean clientecentro(int IdCliente, int id) throws Exception;
    public boolean clientepeso(int IdCliente, float peso, String fecha) throws Exception;
    public float comprobarpeso(int IdCliente, String fecha) throws Exception;       
    public boolean insertaSesionesCliente(Sesiones sesiones,int idCliente) throws Exception;
    public boolean actualizaSesionesCliente(Sesiones sesiones) throws Exception;
    public Sesiones listaSesionesCliente(int idCliente) throws Exception;
    public boolean insertaObservacionCliente(Observacion observacion) throws Exception;
    public Observacion listarObservacionCliente(int idCliente) throws Exception;
    public boolean insertarAsistenciaFitCliente(int idCliente) throws Exception;
    public boolean insertarAsistenciaConfortCliente(int idCliente) throws Exception;
    public int leeIdQr(String url) throws Exception;
    public boolean asociarClientesCentro(int idcliente, int idcentro) throws Exception;
    public Cliente login(String identificador, String password) throws Exception;
    public String insertarPassword(int id, String password) throws Exception;
    public String renovarPassword(int id, String password) throws Exception;
}
