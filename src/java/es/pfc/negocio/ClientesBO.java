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

import es.pfc.dao.ClienteDAOImp;
import es.pfc.model.Cliente;
import es.pfc.model.Observacion;
import es.pfc.model.Sesiones;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko
 */
public class ClientesBO {
    
     public static Cliente esInsertado (Cliente cliente, int IdCentro) throws Exception {

            ClienteDAOImp ClienteInsertado = new ClienteDAOImp();
            Cliente micliente = new Cliente();
            boolean esInsertado = false;
            
            try {
                  micliente=ClienteInsertado.create(cliente, IdCentro);  
            } catch (Exception e) {
                  throw e;
            }

            return micliente;
      }
     
     public static List esListado (int IdCentro) throws Exception {
            
            List lista = new ArrayList();
            ClienteDAOImp ClienteListado = new ClienteDAOImp();
            boolean esInsertado = false;

            try {
                  lista = ClienteListado.list(IdCentro);  
                  if (lista != null ){
                        return lista;
                  }else{
                      System.out.println("La lista es nula");
                      return null;
                  }
              
            }catch (Exception e){
                  throw e;
            }           
      }
     
     public static List esListadoPag (int IdCentro, int pag) throws Exception{
         //numero de registros por página
         int numreg = 10;
         List lista = new ArrayList();
         ClienteDAOImp ClienteListado = new ClienteDAOImp();
         boolean esInsertado = false;

         try {
                System.out.println("listapag("+IdCentro+","+pag+","+numreg+");");
                  lista = ClienteListado.listpag(IdCentro,pag,numreg);
                  if (lista != null ){
                        return lista;
                  }else{
                      System.out.println("La lista es nula");
                      return null;
                  }              
         }catch (Exception e){
                  throw e;
         }
     }
     
     public static List esListadoAlf (int IdCentro,String letra) throws Exception {
            
            List lista = new ArrayList();
            ClienteDAOImp ClienteListado = new ClienteDAOImp();
            boolean esInsertado = false;

            try {
                  lista = ClienteListado.listalf(IdCentro, letra);
                  if (lista != null ){
                        return lista;
                  }else{
                      System.out.println("La lista es nula");
                      return null;
                  }
              
            }catch (Exception e){
                  throw e;
            }           
      }
     
      public static List esListadoNoCentro () throws Exception {
            
            List lista = new ArrayList();
            ClienteDAOImp ClienteListado = new ClienteDAOImp();           

            try {
                  lista = ClienteListado.listNoCentro();  
                  if (lista != null ){
                        return lista;
                  }else{                      
                      return null;
                  }
              
            }catch (Exception e){
                  throw e;
            }           
      }
     
     public static boolean esEliminado(int id) throws Exception {
          ClienteDAOImp ClienteEliminado = new ClienteDAOImp();
          
            try {
                    
                  if (ClienteEliminado.delete(id)) {
                        return true;
                  }
            } catch (Exception e) {
                  throw e;
            }
            System.out.println("ClientesBO devuelve falso");
            return false;
     }
     
     public static float esActualizado(Cliente cliente, boolean tienepeso) throws Exception {
            /*
          *Esta función comprueba antes de actualizar que no se introduzca el peso para el cliente
          * en una fecha en la que ya tenía un peso asignado.
          * Devuelve el peso si en la fecha indicada ya había un peso asignado para ese cliente
          * Devuelve un 1 si no ha habido un error en la actualización
          * Devuelve un 2 si ha ido bien 
             */
            //System.out.println("esactualizado peso: "+cliente.getPeso());
            ClienteDAOImp ClienteActualizado = new ClienteDAOImp();
            float peso;
            try {
                //peso=ClienteActualizado.comprobarpeso(cliente.getIdCliente(), cliente.getFechapeso());/
                if(cliente.getPeso()!=0.0){ //tengo que controlar que aquí no llega la fecha como null
                         if (ClienteActualizado.clientepeso(cliente.getIdCliente(), cliente.getPeso(), cliente.getFechapeso()) && ClienteActualizado.update(cliente) != null) {
                             return 1; 
                         }else{
                             return -1;
                         }
                }else{       
                  if (ClienteActualizado.update(cliente) != null) {
                        return 1;
                  }else{
                      return -2;
                  }
                }
            }catch (Exception e) {
                  throw e;
            }
          
     }
       
     public static List esEncontrado(int Id, String Dni, String Nombre, String Apellido1, String Apellido2) throws Exception {
          ClienteDAOImp ClienteEncontrado = new ClienteDAOImp();
           List lista = new ArrayList();
            //boolean esEliminado = false;

            try {
                  lista = ClienteEncontrado.find(Id, Dni, Nombre, Apellido1,Apellido2);  
                  if (lista != null ) {                  
                        return lista;
                  }
            } catch (Exception e) {
                  throw e;
            }
            System.out.println("ClientesBO no devuelve una lista");
            return null;
     }     
       
