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

import es.pfc.model.Permiso;
import java.util.List;
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
public class PermisosDAOImp implements PermisosDAO{

    @Override
    public List listarRoles() throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        //ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        int i=0;
        Permiso permisos;
        
            consulta= "SELECT IdRol, NombreRol FROM `SiluBd`.`Roles` WHERE IdRol NOT LIKE 1;";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        ResultSet result=statement.executeQuery();
                        
			while(result.next()) {
                            permisos = new Permiso();
                            permisos.setIdRol(result.getInt("IdRol"));
                            permisos.setRol(result.getString("NombreRol"));
                            
                            list.add(permisos);                                
                        }
                        return list;  

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public List listarPermisos() throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        //ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        int i=0;
        Permiso permisos;
        
        consulta= "SELECT Nombre FROM `SiluBd`.`ListaPermisos`;";  
        System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        ResultSet result=statement.executeQuery();
                        
			while(result.next()) {
                            permisos = new Permiso();
                            permisos.setPermiso(result.getString("Nombre"));
                            
                            list.add(permisos);                                
                        }
                        return list;  

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public List listarPermisosUsuario(int idUsuario) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        //ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        int i=0;
        Permiso permisos;
        
        consulta= "SELECT Nombre, Activado FROM `SiluBd`.`Permisos` WHERE IdUsuario="+idUsuario+";";  
        System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
                        statement = conn.prepareStatement(consulta); 
                        ResultSet result=statement.executeQuery();
                        
			while(result.next()) {
                            permisos = new Permiso();
                            permisos.setRol(result.getString("Nombre"));
                            permisos.setActivado(result.getBoolean("Activado"));
                            list.add(permisos);                                
                        }
                        return list;  

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public boolean insertarPermisosUsuario(Permiso permiso) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean insertado;
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
                        String consulta= "INSERT INTO `SiluBd`.`Permisos` (`IdUsuario`, `IdPermiso`, `Permiso`, `Activado`)VALUES ("+permiso.getIdUsuario()+", "+permiso.getIdPermiso()+", '"+permiso.getPermiso()+"', "+permiso.getActivado()+");";
                        statement = conn.prepareStatement(consulta);
                        System.out.println(consulta);
                        insertado=statement.execute(consulta);
                        result=statement.getResultSet();                      
			if(!insertado) {                          
                            return true;
			}else{
                            System.out.println("No se ha insertado el permiso");
                            return false;                      
                        }
		} catch(SQLException sqle) {
			throw new Exception("Excepcion PermisosDAOImp..."+sqle);
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
    public List listarPermisosDefecto() throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        //ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        int i=0;
        Permiso permisos;
        
        consulta= "SELECT PermisosDefecto.IdRol, PermisosDefecto.IdPermiso, PermisosDefecto.Activado, Roles.NombreRol, ListaPermisos.Nombre FROM PermisosDefecto, Roles, ListaPermisos WHERE PermisosDefecto.IdRol NOT LIKE 1 AND PermisosDefecto.IdPermiso = ListaPermisos.IdPermiso AND Roles.IdRol=PermisosDefecto.IdRol";  
        System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
                        statement = conn.prepareStatement(consulta); 
                        ResultSet result=statement.executeQuery();
                        
			while(result.next()) {
                            permisos = new Permiso();       
                            permisos.setIdRol(result.getInt("PermisosDefecto.IdRol"));
                            permisos.setIdPermiso(result.getInt("IdPermiso"));
                            permisos.setPermiso(result.getString("ListaPermisos.Nombre"));
                            permisos.setRol(result.getString("Roles.NombreRol"));
                            permisos.setActivado(result.getBoolean("PermisosDefecto.Activado"));
                            list.add(permisos);                                
                        }
                        return list;  

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public List listarPermisosDefectoRol(String Rol) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
