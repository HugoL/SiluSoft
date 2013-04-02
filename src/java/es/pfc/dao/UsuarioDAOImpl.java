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
import es.pfc.model.Usuario;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.helpers.Loader;

/**
 *
 * @author ko
 */
public class UsuarioDAOImpl implements UsuarioDAO {    
    private static Logger logger = Logger.getLogger(UsuarioDAOImpl.class);
    private static org.apache.log4j.Logger registro;
    private static final char[] HEXADECIMAL = { '0', '1', '2', '3',
        '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
                        
    @Override
    public Usuario consultarUsuario (String Nombre, String Password) throws Exception {     
        //variables para la conexion            
            Connection conn = null;            
            conn = Conexion.getConexion();       
       
            ResultSet result = null;
            PreparedStatement statement = null;   
                try {
                        
                        URL url = Loader.getResource("log4j.properties");
                        //PropertyConfigurator.configure(url);
                        //registro = Logger.getLogger(UsuarioDAOImpl.class);
 System.out.println ("[" + url.toString() + "] Logger inicializado.");
                } catch (Exception e) {
                        BasicConfigurator.configure();
                        //registro = Logger.getLogger(UsuarioDAOImpl.class);
                        System.out.println ("Excepción al inicializar el log: " + e.toString());
                }
        
        try {         
            Password = hash(Password);
            Usuario usuario = new Usuario();
            //preparacion de la consulta
            String consulta="select * from SiluBd.Usuarios where Nombre='"+Nombre+"' && Password='"+Password+"';";
            System.out.println(consulta);
            statement = conn.prepareStatement(consulta); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
            result = statement.executeQuery(consulta);
            /////////////////////////////////////////////////////
            
            if(result.next()) {	
                usuario.setIdUsuario(result.getInt("IdUsuario"));
                usuario.setDni(result.getString("Dni"));
                usuario.setIdCentro(result.getInt("IdCentro"));
                usuario.setNombre(result.getString("Nombre")); 
                usuario.setApellidos(result.getString("Apellidos"));
                usuario.setTelefono(result.getString("Telefono"));
                usuario.setDireccion(result.getString("Direccion"));
                usuario.setEmail(result.getString("Email"));
                usuario.setIdCentro(result.getInt("IdCentro"));
                usuario.setRol(result.getInt("Rol"));
      
                return usuario;                             
            }else{
                System.out.println("El usuario no se encuentra");
                usuario.setIdUsuario(0);
                return usuario;
            }

        } catch(SQLException sqle) {
            logger.debug(sqle);
            throw new Exception("Excepción en UsuarioDAOImpl.consultarUsuario: "+sqle);
        }
         //cierro la conexion    
                finally {
			if(result != null) {
                        try { result.close(); } catch(SQLException ignored) { }
                    }
			if(statement != null) {
                        try { statement.close(); } catch(SQLException ignored) { }
                    }
			if(conn != null) {
                        try { conn.close(); } catch(SQLException ignored) { }
                    }
		}   
    
    }
    
    @Override
    public boolean comprobarDatosUsuario (String nombre, String password) throws Exception {
        
        //Pido conexion        
            Connection conn = Conexion.getConexion(); 
            ResultSet result = null;
            PreparedStatement statement = null;      
       try {            
                        password = hash(password);
			int i = 0;
			//conn = getConexion();
			statement = conn.prepareStatement("select * from Usuarios where Nombre='"+nombre+"' && Password='"+password+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        //statement.setString(i++, Dni);
			result = statement.executeQuery();                      
			if(result!=null) {
				/*i = 1;//esto estaba a 1				
                                //statement.setDni(result.getString(i++));
                                System.out.println("Resultado read: "+result);
                                //obj.setDni(result.getString(i++));//esto estaba comentao
                                resultado.setNombre(result.getString(i++));
                                resultado.setPassword(result.getString(i++));
                                */
                                //resultado.setNombre(Nombre);
                                //resultado.setPassword(Password);
                                return true;
			}else{
                            System.out.println("El usuario no se encuentra");
                                return false;
                        }


		} catch(SQLException sqle) {
			throw new Exception("Primera excepcion..."+sqle);
                }
       //cierro la conexion    
                finally {
			if(result != null) {
                        try { result.close(); } catch(SQLException ignored) { }
                    }
			if(statement != null) {
                        try { statement.close(); } catch(SQLException ignored) { }
                    }
			if(conn != null) {
                        try { conn.close(); } catch(SQLException ignored) { }
                    }
		}       
    }
    
    @Override
    public int consultarCentro (Usuario usuario) throws Exception {
             
       int i,id; 
        //Pido conexion 
            Connection conn = Conexion.getConexion();
        
       
            ResultSet result = null;
            PreparedStatement statement = null;       
       //inserto los datos en la BD
       try {                           
            statement = conn.prepareStatement("SELECT `IdCentro` FROM `SiluBd`.`Usuarios` WHERE `Dni`='"+usuario.getDni()+"';");
            //String consulta="SELECT * FROM `SiluBd`.`Centros` WHERE IdCentro='"+idCentro+"';";
            result = statement.executeQuery();
            if(result.next()) { 
                i=1;
                id=result.getInt(i);
                return id;
            }else{
                System.out.println("El centro no se encuentra");
                return -1; 
            }
	} catch(SQLException sqle) {
			throw new Exception("Excepción en UsuarioDAOImpl.consultarCentro: "+sqle);
        }
       //cierro la conexion    
                finally {
			if(result != null) {
                        try { result.close(); } catch(SQLException ignored) { }
                    }
			if(statement != null) {
                        try { statement.close(); } catch(SQLException ignored) { }
                    }
			if(conn != null) {
                        try { conn.close(); } catch(SQLException ignored) { }
                    }
		}   
    }
    
    public int dameROl(String Dni) throws Exception{
       Connection conn = Conexion.getConexion();
            int rol,i=0;
       
            ResultSet result = null;
            PreparedStatement statement = null;   
        try {                               
            statement = conn.prepareStatement("SELECT `Rol` FROM `SiluBd`.`Usuarios` WHERE `Dni`='"+Dni+"';");
            result = statement.executeQuery();
            if(result.next()) { 
                i=1;
                rol=result.getInt(i);
                System.out.println("Rol: "+rol);
                return rol;
            }else{
                return -1; 
            }
	} catch(SQLException sqle) {
			throw new Exception("Excepción en UsuarioDAOImpl.dameRol: "+sqle);
        }
          //cierro la conexion    
                finally {
			if(result != null) {
                        try { result.close(); } catch(SQLException ignored) { }
                    }
			if(statement != null) {
                        try { statement.close(); } catch(SQLException ignored) { }
                    }
			if(conn != null) {
                        try { conn.close(); } catch(SQLException ignored) { }
                    }
		}
    }

    @Override
    public boolean insertarUsuario(Usuario usuario) throws Exception {
         
       if(usuario==null){
           System.out.println("El usuario es nulo!!");
           return false;
       }
        
       boolean insertado=false;   
       
       //variables para la conexion
       Connection conn = Conexion.getConexion();
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
        try {              
                        String password = hash(usuario.getPassword());
			 //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "INSERT INTO `SiluBd`.`Usuarios` (`Dni`, `Nombre`, `Apellidos`,`Telefono`, `Email`, `Password`, `IdCentro`, `Rol`) VALUES ('"+usuario.getDni()+"', '"+usuario.getNombre()+"', '"+usuario.getApellidos()+"', '"+usuario.getTelefono()+"', '"+usuario.getEmail()+"', '"+password+"', "+usuario.getIdCentro()+", "+usuario.getRol()+");";
                        System.out.println(consulta);
                        statement = conn.prepareStatement(consulta);
                        //System.out.println(consulta);
                        insertado=statement.execute(consulta);
                        result=statement.getResultSet();
			if(!insertado) {                           
                            return false;
			}else{
                            System.out.println("No se ha insertado el usuario");
                            return true;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion UsuarioDAOImp.InsertarUsuario "+sqle);
                }
                //cierro la conexion    
                finally {
			if(result != null) {
                        try { result.close(); } catch(SQLException ignored) { }
                    }
			if(statement != null) {
                        try { statement.close(); } catch(SQLException ignored) { }
                    }
			if(conn != null) {
                        try { conn.close(); } catch(SQLException ignored) { }
                    }
		}    
    }

   

   /* @Override
    public boolean insertarPermisos(Usuario usuario) throws Exception {
        boolean insertado=false;
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
			//, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "INSERT INTO `Permisos` (`IdUsuario`, `ConsultaClientes`, `ManipulaClientes`, `ConsultaCentro`,`ManipulaCentro`, `Administracion`, `ConsultaAgenda`, `ManipulaAgenda`) VALUES ("+usuario.getIdUsuario()+", "+usuario.getConsultaClientes()+", "+usuario.getManipulaClientes()+", "+usuario.getConsultaCentro()+", "+usuario.getManipulaCentro()+", "+usuario.getAdministracion()+", "+usuario.getConsultaAgenda()+", "+usuario.getManipulaAgenda()+");";
                        statement = conn.prepareStatement(consulta);
                        System.out.println(consulta);
                        insertado=statement.execute(consulta);
                        result=statement.getResultSet();
			if(!insertado) {                           
                            return false;
			}else{
                            System.out.println("No se han insertado los permisos del usuario");
                            return true;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion UsuarioDAOImp..."+sqle);
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
    }*/

    @Override
    public List listarUsuarios(int idCentro) throws Exception {
        //variables para la conexion
            Connection conn = Conexion.getConexion();
       
            ResultSet result = null;
            PreparedStatement statement = null;     
            List lista = new ArrayList();
        
        try {           

            //preparacion de la consulta
            String consulta="select Dni,Nombre,Apellidos,Direccion,Telefono,Email,IdUsuario from Usuarios where IdCentro="+idCentro+";";
            System.out.println("---> "+consulta);
            statement = conn.prepareStatement(consulta); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
            
            result = statement.executeQuery(consulta);
            /////////////////////////////////////////////////////
            Usuario usuario;
            while(result.next()) {	
                usuario = new Usuario();
                usuario.setDni(result.getString("Dni"));
                usuario.setNombre(result.getString("Nombre"));
                usuario.setApellidos(result.getString("Apellidos"));
                usuario.setDireccion(result.getString("Direccion"));
                usuario.setTelefono(result.getString("Telefono"));
                usuario.setEmail(result.getString("Email"));
                usuario.setIdUsuario(result.getInt("IdUsuario"));              
                lista.add(usuario);
            }
            
            return lista;

        } catch(SQLException sqle) {
            throw new Exception("Excepción en UsuarioDAOImpl.listarUsuarios: "+sqle);
        }
        finally {
			if(result != null) {
                try { result.close(); } catch(SQLException ignored) { }
            }
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
		}    
    }

    @Override
    public List consultarRoles() throws Exception {
        //variables para la conexion
            Connection conn = Conexion.getConexion();      
       
            ResultSet result = null;
            PreparedStatement statement = null;     
            List lista = new ArrayList();
        
        try {           

            //preparacion de la consulta
            String consulta="select * from Roles";            
            statement = conn.prepareStatement(consulta); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
            
            result = statement.executeQuery(consulta);
            /////////////////////////////////////////////////////
            
            while(result.next()) {	                
                lista.add(result.getString("NombreRol"));
            }
            
            return lista;

        } catch(SQLException sqle) {
            throw new Exception("Excepción en UsuarioDAOImpl.consultarRoles: "+sqle);
        }
        finally {
			if(result != null) {
                try { result.close(); } catch(SQLException ignored) { }
            }
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
		}
    }

    @Override
    public List consultaPermisosNuevo(int idUsuario) throws Exception {
        //variables para la conexion
           Connection conn = Conexion.getConexion();  
       
            ResultSet result = null;
            PreparedStatement statement = null;     
            
            List listaPermisos = new ArrayList();
            Permiso permiso;
        try {           

            //preparacion de la consulta
            String consulta="select IdPermiso, Permiso, Activado from Permisos where IdUsuario="+idUsuario+";";
            System.out.println(consulta);
            statement = conn.prepareStatement(consulta); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
            
            result = statement.executeQuery(consulta);
            /////////////////////////////////////////////////////
            
            while(result.next()) {	
                permiso = new Permiso();
                permiso.setIdPermiso(result.getInt("IdPermiso"));
                permiso.setPermiso(result.getString("Permiso"));
                permiso.setActivado(result.getBoolean("Activado"));
                listaPermisos.add(permiso);
            }
                return listaPermisos;                             
           

        } catch(SQLException sqle) {
            throw new Exception("Excepción en UsuarioDAOImpl.consultaPermisosNuevo: "+sqle);
        }
        finally {
			if(result != null) {
                try { result.close(); } catch(SQLException ignored) { }
            }
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
		}    
    }

    @Override
    public boolean modificarPerfil(Usuario usuario) throws Exception {
        //variables para la conexion
           Connection conn = Conexion.getConexion();    
       
            ResultSet result = null;
            PreparedStatement statement = null; 
            
            String sql;
            sql = "UPDATE Usuarios SET Dni = '"+usuario.getDni()+"',Nombre = '"+usuario.getNombre()+"' , Apellidos = '"+usuario.getApellidos()+"', Direccion = '"+usuario.getDireccion()+"', Telefono = '"+usuario.getTelefono()+"', Email = '"+usuario.getEmail()+"'  WHERE IdUsuario = "+usuario.getIdUsuario();
            System.out.println(sql);
            try{
                statement = conn.prepareStatement(sql);
                 int actualizado=statement.executeUpdate(sql);
                 result=statement.getResultSet();                      
		 if(actualizado!=0) {                          
                            return true;
		}else{
                            System.out.println("No se ha actualizado el usuario");                        
                            return false;                      
                }                
            } catch(SQLException sqle) {
            throw new Exception("Excepción en UsuarioDAOImpl.consultaPermisosNuevo: "+sqle);
            }
        finally {
			if(result != null) {
                try { result.close(); } catch(SQLException ignored) { }
            }
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
		}    
    }
    
    //convertir cadena a md5 (para las contraseñas)
    public  String hash(String stringToHash)  {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(stringToHash.getBytes());
            StringBuilder sb = new StringBuilder(2 * bytes.length);
            for (int i = 0; i < bytes.length; i++) {
                int low = (int)(bytes[i] & 0x0f);
                int high = (int)((bytes[i] & 0xf0) >> 4);
                sb.append(HEXADECIMAL[high]);
                sb.append(HEXADECIMAL[low]);
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            //exception handling goes here
            return null;
        }
    }
}
