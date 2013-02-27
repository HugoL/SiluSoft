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

import es.pfc.model.Agenda;
import es.pfc.model.Evento;
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
public class AgendaDAOImp implements AgendaDAO {

   
    @Override
    public Agenda listarEventos(String sala, int idCentro,Date fecha) throws Exception {
         //variables para la conexion
        Connection conn = Conexion.getConexion();
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta = "";
        int i=0;
        Agenda agenda;
        consulta= "SELECT * FROM `SiluBd`.`Agenga` WHERE IdCentro="+idCentro+" AND Fecha='"+fecha+"' AND Sala = (SELECT IdSala FROM Salas WHERE Nombre='"+sala+"' AND IdCentro = "+idCentro+") ;";  
        System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        agenda = new Agenda();
			if(result.next()) {
                            i=1;
                            
                            agenda.setIdAgenda(result.getInt("IdAgenda"));
                            agenda.setFecha(result.getDate("Fecha"));
                            agenda.setHora(result.getTime("Hora"));  
                            agenda.setEvento90(result.getString("Evento90"));
                            agenda.setEvento93(result.getString("Evento93"));
                            agenda.setEvento10(result.getString("Evento10"));
                            agenda.setEvento103(result.getString("Evento103"));
                            agenda.setEvento11(result.getString("Evento11"));
                            agenda.setEvento113(result.getString("Evento113"));
                            agenda.setEvento12(result.getString("Evento12"));
                            agenda.setEvento123(result.getString("Evento123"));
                            agenda.setEvento13(result.getString("Evento13"));
                            agenda.setEvento133(result.getString("Evento133"));
                            agenda.setEvento14(result.getString("Evento14"));
                            agenda.setEvento143(result.getString("Evento143"));
                            agenda.setEvento15(result.getString("Evento15"));
                            agenda.setEvento153(result.getString("Evento153"));
                            agenda.setEvento16(result.getString("Evento16"));
                            agenda.setEvento163(result.getString("Evento163"));
                            agenda.setEvento17(result.getString("Evento17"));
                            agenda.setEvento173(result.getString("Evento173"));
                            agenda.setEvento18(result.getString("Evento18"));
                            agenda.setEvento183(result.getString("Evento183"));
                            agenda.setEvento19(result.getString("Evento19"));
                            agenda.setEvento193(result.getString("Evento193"));
                            agenda.setEvento20(result.getString("Evento20"));
                            agenda.setEvento203(result.getString("Evento203"));
                            agenda.setEvento21(result.getString("Evento21"));
                            agenda.setSala(result.getString("Sala"));
                            agenda.setIdCentro(result.getInt("IdCentro"));
                            return agenda;
                            
			}else{                         
                            //agenda.setIdAgenda(result.getInt("IdAgenda"));
                            //agenda.setFecha(result.getDate("Fecha"));
                            //agenda.setHora(result.getTime("Hora"));  
                            agenda.setEvento90("");
                            agenda.setEvento93("");
                            agenda.setEvento10("");
                            agenda.setEvento103("");
                            agenda.setEvento11("");
                            agenda.setEvento113("");
                            agenda.setEvento12("");
                            agenda.setEvento123("");
                            agenda.setEvento13("");
                            agenda.setEvento133("");
                            agenda.setEvento14("");
                            agenda.setEvento143("");
                            agenda.setEvento15("");
                            agenda.setEvento153("");
                            agenda.setEvento16("");
                            agenda.setEvento163("");
                            agenda.setEvento17("");
                            agenda.setEvento173("");
                            agenda.setEvento18("");
                            agenda.setEvento183("");
                            agenda.setEvento19("");
                            agenda.setEvento193("");
                            agenda.setEvento20("");
                            agenda.setEvento203("");
                            agenda.setEvento21("");
                            
                            //agenda.setSala(result.getString("Sala"));
                            //agenda.setIdCentro(result.getInt("IdCentro"));
                            return agenda;
                        }                 

        } catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public boolean insertarEvento(Agenda agenda, String evento) throws Exception {
        Connection conn = Conexion.getConexion();  
       
        //ResultSet result = null;
        PreparedStatement statement = null;
        String consulta = "";
        int i=0;
        
            consulta= "INSERT INTO `SiluBd`.`Agenga` (Fecha, "+evento+",Sala,IdCentro) VALUES ('"+agenda.getFecha()+"','"+agenda.getActo()+"','"+agenda.getSala()+"',"+agenda.getIdCentro()+") ;";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        boolean result=statement.execute(consulta);
                        agenda = new Agenda();
			if(result) {
                            return true;      
			}else{
                            return false;
                        }                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public boolean actualizarEvento(Agenda agenda, String evento) throws Exception{
        Connection conn = Conexion.getConexion(); 
       
        //ResultSet result = null;
        PreparedStatement statement = null;        
        String consulta = "";      
        
            consulta= "UPDATE `SiluBd`.`Agenga` SET "+evento+"='"+agenda.getActo()+"' WHERE Fecha='"+agenda.getFecha()+"' AND IdCentro="+agenda.getIdCentro()+" AND Sala="+agenda.getSala()+";";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        int result=statement.executeUpdate(consulta);
                        agenda = new Agenda();
			if(result>0) {
                            return true;      
			}else{
                            return false;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public List listaIdSala(String sala, int idCentro) throws Exception {
        Connection conn = Conexion.getConexion();
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        int i=0;
        Agenda agenda;
            consulta= "SELECT IdSala,Nombre FROM Salas WHERE Nombre='"+sala+"' AND IdCentro = "+idCentro+" ;";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        agenda = new Agenda();
			while(result.next()) {
                            i=1;
                            list.add(result.getInt(i++));   
                            list.add(result.getString(i++));
                        }
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public boolean existenEventos(int idCentro, Date fecha, int sala) throws Exception {
        Connection conn = Conexion.getConexion();    
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta = "";
        int i=0;
        Agenda agenda;
            consulta= "SELECT IdAgenda FROM `SiluBd`.`Agenga` WHERE IdCentro="+idCentro+" AND Fecha='"+fecha+"' AND Sala="+sala+";";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        agenda = new Agenda();
			if(result.next()) {                          
                            return true;                           
			}else{                          
                            return false;
                        }                      

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public List listarSalas(int idCentro) throws Exception {
         Connection conn = Conexion.getConexion();
       
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        int i=0;
        
            consulta= "SELECT IdSala,Nombre FROM Salas WHERE IdCentro = "+idCentro+";";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        Agenda agenda;
			while(result.next()) {
                            i=1;
                            agenda=new Agenda();
                            agenda.setIdSala(result.getInt(i++));
                            agenda.setSala(result.getString(i++));                           
                            list.add(agenda);
                        }
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public List numeroEventos() throws Exception {
         Connection conn = Conexion.getConexion();     
       
        Evento evento;
        ResultSet result = null;
        PreparedStatement statement = null;
        List list = new ArrayList();
        String consulta = "";
        
            consulta= "SELECT * FROM Eventos;";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
			while(result.next()) {          
                            evento = new Evento();
                            evento.setEvento(result.getString("Evento"));
                            evento.setColumna(result.getString("ColumnaEvento"));
                            list.add(evento);
                        }
                        return list;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public Agenda listarMisEventos(String sala, int idCentro, Date fecha, int evento) throws Exception {
        //variables para la conexion
         Connection conn = Conexion.getConexion();     
       
        ResultSet result = null;
        PreparedStatement statement = null;
        
        String consulta = "";

        consulta= "SELECT * FROM `SiluBd`.`Dia` WHERE IdCentro="+idCentro+" AND Fecha='"+fecha+"' AND Evento="+evento+" AND IdSala = (SELECT IdSala FROM Salas WHERE Nombre='"+sala+"' AND IdCentro = "+idCentro+") ;";  
        System.out.println("Consulta CRITICA: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();
                        Agenda agenda = new Agenda();
			if(result.next()) {                            
                            agenda.setIdAgenda(result.getInt("IdDia"));
                            agenda.setFecha(result.getDate("Fecha"));                            
                            agenda.setEvento(result.getString("Evento"));                            
                            System.out.println("AgendaDAOImp.listarMisEventos evento: "+agenda.getEvento());
                            agenda.setSala(result.getString("IdSala"));
                            agenda.setIdCentro(result.getInt("IdCentro"));
                            agenda.setActo(result.getString("Acto"));
                            return agenda;
                            
			}else{                         
                            agenda.setEvento(""); 
                            agenda.setActo("");
                            return agenda;
                        }                 

        } catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public boolean insertaEstadoEvento(String evento, int idCentro, int idSala, Date fecha, String estado, int idUsuario, int valoracion) throws Exception {
         Connection conn = Conexion.getConexion();     
       
        //ResultSet result = null;
        PreparedStatement statement = null;        
        String consulta = "";
        int i=0;
        
            consulta= "INSERT INTO `SiluBd`.`EstadoEventos` (Evento, Centro,Sala,Fecha,Estado,Usuario,Valoracion) VALUES ('"+evento+"',"+idCentro+","+idSala+",'"+fecha+"','"+estado+"',"+idUsuario+","+valoracion+") ;";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        boolean result=statement.execute(consulta);      
			if(result) {
                            return true;      
			}else{
                            return false;
                        }
                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public Agenda verEstadoEvento(Agenda agenda,String evento) throws Exception {
        Connection conn = Conexion.getConexion();  
       
        ResultSet result = null;
        PreparedStatement statement = null;        
        String consulta = "";
        int i=0;
            consulta= "SELECT Estado,Usuario,Valoracion FROM EstadoEventos WHERE Evento'"+evento+"' AND IdCentro = "+agenda.getIdCentro()+" AND Sala ="+agenda.getSala()+" AND Fecha = "+agenda.getFecha()+" ;";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
       try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        result=statement.executeQuery();                        
			if(result.next()) {
                            i=1;
                            agenda.setEstado(result.getString("Estado"));
                            agenda.setValoracion(result.getInt("Valoracion"));
                            return agenda;
                        }
                        return null;

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    public boolean actualizaEstadoEvento(String evento, int idCentro, int idSala, Date fecha, String estado, int idUsuario, int valoracion) throws Exception {
         Connection conn = Conexion.getConexion(); 
               
        PreparedStatement statement = null;
        String consulta = "";        
        
            consulta= "UPDATE `SiluBd`.`EstadoEventos` SET Estado='"+estado+"', Usuario="+idUsuario+", Valoracion="+valoracion+" WHERE Fecha='"+fecha+"' AND Centro="+idCentro+" AND Sala="+idSala+" AND Evento='"+evento+"';";  
            System.out.println("Consulta: "+consulta);
        //Pido conexion       
        try {    
			//statement = conn.prepareStatement("SELECT * FROM `SiluBd`.`Clientes` WHERE Dni='"+Dni+"';"); //, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
                        statement = conn.prepareStatement(consulta); 
                        int result=statement.executeUpdate(consulta);                        
			if(result>0) {
                            return true;      
			}else{
                            return false;
                        }                        

		} catch(SQLException sqle) {
			throw new Exception("Excepcion AgendaDAOImp..."+sqle);
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
    
}
