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

import es.pfc.model.PreguntaTest;
import es.pfc.model.TestCliente;
import java.util.List;

/**
 *
 * @author ko
 */
public interface TestDAO {
    public boolean comprobarTest(int id) throws Exception;
    public TestCliente leeclienteTest(int id)throws Exception;
    public List leepreguntasTest()throws Exception;
    public boolean insertaclienteTest(TestCliente test) throws Exception;
    public List leerespuestasTest() throws Exception;
    public List leeresultadosTest(int idCliente) throws Exception;
    public PreguntaTest leeTextoPregunta(PreguntaTest pregunta) throws Exception;
    public PreguntaTest leeRespuestasPregunta(PreguntaTest pregunta) throws Exception;
    public PreguntaTest preguntaResultado(PreguntaTest pregunta) throws Exception;  
    public boolean insertarResultadoPregunta(PreguntaTest pregunta) throws Exception;
 
}
