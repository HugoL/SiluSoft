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

import es.pfc.model.Agenda;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author ko
 */
public interface AgendaDAO {
    public Agenda listarEventos(String sala, int idCentro,Date fecha) throws Exception;
    public Agenda listarMisEventos(String sala, int idCentro,Date fecha, int evento) throws Exception;
    public boolean insertarEvento(Agenda agenda,String evento) throws Exception;
    public boolean actualizarEvento(Agenda agenda,String evento) throws Exception;
    public List listaIdSala(String sala,int idCentro)throws Exception;
    public boolean existenEventos(int idCentro, Date fecha,int sala)throws Exception;
    public List listarSalas(int idCentro) throws Exception;
    public List numeroEventos() throws Exception;
    public boolean insertaEstadoEvento(String evento, int idCentro, int idSala, Date fecha, String estado,int idUsuario, int valoracion) throws Exception;
    public Agenda verEstadoEvento (Agenda agenda,String evento)throws Exception;
    public boolean actualizaEstadoEvento(String evento, int idCentro, int idSala, Date fecha, String estado, int idUsuario, int valoracion) throws Exception;
}
