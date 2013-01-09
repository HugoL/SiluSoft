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

import es.pfc.dao.MedidasDAOImp;
import es.pfc.model.Medidas;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko
 */
public class MedidasBO {
    public static List leeZonas(){
        List lista = new ArrayList();
        MedidasDAOImp medidasop = new MedidasDAOImp();
        try{
            lista=medidasop.leerZonas();
        }catch(Exception ex){
                        Logger.getLogger(MedidasBO.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return lista;        
    }
    
    public static Medidas leeMedidaCliente(Medidas medida){
        MedidasDAOImp medidasop = new MedidasDAOImp();
        try{
            medida=medidasop.leerMedida(medida);
        }catch(Exception ex){
                        Logger.getLogger(MedidasBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return medida;
    }
    
    public static List leeMedidasCliente(int idCliente){
        MedidasDAOImp medidasop = new MedidasDAOImp();
        List lista = new ArrayList();
        try{
            lista=medidasop.leerMedidasCliente(idCliente);
        }catch(Exception ex){
                        Logger.getLogger(MedidasBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public static boolean insertaMedidas(Medidas medida){
        MedidasDAOImp medidasop = new MedidasDAOImp();
        boolean insertado=false;
        try{
            insertado=medidasop.insertarMedidas(medida);
            return insertado;
        }catch(Exception ex){
                        Logger.getLogger(MedidasBO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return insertado;
    }
}