     public static boolean esRelacionado(int IdCliente, int id) throws Exception {
          ClienteDAOImp ClienteRelacionado = new ClienteDAOImp();
           boolean relacionado;
            //boolean esEliminado = false;

            try {
                  relacionado = ClienteRelacionado.clientecentro(IdCliente, id);  
                  if (relacionado) {
                        return true;
                  }
            } catch (Exception e) {
                  throw e;
            }
            return false;
     }
        
     public static Cliente leerDatos(String dni) throws Exception {
           ClienteDAOImp ClienteLeido = new ClienteDAOImp();
           Cliente cliente = new Cliente();
            //boolean esEliminado = false;
            try {
                  cliente = ClienteLeido.read(dni);  
                  if (cliente != null ) {
                      return cliente;                  
                  }
            } catch (Exception e) {
                  throw e;
            }
            System.out.println("ClientesBO no devuelve un cliente");
            return null;
     }
     
     public static Cliente leerDatosPorId(int id) throws Exception {
           ClienteDAOImp ClienteLeido = new ClienteDAOImp();
           Cliente cliente = new Cliente();
            //boolean esEliminado = false;
            try {
                  cliente = ClienteLeido.readPorId(id);  
                  if (cliente != null ) {
                      return cliente;                  
                  }
            } catch (Exception e) {
                  throw e;
            }
            System.out.println("ClientesBO no devuelve un cliente");
            return null;
     }
     
     public static List leePeso(Cliente cliente) throws Exception {
            ClienteDAOImp ClientePeso = new ClienteDAOImp();
            List listapesos = new ArrayList();
            Cliente micliente= new Cliente();
            micliente=cliente;

            try {
                  listapesos=ClientePeso.readPeso(cliente.getIdCliente());
                  return listapesos;
            } catch (Exception e) {
                  throw e;
            }
     }          
     
     public static boolean insertaSesiones(Sesiones sesiones, int idCliente)throws Exception{
         ClienteDAOImp sesionesinsertadas = new ClienteDAOImp();
        try {
            if(sesionesinsertadas.insertaSesionesCliente(sesiones, idCliente)){
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return false;
     } 
     
     public static boolean insertaObservacion(Observacion observacion)throws Exception{
         ClienteDAOImp observacioninser = new ClienteDAOImp();
         try{
            return observacioninser.insertaObservacionCliente(observacion);
         } catch (Exception ex) {
            Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, ex);
         }
            return false;
     }
     
     public static Observacion listaObservacion(int idCliente)throws Exception{
         ClienteDAOImp observacionlista = new ClienteDAOImp();
         Observacion observacion = new Observacion();
         try{
         observacion=observacionlista.listarObservacionCliente(idCliente);
         } catch (Exception ex) {
            Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return observacion;
     }
     
     public static Sesiones insertaAsistencia(int idCliente, String maquina) throws Exception{
         ClienteDAOImp asistencia = new ClienteDAOImp();
         Sesiones sesiones = new Sesiones();
         try{
             if("fit".equals(maquina)){
                if(asistencia.insertarAsistenciaFitCliente(idCliente)){
                    sesiones=asistencia.listaSesionesCliente(idCliente);
                    return sesiones;
                }
                System.out.println("Error al introducir asistencia en FIT");
                return null;
             }else{
                if("confort".equals(maquina)){
                 if(asistencia.insertarAsistenciaConfortCliente(idCliente)){
                     sesiones=asistencia.listaSesionesCliente(idCliente);
                     return sesiones;
                 }
                 System.out.println("Error al introducir asistencia en CONFORT");
                 return null;
                }else{
                 System.out.println("no se reconoce la maquina");
                 return null;
                }
             }
         } catch (Exception ex) {
            Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;         
     }
     
     public static Sesiones verSesionesCliente(int idCliente)throws Exception{
         Sesiones sesiones = new Sesiones();
         ClienteDAOImp sesionescliente= new ClienteDAOImp();         
         try{
             sesiones=sesionescliente.listaSesionesCliente(idCliente);
         } catch (Exception ex) {
            Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return sesiones;
     }
     
     public static boolean actualizaSesionesCliente(Sesiones sesiones) throws Exception{
         ClienteDAOImp sesionescliente= new ClienteDAOImp(); 
         boolean actualizado=false;
         try{
             actualizado=sesionescliente.actualizaSesionesCliente(sesiones);
         } catch (Exception ex) {
            Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return actualizado;
     }
     
     public static int DameIdQr(String url) throws Exception{
         ClienteDAOImp clienteid = new ClienteDAOImp();         
         try{
             return clienteid.leeIdQr(url);                          
         }catch(Exception e){
             Logger.getLogger(ClientesBO.class.getName()).log(Level.SEVERE, null, e);
         }
         return 0;
     }          
}
