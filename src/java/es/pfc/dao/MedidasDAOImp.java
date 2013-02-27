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

import es.pfc.model.Medidas;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ko
 */
public class MedidasDAOImp implements MedidasDAO{

    @Override
    public List leerZonas() throws Exception {        
        Connection conn = Conexion.getConexion();   
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List lista = new ArrayList();
        Medidas medida;
        
        String consulta= "SELECT * FROM `Medidas`;";      
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            medida = new Medidas();
                            medida.setIdZona(result.getInt("IdZona"));
                            medida.setZona(result.getString("Zona"));
                            lista.add(medida);
			}
                        return lista;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion MedidasDAOImp..."+sqle);
                }                                
                //cierro la conexion    
                finally {
			if(result != null)
				try { result.close(); } catch(SQLException ignored) { }
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
		}
    }

    @Override
    public Medidas leerMedida(Medidas medida) throws Exception {
         Connection conn = Conexion.getConexion();     
       
        ResultSet result = null;
        PreparedStatement statement = null;      
 
        
        String consulta= "SELECT Fecha,Medida FROM `MedidasCliente` WHERE IdCliente ="+medida.getIdCliente()+" AND IdZona = "+medida.getIdZona()+";";      
        int i=0;
        //Pido conexion       
        try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {                            
                            medida.setFecha(String.valueOf(result.getDate("Fecha")));
                            medida.setMedida(result.getFloat("Medida"));
			}
                        return medida;

        }catch(SQLException sqle) {
			throw new Exception("Excepcion MedidasDAOImp..."+sqle);
        }                                
        //cierro la conexion    
        finally {
			if(result != null)
				try { result.close(); } catch(SQLException ignored) { }
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
	}
    }

    @Override
    public List leerMedidasCliente(int idCliente) throws Exception {
        List lista = new ArrayList();
        Medidas medidas;
         Connection conn = Conexion.getConexion();     
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT Medidas.IdZona, Medidas.Zona,MedidasCliente.Medida, MedidasCliente.Fecha FROM `MedidasCliente`, Medidas WHERE MedidasCliente.idCliente="+idCliente+";";  
        System.out.println(consulta);
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            medidas = new Medidas();
                            medidas.setIdZona(result.getInt("Medidas.IdZona"));
                            medidas.setZona(result.getString("Medidas.Zona"));
                            medidas.setMedida(result.getFloat("MedidasCliente.Medida"));
                            Date fecha = result.getDate("MedidasCliente.Fecha");
                            String fechaS=fecha.toString();
                            medidas.setFecha(fechaS);
                            //falta la fecha
                            lista.add(medidas);
			}
                        return lista;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion MedidasDAOImp..."+sqle);
                }
                
                
                //cierro la conexion    
                finally {
			if(result != null)
				try { result.close(); } catch(SQLException ignored) { }
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
		}
    }

    @Override
    public boolean insertarMedidas(Medidas medidas) throws Exception {
         Connection conn = Conexion.getConexion();     
       
        boolean result;
        PreparedStatement statement = null;
        
        String consulta= "INSERT INTO `MedidasCliente` (idCliente,Fecha,IdZona,Medida) VALUES ("+medidas.getIdCliente()+","+medidas.getFecha()+","+medidas.getIdZona()+","+medidas.getMedida()+");";      
        System.out.println(consulta);
        try{
             statement = conn.prepareStatement(consulta);
             result=statement.execute(consulta);        
             
             if(!result) {                
                return true;                         
             }else{
                return false;
             }
        } catch(SQLException sqle) {
			throw new Exception("Excepcion en MedidasDAOImp.insertarMedidasCliente(): "+sqle);
        }
        //cierro la conexion    
        finally {
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
	}
    }
    
}
