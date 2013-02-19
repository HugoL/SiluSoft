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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

/**
 *
 * @author ko
 */
public class TratamientosDAOImp implements TratamientosDAO {

    @Override
    public Tratamiento create(Tratamiento tratamiento) throws Exception {       
       //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean insertado;
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
                        String consulta= "INSERT INTO `SiluBd`.`TratamientoDeCliente` (`TipoTratamiento`, `FechaInicio`, `FechaFin`, `Intervalos`,`Resultados`,`Mantenimiento`, `Observaciones`, `IdCliente`) VALUES ('"+tratamiento.getTipo()+"', '"+tratamiento.getFechaInicio()+"', '"+tratamiento.getFechaFin()+"', '"+tratamiento.getIntervalos()+"', '"+tratamiento.getResultados()+"', '"+tratamiento.getMantenimiento()+"', '"+tratamiento.getObservaciones()+"', '"+tratamiento.getIdCliente()+"');";
                        statement = conn.prepareStatement(consulta);
                        System.out.println(consulta);
                        insertado=statement.execute(consulta);
                        result=statement.getResultSet();                      
			if(!insertado) {                          
                            return tratamiento;
			}else{
                            System.out.println("No se ha insertado el tratamiento");
                            return null;                      
                        }
		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientosDAOImp..."+sqle);
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
    public Tratamiento read(int id) throws Exception {
       Tratamiento tratamiento = null;
       int i;
       
       //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        if(id!=0){ //busco por dni
            consulta= "SELECT * FROM `SiluBd`.`TratamientoDeCliente` WHERE Referencia='"+id+"';";                
        }else{
            System.out.println("Nombre tratamiento vacío");
            return null;
        }
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;
                            tratamiento = new Tratamiento();
                            tratamiento.setIdTratamiento(result.getInt(i++));
                            tratamiento.setTipo(result.getString(i++));
                            tratamiento.setFechaInicio(result.getString(i++));
                            tratamiento.setFechaFin(result.getString(i++));
                            tratamiento.setIntervalos(result.getString(i++));   
                            tratamiento.setResultados(result.getString(i++)); 
                            tratamiento.setMantenimiento(result.getString(i++)); 
                            tratamiento.setIntervalos(result.getString(i++)); 
                            tratamiento.setObservaciones(result.getString(i++)); 
                            return tratamiento;
                            
			}else{
                            System.out.println("No se encuentra el tratamiento:"+tratamiento.getTipo());
                            return null;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientosDAOImp..."+sqle);
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
    public Tratamiento update(Tratamiento tratamiento) throws Exception {
       boolean actualizado;
       
        //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("UPDATE  `SiluBd`.`TratamientoDeCliente` SET  `Nombre` =  '"+Nombre+"', `Descripcion` = '"+Descripcion+"', `Precio` = '"+Precio+"' WHERE  `TratamientoDeCliente`.`Referencia` =  '"+tratamiento.getIdTratamiento()+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "UPDATE  `SiluBd`.`TratamientoDeCliente` SET  `TipoTratamiento` =  '"+tratamiento.getTipo()+"', `FechaInicio` = '"+tratamiento.getFechaInicio()+"', `FechaFin` = '"+tratamiento.getFechaFin()+"', `Intervalos` = '"+tratamiento.getIntervalos()+"', `Resultados` = '"+tratamiento.getIntervalos()+"', `Resultados` = '"+tratamiento.getResultados()+"', `Mantenimiento` = '"+tratamiento.getMantenimiento()+"', `Observaciones` = '"+tratamiento.getObservaciones()+"' WHERE  `TratamientoDeCliente`.`Referencia` =  "+tratamiento.getIdTratamiento()+";";
                        System.out.println(consulta);
                        actualizado=statement.execute(consulta);
                        result=statement.getResultSet();
                        
			if(actualizado==true) {                          
                            return tratamiento;
			}else{
                            System.out.println("No se ha actualizado el tratamiento");                        
                            return null;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientoDAOImp update..."+sqle);
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
    public List list(int IdCliente) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();
        
       
        ResultSet result = null;
        PreparedStatement statement = null;
        boolean consultado=false;
        int i;
        Tratamiento tratamiento = null;
        List list = new ArrayList();
        //Vector vector =new Vector();
        String sql="SELECT DISTINCT * FROM `TratamientoDeCliente` WHERE `IdCliente`='"+IdCliente+"';";
        try {   
			statement = conn.prepareStatement(sql); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            i=1;
                            tratamiento = new Tratamiento();
                            tratamiento.setIdTratamiento(result.getInt(i++));
                            tratamiento.setTipo(result.getString(i++));
                            tratamiento.setFechaInicio(result.getString(i++));
                            tratamiento.setFechaFin(result.getString(i++));
                            tratamiento.setIntervalos(result.getString(i++));   
                            tratamiento.setResultados(result.getString(i++)); 
                            tratamiento.setMantenimiento(result.getString(i++)); 
                            tratamiento.setObservaciones(result.getString(i++)); 
                            tratamiento.setIdCliente(result.getInt(i++));
                            list.add(tratamiento);
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
        boolean eliminado=false;
        int i = 0;
       
       //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("DELETE FROM `SiluBd`.`Tratamientos` WHERE IdTratamiento='"+id+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "DELETE FROM `SiluBd`.`TratamientoDeCliente` WHERE Referencia='"+id+"';";
                        //statement.setString(i++, Dni);
                        eliminado=statement.execute(consulta);
                        result=statement.getResultSet();
                        System.out.println(consulta);
			if(eliminado==true) {                           
                            return true;
			}else{
                            System.out.println("No se ha eliminado el tratamiento");
                            
                            return false;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientoDAOImp..."+sqle);
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
    public List find(int Id, String Nombre) throws Exception {
       Tratamiento tratamiento = null;
       boolean leido;
       int i;
       
       //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        if(Id!=0){
            System.out.println("Entra a buscar segun Id");
            consulta="SELECT * FROM `SiluBd`.`TratamientoDeCliente` WHERE Referencia='"+Id+"';";
        }else{             
               
         }
       
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        
			while(result.next()) {
                            i=1;
                            tratamiento = new Tratamiento();
                            tratamiento.setIdTratamiento(result.getInt(i++));
                            tratamiento.setTipo(result.getString(i++));
                            tratamiento.setFechaInicio(result.getString(i++));
                            tratamiento.setFechaFin(result.getString(i++));
                            tratamiento.setIntervalos(result.getString(i++));   
                            tratamiento.setResultados(result.getString(i++)); 
                            tratamiento.setMantenimiento(result.getString(i++)); 
                            tratamiento.setIntervalos(result.getString(i++)); 
                            tratamiento.setObservaciones(result.getString(i++));                           
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientosDAOImp..."+sqle);
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
    public List listGeneral(int idCentro) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();        
       
        ResultSet result = null;
        PreparedStatement statement = null;
        Tratamiento tratamiento = null;
        List list = new ArrayList();
        //Vector vector =new Vector();
        String sql="SELECT DISTINCT * FROM `Tratamientos` WHERE `IdCentro`='"+idCentro+"';";
        try {   
			statement = conn.prepareStatement(sql); 
                        result=statement.executeQuery();
                       
			while(result.next()) {                       
                            tratamiento = new Tratamiento();
                            tratamiento.setIdTratamiento(result.getInt("IdTratamiento"));
                            tratamiento.setTipo(result.getString("Nombre"));
                            tratamiento.setDescripcion(result.getString("Descripcion"));
                            tratamiento.setPrecio(result.getFloat("Precio"));
                            tratamiento.setIdCentro(result.getInt("IdCentro"));
                            list.add(tratamiento);
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
    public boolean deleteTratamientoCentro(int id) throws Exception {
        boolean eliminado=false;
        int i = 0;
       
       //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("DELETE FROM `SiluBd`.`Tratamientos` WHERE IdTratamiento='"+id+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "DELETE FROM `SiluBd`.`Tratamientos` WHERE IdTratamiento="+id+";";
                        System.out.println(consulta);
                        eliminado=statement.execute(consulta);
                        result=statement.getResultSet();
                        
			if(eliminado==true) {                           
                            return true;
			}else{
                            System.out.println("No se ha eliminado el tratamiento");
                            
                            return false;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientoDAOImp..."+sqle);
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
    public boolean comprobarTratamientoCliente(int idTratamiento) throws Exception {
        Tratamiento tratamiento = null;
       int i;
       
       //variables para la conexion
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        String consulta= "SELECT IdCliente FROM `SiluBd`.`TratamientoDeCliente` WHERE Referencia='"+idTratamiento+"';";                
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {                            
                            return true;                            
			}else{
                            return false;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientosDAOImp..."+sqle);
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
    public boolean createTratamientoCentro(Tratamiento tratamiento) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean insertado;
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
                        String consulta= "INSERT INTO `SiluBd`.`Tratamientos` (`Nombre`, `Descripcion`, `Precio`, `IdCentro`) VALUES ('"+tratamiento.getTipo()+"', '"+tratamiento.getDescripcion()+"', '"+tratamiento.getPrecio()+"', '"+tratamiento.getIdCentro()+"');";
                        System.out.println(consulta);
                        statement = conn.prepareStatement(consulta);
                        insertado=statement.execute(consulta);
                        result=statement.getResultSet();                      
			if(!insertado) {                          
                            return true;
			}else{
                            System.out.println("No se ha insertado el tratamiento");
                            return false;                      
                        }
		} catch(SQLException sqle) {
			throw new Exception("Excepcion TratamientosDAOImp..."+sqle);
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
    
}
