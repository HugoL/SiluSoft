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

import es.pfc.model.TestCliente;
import es.pfc.model.Cliente;
import es.pfc.model.Medidas;
import es.pfc.model.Observacion;
import es.pfc.model.Peso;
import es.pfc.model.PreguntaTest;
import es.pfc.model.Sesiones;
import es.pfc.model.TestCliente;
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
public class TestDAOImp implements TestDAO{

    @Override
    public TestCliente leeclienteTest(int id) throws Exception {
         TestCliente test = new TestCliente();
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT * FROM `Clientes-Test` WHERE idCliente="+id+";";      
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {
                            i=1;                          
                            test.setResultado(result.getString("Resultado"));   
                            test.setIdCliente(result.getInt("idCliente"));
                            test.setFecha(String.valueOf(result.getDate("Fecha")));
			}
                        return test;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public List leepreguntasTest() throws Exception {
        
        PreguntaTest pregunta = null;
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        
        String consulta= "SELECT * FROM `PreguntasTest`;";      
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            pregunta = new PreguntaTest();
                            pregunta.setTexto(result.getString("Pregunta"));
                            pregunta.setIdPregunta(result.getInt("IdPregunta"));
                            list.add(pregunta);                            
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public boolean insertaclienteTest(TestCliente test) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean result;
        PreparedStatement statement = null;
        
        String consulta= "INSERT INTO `Clientes-Test` (idCliente, Resultado, Fecha) VALUES ("+test.getIdCliente()+", '"+test.getResultado()+"', '"+test.getFecha()+"');";      
        System.out.println(consulta);
        //Pido conexion       
        try {                                                  
                        statement = conn.prepareStatement(consulta);
                        result=statement.execute(consulta);
                        
			if(result) {
                            return true;                         
			}
                        return false;

	} catch(SQLException sqle) {
		throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public List leerespuestasTest() throws Exception {
        TestCliente test;
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        
        String consulta= "SELECT * FROM `RespuestasTest`;";      
        int i=0;
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {                                             
                            list.add(result.getString("Respuesta1"));
                            list.add(result.getString("Respuesta2"));
                            list.add(result.getString("Respuesta3"));
                            list.add(result.getString("Respuesta4"));
			}
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public List leeresultadosTest(int idCliente) throws Exception {
        PreguntaTest pregunta = null;
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List lista = new ArrayList();
        
        String consulta= "SELECT * FROM `ResultadosTest` WHERE IdCliente = "+idCliente+";";  

        //Pido conexion       
        try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			while(result.next()) {
                            pregunta = new PreguntaTest();
                            pregunta.setIdCliente(result.getInt("IdCliente"));
                            pregunta.setIdPregunta(result.getInt("IdPregunta"));
                            pregunta.setRespelegida(result.getInt("Respuesta"));  
                            lista.add(pregunta);
			}
                        return lista;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public PreguntaTest leeTextoPregunta(PreguntaTest pregunta) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT Pregunta FROM `PreguntasTest` WHERE IdPregunta = "+pregunta.getIdPregunta()+";";      
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {                                             
                            pregunta.setTexto(result.getString("Pregunta"));
			}
                        return pregunta;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public PreguntaTest leeRespuestasPregunta(PreguntaTest pregunta) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT RespuestaSanguinea,RespuestaLinfatica,RespuestaBiliosa,RespuestaNerviosa FROM `RespuestasTest` WHERE IdPregunta = "+pregunta.getIdPregunta()+";";      
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next()) {                                             
                            pregunta.setRespsanguinea(result.getString("RespuestaSanguinea"));
                            pregunta.setResplinfatica(result.getString("RespuestaLinfatica"));
                            pregunta.setRespbiliosa(result.getString("RespuestaBiliosa"));
                            pregunta.setRespnerviosa(result.getString("RespuestaNerviosa"));
			}
                        return pregunta;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public boolean comprobarTest(int id) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta= "SELECT Resultado FROM `Clientes-Test` WHERE IdCliente="+ id +";";      
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                       
			if(result.next())                                             
                            return true;
			else
                            return false;
                        
		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public PreguntaTest preguntaResultado(PreguntaTest pregunta) throws Exception{
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        ResultSet result = null;
        ResultSet result2 = null;
        PreparedStatement statement = null;
        
        String resp="";
        //SEGUN EL IDPREGUNTA SABRE QUE RESPUESTA SE HA ESCOGIDO
        switch(pregunta.getRespelegida()){
            case 1:
                resp="RespuestaNerviosa";
                break;
            case 2:
                resp="RespuestaBiliosa";
                break;
            case 3:
                resp="RespuestaLinfatica";
                break;
            case 4:
                resp="RespuestaSanguinea";
                break;
            default:
                
        }
        
        String consulta1= "SELECT PreguntasTest.Pregunta FROM `PreguntasTest` WHERE IdPregunta = "+pregunta.getIdPregunta()+";";      
        String consulta2= "SELECT "+resp+" FROM RespuestasTest WHERE IdPregunta = "+pregunta.getIdPregunta()+";";
        //Pido conexion       
       try {    
                        statement = conn.prepareStatement(consulta1); 
                        result=statement.executeQuery();
                       
			if(result.next()) {                                             
                           pregunta.setTexto(result.getString("Pregunta"));
			}
                        
                        statement = conn.prepareStatement(consulta2);
                        result2=statement.executeQuery();
                        
                        if(result2.next()){
                           pregunta.setRespelegidatexto(result2.getString(resp));
                        }
                        return pregunta;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion TestDAOImp..."+sqle);
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
    public boolean insertarResultadoPregunta(PreguntaTest pregunta) throws Exception {
        Connection conn = null;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SiluBd");
        conn = ds.getConnection();      
       
        boolean result;
        PreparedStatement statement = null;
    
        String consulta= "INSERT INTO `ResultadosTest` (IdCliente, IdPregunta, Respuesta) VALUES ("+pregunta.getIdCliente()+", "+pregunta.getIdPregunta()+", "+pregunta.getRespelegida()+");";      
      
        //Pido conexion       
        try {                                                  
                        statement = conn.prepareStatement(consulta);
                        result=statement.execute(consulta);
                        
			if(!result) { //me devuelve false aunque sí que lo introduce
                            return true;                         
			}
                        return false;

	} catch(SQLException sqle) {
		throw new Exception("Excepcion TestDAOImp.insetarResultadoPregunta "+sqle);
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
