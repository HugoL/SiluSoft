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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;

/**
 *
 * @author ko
 */
public class CentroDAOImp implements CentroDAO{
    
    @Override
    public boolean create(Centro centro) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean result;
        ResultSet result2;
        PreparedStatement statement = null;      
        String consulta = "";
        int i;
  
        consulta= "INSERT INTO `SiluBd`.`Centros` (Nombre,Direccion,Telefono) VALUES ('"+centro.getNombre()+"','"+centro.getDireccion()+"','"+centro.getTelefono()+"');";                
      
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.execute();                     			
                              
                        if(result)
                            return true;
                        return false;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp..."+sqle);
                }
                //cierro la conexion    
                finally {
			
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
		}
    }
    
    @Override
    public Centro read(int id) throws Exception {
        //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;      
        String consulta = "";
        int i;
        Centro centro;
        
  
        consulta= "SELECT * FROM `SiluBd`.`Centros` WHERE IdCentro='"+id+"';";                
      
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;
                            centro = new Centro();
                            centro.setIdCentro(result.getInt(i++));   
                            centro.setNombre(result.getString(i++));
                            centro.setDireccion(result.getString(i++));
                            centro.setTelefono(result.getString(i++));                                           
                            return centro;                            
			}else{
                            System.out.println("No se encuentra el centro con ese Id: "+id);
                            return null;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp..."+sqle);
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
    public Centro update(Centro centro) throws Exception {
       int actualizado;
       int Id = centro.getIdCentro();
       String Nombre = centro.getNombre();
       String Direccion = centro.getDireccion();
       String Telefono = centro.getTelefono();
       
        //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
			statement = conn.prepareStatement("UPDATE  `SiluBd`.`Centros` SET  `Nombre` =  '"+Nombre+"',  `Direccion` = '"+Direccion+"', `Telefono` = '"+Telefono+"' WHERE  `Centros`.`IdCentro` =  '"+Id+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "UPDATE  `SiluBd`.`Centros` SET  `Nombre` =  '"+Nombre+"',  `Direccion` = '"+Direccion+"', `Telefono` = '"+Telefono+"' WHERE  `Centros`.`IdCentro` =  '"+Id+"';";                      
                        actualizado=statement.executeUpdate(consulta);
                        result=statement.getResultSet();                      
			if(actualizado!=0) {                          
                            return centro;
			}else{
                            System.out.println("No se ha actualizado el centro");                        
                            return null;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp update..."+sqle);
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
    public List list() throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();
        
       
        ResultSet result = null;
        PreparedStatement statement = null;
        int i=0;
        Centro centro = null;
        List list = new ArrayList();
        String sql="SELECT * FROM `Centros`;";
        System.out.println(sql);
        try {   
			statement = conn.prepareStatement(sql); 
                        result=statement.executeQuery();
                        while(result.next()){
                            centro = new Centro();
                            i++;
                            centro.setIdCentro(result.getInt("IdCentro"));                           
                            centro.setNombre(result.getString("Nombre"));
                            centro.setDireccion(result.getString("Direccion"));
                            centro.setTelefono(result.getString("Telefono"));  
                            
                            list.add(centro);
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			if(result != null)
				try { result.close(); } catch(SQLException ignored) { }
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
		}
    }
    
    @Override
    public boolean delete(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public boolean insertaTratamiento(String nombre, String descripcion, int idCentro) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean result;
        PreparedStatement statement = null;      
        String consulta = "";
        int i;
  
        consulta= "INSERT INTO `SiluBd`.`Tratamientos` (Nombre,Descripcion,IdCentro) VALUES ('"+nombre+"','"+descripcion+"',"+idCentro+");";                
        System.out.println(consulta);
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.execute();
                       
			if(result) {
                            return true;
                            
			}else{
                            System.out.println("No se inserta el tratamiento");
                            return false;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp..."+sqle);
                }
                //cierro la conexion    
                finally {
			
			if(statement != null)
				try { statement.close(); } catch(SQLException ignored) { }
			if(conn != null)
				try { conn.close(); } catch(SQLException ignored) { }
		}
    }
    
    @Override
    public int dameIdCentro(Centro centro) throws Exception {
        //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;     
        
        try{        
                            String consulta ="SELECT IdCentro FROM Centros WHERE Nombre='"+centro.getNombre()+"' AND Direccion='"+centro.getDireccion()+"';";
                            System.out.println(consulta);
                            statement = conn.prepareStatement(consulta); 
                            result=statement.executeQuery();
                            
                            if(result.next()){                                 
                                System.out.println("IdCentro nuevo: "+result.getInt("IdCentro"));
                                return result.getInt("IdCentro");
                            } 
                            System.out.println("IdCentro nuevo: "+result.getInt("IdCentro"));
                            return -2;  
        }catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp..."+sqle);
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
    public List listarUsuarios() throws Exception {
        //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;     
        
        Usuario usuario;
        List lista = new ArrayList();
        
        try{        
                            String consulta ="SELECT * FROM Usuarios;";
                            System.out.println(consulta);
                            statement = conn.prepareStatement(consulta); 
                            result=statement.executeQuery();
                            
                            while(result.next()){
                                usuario=new Usuario();
                                usuario.setIdCentro(result.getInt("idCentro"));
                                usuario.setNombre(result.getString("Nombre"));
                                usuario.setApellidos(result.getString("Apellidos"));
                                usuario.setDireccion(result.getString("Direccion"));
                                usuario.setEmail(result.getString("Email"));
                                usuario.setDni(result.getString("Dni"));
                                lista.add(usuario);
                            }
                            
                            return lista;
                              
        }catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp..."+sqle);
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
    public boolean insertaSala(int idCentro,String nombre) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean result;
        PreparedStatement statement = null;      
        String consulta = "";
        int i;
  
        consulta= "INSERT INTO `SiluBd`.`Salas` (Nombre,IdCentro) VALUES ('"+nombre+"',"+idCentro+");";                
        System.out.println(consulta);
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.execute();
                       
			if(result) {
                            return true;
                            
			}else{
                            System.out.println("No se inserta la sala");
                            return false;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion CentroDAOImp..."+sqle);
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
