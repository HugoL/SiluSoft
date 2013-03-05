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
import es.pfc.model.Peso;
import es.pfc.model.Sesiones;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author ko
 */
public class ClienteDAOImp implements ClienteDAO {
    private static Logger logger = Logger.getLogger(ClienteDAOImp.class);
    private static org.apache.log4j.Logger registro;
    private static final char[] HEXADECIMAL = { '0', '1', '2', '3',
        '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
    
    @Override
    public Cliente create(Cliente cliente, int IdCentro) throws Exception {
       
       
       if(cliente==null){
           System.out.println("El cliente es nulo!!");
           return null;
       }
             
       boolean insertado=false;     
       
       //variables para la conexion
         Connection conn = Conexion.getConexion(); 
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
        try {           
                        String consulta= "INSERT INTO `SiluBd`.`Clientes` (`Dni`, `Nombre`, `Apellidos`,`Apellido2`,`Url`) VALUES ('"+cliente.getDni()+"', '"+cliente.getNombre()+"', '"+cliente.getApellidos()+"','"+cliente.getApellido2()+"', '"+cliente.getUrl()+"');";
			statement = conn.prepareStatement(consulta);
                        
                        System.out.println(consulta);
                        insertado=statement.execute(consulta);
                        result=statement.getResultSet();
			if(!insertado) {                           
                            return cliente;
			}else{
                            System.out.println("No se ha insertado el cliente");
                            return null;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public Cliente read(String dni) throws Exception {
       Cliente cliente= null;
       int i;
       
       //variables para la conexion
         Connection conn = Conexion.getConexion();  
       
        ResultSet result = null;
        PreparedStatement statement = null;
        String consulta = "";
        if(!"".equals(dni)){
            consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+dni+"';";  
        }else{
            System.out.println("dni vacío");
            return null;
        }
        
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;
                            cliente = new Cliente();
                            cliente.setIdCliente(result.getInt(i++));                       
                            cliente.setDni(result.getString(i++));
                            cliente.setNombre(result.getString(i++));
                            cliente.setApellidos(result.getString(i++));
                            cliente.setApellido2(result.getString(i++));
                            cliente.setEdad(result.getInt(i++));                       
                            cliente.setDireccion(result.getString(i++));
                            cliente.setTelefono(result.getString(i++));
                            cliente.setEmail(result.getString(i++));
                            cliente.setObservaciones(result.getString(i++));
                            cliente.setAltura(result.getFloat(i++));                      
                            cliente.setIndiceGrasa(result.getInt(i++));    
                            cliente.setUrl(result.getString("Url"));
                            return cliente;
                            
			}else{
                            System.out.println("No se encuentra el cliente con ese dni: "+dni);
                            return null;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public List list(int IdCentro) throws Exception {
         Connection conn = Conexion.getConexion(); 
               
        ResultSet result = null;
        PreparedStatement statement = null;
        int i;
        Cliente cliente = null;
        List list = new ArrayList();
        //Vector vector =new Vector();
        String sql="SELECT DISTINCT `Clientes`.`IdCliente`,`Clientes`.`Dni`,`Clientes`.`Nombre`, `Clientes`.`Apellidos`, `Clientes`.`Apellido2` FROM `Clientes`, `Clientes-Centros`, `Usuarios`WHERE `Clientes-Centros`.`IdCliente`=`Clientes`.`IdCliente` AND `Clientes-Centros`.`IdCentro`="+IdCentro+" ORDER BY Apellidos;";
        try {   
			statement = conn.prepareStatement(sql); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            i=1;
                            cliente = new Cliente();
                            //i++;
                            cliente.setIdCliente(result.getInt(i++));
                            cliente.setDni(result.getString(i++));
                            cliente.setNombre(result.getString(i++));
                            cliente.setApellidos(result.getString(i++));  
                            cliente.setApellido2(result.getString(i++));
                            list.add(cliente);
                            //vector.addElement(cliente);
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception(sqle);
		} finally {
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
    public List listpag(int idCentro, int numpag, int numregpag) throws Exception {
       
        Connection conn = Conexion.getConexion(); 
               
        ResultSet result = null;
        Statement st = null;  
        st=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        st.setFetchSize(numregpag);
        
        ArrayList list = new ArrayList();
        
        String sql = "SELECT DISTINCT `Clientes`.`IdCliente`,`Clientes`.`Dni`,`Clientes`.`Nombre`, `Clientes`.`Apellidos`, `Clientes`.`Apellido2` FROM `Clientes`, `Clientes-Centros`, `Usuarios`WHERE `Clientes-Centros`.`IdCliente`=`Clientes`.`IdCliente` AND `Clientes-Centros`.`IdCentro`="+idCentro+" ORDER BY Apellidos;";
        System.out.println(sql);
        try{
        result= st.executeQuery(null);
        
        int fila = numregpag * (numpag - 1) + 1;
        int cont = 1;
        
        ResultSetMetaData md = result.getMetaData();
        int numeroColumnas = md.getColumnCount();
        ArrayList alRegistro = new ArrayList(numeroColumnas);

    
        for (int i = 1; i <= numeroColumnas; i++) {
            String nomCol = md.getColumnName(i);
            alRegistro.add(nomCol);
        } 

        list.add(alRegistro);

        if (result.absolute(fila) && numregpag > 0) {
            do {
                alRegistro = new ArrayList();
                for (int i = 1; i <= numeroColumnas; i++) {
                    alRegistro.add(result.getString(i));
                }

                list.add(alRegistro);
                cont++;
                
            } 
            while (result.next() && (cont <= numregpag));
        } 
        // Se incluye el primer elemento del ArrayList con un objeto Integer
        // con el Numero de Tuplas TOTAL de la query paginada
        // Se mueve el cursor a ultima tupla
        Integer numTuplasTotal = new Integer(0);
        if (result.last()) { // Existen tuplas y el cursor esta en la ultima,
                            // basta con consultar el numero de esa tupla
            numTuplasTotal = new Integer(result.getRow());
        } 
        list.add(0, numTuplasTotal);        
    } catch (Exception e) {
    } finally {
        if(st!=null) {
            try {st.close();} catch (SQLException e) { }
        }
        if(result!=null) {                
            try { result.close(); } catch (SQLException e) { }
        }
        if(conn!=null) {
            try { conn.close(); } catch (SQLException e) { }            
        }
    }

    return (list);
        
    }

     @Override
     public List listalf(int idCentro, String letra)throws Exception{
         Connection conn = Conexion.getConexion(); 
        
       
        ResultSet result = null;
        PreparedStatement statement = null;   
        int i;
        Cliente cliente = null;
        List list = new ArrayList();
        //Vector vector =new Vector();
        String sql="SELECT DISTINCT `Clientes`.`IdCliente`,`Clientes`.`Dni`,`Clientes`.`Nombre`, `Clientes`.`Apellidos`, `Clientes`.`Apellido2` FROM `Clientes`, `Clientes-Centros`, `Usuarios`WHERE `Clientes-Centros`.`IdCliente`=`Clientes`.`IdCliente` AND `Clientes-Centros`.`IdCentro`="+idCentro+" AND `Clientes`.`Apellidos` LIKE '"+letra+"%'ORDER BY Apellidos;";
        try {   
			statement = conn.prepareStatement(sql); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            i=1;
                            cliente = new Cliente();
                            //i++;
                            cliente.setIdCliente(result.getInt(i++));
                            cliente.setDni(result.getString(i++));
                            cliente.setNombre(result.getString(i++));
                            cliente.setApellidos(result.getString(i++));  
                            cliente.setApellido2(result.getString(i++));
                            list.add(cliente);
                            //vector.addElement(cliente);
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception(sqle);
		} finally {
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
    public boolean delete(int id) throws Exception {
        boolean eliminado=false;
        int i = 0;
       
       //variables para la conexion
        Connection conn = Conexion.getConexion(); 
       
        ResultSet result = null;
        PreparedStatement statement = null;
                           
       try {    
			statement = conn.prepareStatement("DELETE FROM `SiluBd`.`Clientes` WHERE IdCliente='"+id+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        String consulta= "DELETE FROM `SiluBd`.`Clientes` WHERE IdCliente='"+id+"';";                       
                        //statement.setString(i++, Dni);
                        eliminado=statement.execute(consulta);
                        result=statement.getResultSet();
			if(eliminado==true) {                           
                            return eliminado;
			}else{
                            System.out.println("No se ha eliminado el cliente");                            
                            return eliminado;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public Cliente update(Cliente cliente) throws Exception {
       int actualizado;
       int Id = cliente.getIdCliente();
       String Dni = cliente.getDni(); 
       String Nombre = cliente.getNombre();
       String Apellidos = cliente.getApellidos();
       int Edad = cliente.getEdad();
       String Direccion = cliente.getDireccion();
       String Telefono = cliente.getTelefono();
       String Email = cliente.getEmail();
       String Observaciones = cliente.getObservaciones();  
       float Altura = cliente.getAltura();
       String Apellido2 = cliente.getApellido2();
       
        //variables para la conexion
         Connection conn = Conexion.getConexion();     
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
        //Pido conexion       
       try {    
                        String consulta= "UPDATE  `SiluBd`.`Clientes` SET  `Dni`= '"+Dni+"',`Nombre` =  '"+Nombre+"', `Apellidos` = '"+Apellidos+"',`Apellido2` = '"+Apellido2+"',  `Edad` = '"+Edad+"', `Direccion` = '"+Direccion+"', `Telefono` = '"+Telefono+"', `Email` = '"+Email+"', `Observaciones` = '"+Observaciones+"', `Altura` = '"+Altura+"' WHERE  `Clientes`.`IdCliente` =  '"+Id+"';";
                        statement = conn.prepareStatement(consulta); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY

                        System.out.println("consulta: "+consulta);
                        actualizado=statement.executeUpdate(consulta);
                        result=statement.getResultSet();                      
			if(actualizado!=0) {                          
                            return cliente;
			}else{
                            System.out.println("No se ha actualizado el cliente");                        
                            return null;                      
                        }


		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp update..."+sqle);
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
    public List find(int Id, String Dni, String Nombre, String Apellido1, String Apellido2) throws Exception {
       Cliente cliente= null;       
       int i;
       
       //variables para la conexion
         Connection conn = Conexion.getConexion();    
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        if(Id!=0){
            consulta="SELECT * FROM `SiluBd`.`Clientes` WHERE IdCliente='"+Id+"';";
        }else{
            if(!"".equals(Dni)){ //busco por dni
                consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';";
            
            }else{              
                if(!"".equals(Nombre) && !"".equals(Apellido1) && !"".equals(Apellido2)){ //busco por nombre y apellidos
                    consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Nombre='"+Nombre+"' AND Apellidos='"+Apellido1+"' AND Apellido2='"+Apellido2+"';";    
                }else{
                    //busco por apellidos
                    if(!"".equals(Apellido1) && !"".equals(Apellido2)){
                        consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Apellidos='"+Apellido1+"' AND Apellido2='"+Apellido2+"';";    
                    }else{
                        if(!"".equals(Nombre) && !"".equals(Apellido1)){                            consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Nombre='"+Nombre+"' AND Apellidos='"+Apellido1+"';";    
                            consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Nombre='"+Nombre+"' AND Apellidos='"+Apellido1+"';";    
                        }else{
                            //busco por nombre y apellido2
                            if(!"".equals(Nombre) && !"".equals(Apellido2)){
                                consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Nombre='"+Nombre+"' AND Apellido2='"+Apellido2+"';";    
                            }else{
                                if(!"".equals(Nombre)){//busco por nombre
                                    consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Nombre='"+Nombre+"';";
                                }else{
                                    //busco por apellido2
                                    if(!"".equals(Apellido2)){
                                        consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Apellido2='"+Apellido2+"';";    
                                    }else{
                                        consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE Apellidos='"+Apellido1+"';";
                                    }
                                }
                            }
                        }
                    }                    
                    
                }
            }
           }
        
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        
			while(result.next()) {
                            i=1;
                            
                            cliente = new Cliente();
                            //i++;
                            cliente.setIdCliente(result.getInt(i++));
                            cliente.setDni(result.getString(i++));
                            cliente.setNombre(result.getString(i++));
                            cliente.setApellidos(result.getString(i++));
                            cliente.setApellido2(result.getString(i++));
                            cliente.setEdad(result.getInt(i++));                       
                            cliente.setDireccion(result.getString(i++));
                            cliente.setTelefono(result.getString(i++));
                            cliente.setEmail(result.getString(i++));
                            cliente.setObservaciones(result.getString(i++));
                            cliente.setAltura(result.getFloat(i++));                    
                            list.add(cliente);
                            
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public boolean clientecentro(int IdCliente, int id) throws Exception {
        
        boolean insertado=false;
         //variables para la conexion
         Connection conn = Conexion.getConexion(); 
       
        ResultSet result = null;
        PreparedStatement statement = null;
        try{
                            String consulta2= "INSERT INTO `SiluBd`.`Clientes-Centros` (`IdCliente`, `IdCentro`) VALUES ('"+IdCliente+"', '"+id+"');";                      
                            statement = conn.prepareStatement(consulta2);
                            insertado=statement.execute(consulta2);
                            if(!insertado){                              
                                return true;
                            }else{
                                return false;
                            }
                            
        } catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp clientecentro()..."+sqle);
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
    public boolean clientepeso(int IdCliente, float peso, String fecha) throws Exception {
        boolean insertado=false;
         //variables para la conexion
         Connection conn = Conexion.getConexion();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        try{
                            String consulta= "INSERT INTO `SiluBd`.`Peso` (`IdCliente`, `Peso`, `Fecha`) VALUES ('"+IdCliente+"', '"+peso+"', '"+fecha+"');";                      
                            
                            statement = conn.prepareStatement(consulta);
                            insertado=statement.execute(consulta);
                            if(!insertado){                              
                                return true;
                            }else{
                                return false;
                            }
                            
        } catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp clientepeso()..."+sqle);
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
    public List readPeso(int idCliente) throws Exception {
        //variables para la conexion
         Connection conn = Conexion.getConexion();       
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        Peso peso;
        String consulta= "SELECT `Peso`.`Peso`, `Peso`.`Fecha` FROM `Peso` WHERE IdCliente="+idCliente+";";      
        int i=0;
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            peso = new Peso();
                            i=1;                          
                            peso.setPeso(result.getFloat(i++)); 
                            peso.setFecha(result.getString(i++));
                            list.add(peso);
                            
			}
                        return list;                                               

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public float comprobarpeso(int IdCliente, String fecha) throws Exception {
        //variables para la conexion
         Connection conn = Conexion.getConexion();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT `Peso`.`Peso` FROM `Peso` WHERE IdCliente="+IdCliente+" AND Fecha="+fecha+";";      
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.first()) {
                            i=1;                          
                            float peso = result.getFloat(i);     
                            System.out.println("El cliente ya tiene un peso asignado a esa fecha");
                            return peso;
			}else{
                            return 0;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public boolean insertaSesionesCliente(Sesiones sesiones,int idCliente) throws Exception {
        Connection conn = Conexion.getConexion();  
       
        boolean result;
        PreparedStatement statement = null;       
        String consulta= "INSERT INTO `SesionesCliente` (idCliente,Fit,Confort,ResFit,ResConfort) VALUES ("+sesiones.getIdCliente()+", "+sesiones.getFit()+" ,"+sesiones.getConfort()+", "+sesiones.getResFit()+", "+sesiones.getResConfort()+");";      
        System.out.println("consulta: "+consulta);
        try{
             statement = conn.prepareStatement(consulta);
             result=statement.execute(consulta);                    
             if(result!=false) {
                System.out.println("ClienteDAOImp.insertaSesionesCliente devuelve TRUE");
                return true;                         
             }
             System.out.println("ClienteDAOImp.insertaSesionesCliente devuelve FALSE");
             
             return true;
        } catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
        }
        //cierro la conexion    
        finally {           
		if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
	}
    }

    @Override
    public Sesiones listaSesionesCliente(int idCliente) throws Exception {
        Sesiones sesiones= new Sesiones();
        Connection conn = Conexion.getConexion();     
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT * FROM `SesionesCliente` WHERE IdCliente ="+idCliente+";"; 
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1; 
                            i++;
                            sesiones.setFit(result.getInt(i++));
                            sesiones.setConfort(result.getInt(i++));
                            sesiones.setResFit(sesiones.getFit()-result.getInt(i++));
                            sesiones.setResConfort(sesiones.getConfort()-result.getInt(i++));
                            System.out.println("fit: "+sesiones.getFit()+"resfit: "+sesiones.getResFit());
                            System.out.println("confort: "+sesiones.getConfort()+"resconfort: "+sesiones.getResConfort());
                            //HACER EL CALCULO DEL PRECIO
                            sesiones.setTotal(188);
                            return sesiones;
			}
                        System.out.println("ClienteDAOImp listasesiones devuelve NULL");
                        return null;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public boolean insertaObservacionCliente(Observacion observacion) throws Exception {
       Connection conn = Conexion.getConexion();     
       
       boolean result;
        PreparedStatement statement = null;
        
        String consulta= "INSERT INTO Observacion (IdCliente,Motivo,TratamientosAnteriores,VariacionesPeso,PesoMax,PesoMin,PesoIdeal,TallaActual,TallaDeseada,TensionMax,TensionMin,Enfermedades,Alergias,Terapias,Menstruaciones,Embarazos,Partos,Abortos,MetodoAnticonceptivo,Diuresis,Suenyo,RitmoIntestinal,ActividadFisica,Digestiones,PesadezPiernas,Dolor,Calambres,PiesFrios,ManosFrias) VALUES ("+observacion.getIdCliente()+",'"+observacion.getMotivo()+"','"+observacion.getTratamientosAnteriores()+"','"+observacion.getVariacionesPeso()+"',"+observacion.getPesoMax()+","+observacion.getPesoMin()+","+observacion.getPesoIdeal()+","+observacion.getTallaActual()+","+observacion.getTallaDeseada()+","+observacion.getTensionMax()+","+observacion.getTensionMin()+",'"+observacion.getEnfermedades()+"','"+observacion.getAlergias()+"','"+observacion.getTerapias()+"','"+observacion.getMenstruaciones()+"',"+observacion.getEmbarazos()+","+observacion.getPartos()+","+observacion.getAbortos()+",'"+observacion.getMetodoAnticonceptivo()+"','"+observacion.getDiuresis()+"','"+observacion.getSuenyo()+"','"+observacion.getRitmoIntestinal()+"','"+observacion.getActividadFisica()+"','"+observacion.getDigestiones()+"','"+observacion.getPesadezPiernas()+"','"+observacion.getDolor()+"',"+observacion.getCalambres()+","+observacion.getPiesFrios()+","+observacion.getManosFrias()+");";      
        System.out.println(consulta);
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta);
                        result=statement.execute(consulta); 
                       
			return true;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
                }
                
              
                //cierro la conexion    
                finally {
			
			if(statement != null) {
                        try { statement.close(); } catch(SQLException ignored) { }
                    }
			if(conn != null) {
                        try { conn.close(); } catch(SQLException ignored) { }
                    }
		}
    }

    @Override
    public Observacion listarObservacionCliente(int idCliente) throws Exception {
        Observacion observacion = new Observacion();
        Connection conn = Conexion.getConexion();    
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT * FROM Observacion WHERE IdCliente ="+idCliente+";";      
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;                          
                            observacion.setIdCliente(result.getInt(i++));
                            observacion.setMotivo(result.getString(i++));
                            observacion.setTratamientosAnteriores(result.getString(i++));
                            observacion.setVariacionesPeso(result.getString(i++));
                            observacion.setPesoMax(result.getFloat(i++));
                            observacion.setPesoMin(result.getFloat(i++));
                            observacion.setPesoIdeal(result.getFloat(i++));
                            observacion.setTallaActual(result.getFloat(i++));
                            observacion.setTallaDeseada(result.getFloat(i++));
                            observacion.setTensionMax(result.getInt(i++));
                            observacion.setTensionMin(result.getInt(i++));
                            observacion.setEnfermedades(result.getString(i++));
                            observacion.setAlergias(result.getString(i++));
                            observacion.setTerapias(result.getString(i++));
                            observacion.setMenstruaciones(result.getString(i++));
                            observacion.setEmbarazos(result.getBoolean(i++));
                            observacion.setPartos(result.getBoolean(i++));
                            observacion.setAbortos(result.getBoolean(i++));
                            observacion.setMetodoAnticonceptivo(result.getString(i++));
                            observacion.setDiuresis(result.getString(i++));
                            observacion.setSuenyo(result.getString(i++));
                            observacion.setRitmoIntestinal(result.getString(i++));
                            observacion.setActividadFisica(result.getString(i++));
                            observacion.setDigestiones(result.getString(i++));
                            observacion.setPesadezPiernas(result.getString(i++));
                            observacion.setDolor(result.getString(i++));
                            observacion.setCalambres(result.getBoolean(i++));
                            observacion.setPiesFrios(result.getBoolean(i++));
                            observacion.setManosFrias(result.getBoolean(i++));
                            
                            return observacion;
			}
                        observacion = null;
                        return observacion;                      
                     
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public boolean insertarAsistenciaFitCliente(int idCliente) throws Exception {
        int actualizado;
        Connection conn = Conexion.getConexion();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "UPDATE SesionesCliente SET ResFit=ResFit+1 WHERE idCliente="+idCliente+";";      
        System.out.println(consulta);
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta);
                        actualizado=statement.executeUpdate(consulta);
                        
                        result=statement.getResultSet();                      
			if(actualizado!=0) {                          
                            return true;
			}else{
                            System.out.println("No se ha actualizado la asistencia");                        
                            return false;                      
                        }

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public boolean insertarAsistenciaConfortCliente(int idCliente) throws Exception {
        int actualizado;
        Connection conn = Conexion.getConexion();     
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "UPDATE SesionesCliente SET ResConfort=ResConfort+1 WHERE idCliente="+idCliente+";";      
        System.out.println(consulta);
        //Pido conexion       
       try {        
                        statement = conn.prepareStatement(consulta);
                        actualizado=statement.executeUpdate(consulta);
                        result=statement.getResultSet();                      
			if(actualizado!=0) {                          
                            return true;
			}else{
                            System.out.println("No se ha actualizado la asistencia");                        
                            return false;                      
                        }

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public int leeIdQr(String url) throws Exception {
        Connection conn = Conexion.getConexion();    
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT IdCliente FROM Clientes WHERE Url ='"+url+"';";    
        System.out.println(consulta);
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;                          
                            System.out.println("Id para QR: "+result.getInt("IdCliente"));
                            return result.getInt("IdCliente");
			}
                        return 0;                   

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public boolean actualizaSesionesCliente(Sesiones sesiones) throws Exception { 
        Connection conn = Conexion.getConexion();
       
        int result;
        PreparedStatement statement = null;       
        String consulta= "UPDATE SesionesCliente SET Fit=Fit+"+sesiones.getFit()+", Confort=Confort+"+sesiones.getConfort()+" WHERE IdCliente = "+sesiones.getIdCliente()+";";      
        System.out.println("consulta: "+consulta);
        try{
             statement = conn.prepareStatement(consulta);
             result=statement.executeUpdate(consulta);                    
             if(result==0) {
                System.out.println("ClienteDAOImp.actualizaSesionesCliente actualiza registros");
                return true;                         
             }
             System.out.println("ClienteDAOImp.actualizaSesionesCliente no actualiza registros");
             
             return true;
        } catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
        }
        //cierro la conexion    
        finally {
		if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
	}
    }

    @Override
    public boolean asociarClientesCentro(int idcliente, int idcentro) throws Exception {
        Connection conn = Conexion.getConexion();    
       
        int result;
        PreparedStatement statement = null;       
        String consulta= "INSERT INTO Clientes-Centros (IdCliente, IdCentro) VALUES ("+idcliente+", "+idcentro+") ;";      
        System.out.println("consulta: "+consulta);
        try{
             statement = conn.prepareStatement(consulta);
             result=statement.executeUpdate(consulta);                    
             if(result==0) {                                 
                return true;                         
             }
             logger.debug(result);           
             return true;
        } catch(SQLException sqle) {
            logger.debug("Error en ClienteDAOImp.asociarClientesCentro: "+sqle);
            throw new Exception("Excepcion ClienteDAOImp..."+sqle);
        }
        //cierro la conexion    
        finally {
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
	}
    }

    @Override
    public List listNoCentro() throws Exception {
        Connection conn = Conexion.getConexion();
        
       
        ResultSet result = null;
        PreparedStatement statement = null;       
        int i;
        Cliente cliente = null;
        List list = new ArrayList();
        //Vector vector =new Vector();
        String sql="SELECT DISTINCT `Clientes`.`IdCliente`,`Clientes`.`Dni`,`Clientes`.`Nombre`, `Clientes`.`Apellidos`, `Clientes`.`Apellido2` FROM `Clientes`, `Clientes-Centros`, `Usuarios`WHERE `Clientes-Centros`.`IdCliente`<>`Clientes`.`IdCliente` ORDER BY Apellidos;";
        try {   
			statement = conn.prepareStatement(sql); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            i=1;
                            cliente = new Cliente();
                            //i++;
                            cliente.setIdCliente(result.getInt(i++));
                            cliente.setDni(result.getString(i++));
                            cliente.setNombre(result.getString(i++));
                            cliente.setApellidos(result.getString(i++));  
                            cliente.setApellido2(result.getString(i++));
                            list.add(cliente);
                            //vector.addElement(cliente);
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception(sqle);
		} finally {
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
    public Cliente readPorId(int id) throws Exception {
       Cliente cliente= null;      
       int i;
       
       //variables para la conexion
        Connection conn = Conexion.getConexion();   
       
        ResultSet result = null;
        PreparedStatement statement = null;
        String consulta = "";
        if(id!=0){
            consulta= "SELECT * FROM `SiluBd`.`Clientes` WHERE IdCliente='"+id+"';";  
        }else{
            System.out.println("dni vacío");
            return null;
        }
        
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;
                            cliente = new Cliente();
                            cliente.setIdCliente(result.getInt(i++));                       
                            cliente.setDni(result.getString(i++));
                            cliente.setNombre(result.getString(i++));
                            cliente.setApellidos(result.getString(i++));
                            cliente.setApellido2(result.getString(i++));
                            cliente.setEdad(result.getInt(i++));                       
                            cliente.setDireccion(result.getString(i++));
                            cliente.setTelefono(result.getString(i++));
                            cliente.setEmail(result.getString(i++));
                            cliente.setObservaciones(result.getString(i++));
                            cliente.setAltura(result.getFloat(i++));                      
                            cliente.setIndiceGrasa(result.getInt(i++));    
                            cliente.setUrl(result.getString("Url"));
                            return cliente;
                            
			}else{
                            System.out.println("No se encuentra el cliente con ese dni: "+id);
                            return null;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public Cliente login(String identificador, String password) throws Exception {
        //variables para la conexion
        Connection conn = Conexion.getConexion();   
       
        ResultSet result = null;
        PreparedStatement statement = null;
        Cliente cliente;
        String consulta= "SELECT IdCliente, Dni, Nombre, Apellidos, Apellido2, Edad, Direccion, Teleono, Email,Altura,IMC FROM `SiluBd`.`Clientes` WHERE Dni = ? AND Pass = ?;";
        
        try {    
                        statement = conn.prepareStatement(consulta); 
                        statement.setString(1, identificador);
                        statement.setString(2, password);
                        result=statement.executeQuery();
                       
			if(result.next()) {                           
                            cliente = new Cliente();
                            cliente.setIdCliente(result.getInt("IdCliente"));                       
                            cliente.setDni(result.getString("Dni"));
                            cliente.setNombre(result.getString("Nombre"));
                            cliente.setApellidos(result.getString("Apellidos"));
                            cliente.setApellido2(result.getString("Apellido2"));
                            cliente.setEdad(result.getInt("Edad"));                       
                            cliente.setDireccion(result.getString("Direccion"));
                            cliente.setTelefono(result.getString("Telefono"));
                            cliente.setEmail(result.getString("Email"));
                            cliente.setObservaciones(result.getString("Altura"));
                            cliente.setAltura(result.getFloat("IMC")); 
                            return cliente;                            
			}else{
                            System.out.println("No se encuentra el cliente con ese identificador: "+identificador);
                            return null;
                        }                        
		} catch(SQLException sqle) {
			throw new Exception("Excepcion ClienteDAOImp..."+sqle);
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
    public String insertarPassword(int id, String password) throws Exception {
        Connection conn = Conexion.getConexion();    
       
        int result;   
        PreparedStatement statement = null;       
        String consulta= "INSERT INTO Clientes(Password) VALUES (?) WHERE IdCliente = ? ;";      
        System.out.println("consulta: "+consulta);
        try{
             statement = conn.prepareStatement(consulta);
             statement.setString(1, hash(password));
             statement.setInt(2, id);
             result=statement.executeUpdate(consulta);                    
             if(result==0) {                                 
                return password;                         
             }
             logger.debug(result);           
             return null;
        } catch(SQLException sqle) {
            logger.debug("Error en ClienteDAOImp.generarPassword: "+sqle);
            throw new Exception("Excepcion ClienteDAOImp..."+sqle);
        }
        //cierro la conexion    
        finally {
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
	}
    }        

    @Override
    public String renovarPassword(int id, String password) throws Exception {
        Connection conn = Conexion.getConexion();    
       
        int result;
        PreparedStatement statement = null;       
        String consulta= "UPDATE SET (Password = ?) WHERE IdCliente = ?;";      
        System.out.println("consulta: "+consulta);
        try{
             statement = conn.prepareStatement(consulta);
             statement.setString(1, hash(password));
             statement.setInt(2, id);
             result=statement.executeUpdate(consulta);                    
             if(result==0) {                                 
                return password;                         
             }
             logger.debug(result);           
             return null;
        } catch(SQLException sqle) {
            logger.debug("Error en ClienteDAOImp.generarPassword: "+sqle);
            throw new Exception("Excepcion ClienteDAOImp..."+sqle);
        }
        //cierro la conexion    
        finally {
			if(statement != null) {
                try { statement.close(); } catch(SQLException ignored) { }
            }
			if(conn != null) {
                try { conn.close(); } catch(SQLException ignored) { }
            }
	}
    }
    
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