package es.pfc.dao;
/**
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

import java.util.HashMap;
import java.util.Map;


public class FactoriaDAO {

	private Map map;
	private static FactoriaDAO instance;
/**
 * Constructor de la clase donde creara un HasMap.
 *
 * */
	private FactoriaDAO() {
		map = new HashMap();
	}
/**
 * patron singleton
 * */
	public static  FactoriaDAO getInstance() {
		if(instance == null)
			instance = new  FactoriaDAO();
		return instance;
	}

	/*public ClientesDao getUsuariosDao() throws Exception {
		return (ClientesDao) createDao(UsuariosConexion.class);
	}*/

        

	private Object createDao(Class clase) throws Exception {
		Object obj = map.get(clase);
		if(obj == null) {
			try {
				obj = clase.newInstance();
				map.put(clase, obj);
			} catch(Exception e) {
				throw new Exception(e);
			}
		}
		return obj;
	}
        
        public ClienteDAO getClienteDao() throws Exception {
		return (ClienteDAO) createDao(ClienteDAOImp.class);
	}
}