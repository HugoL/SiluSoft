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

import es.pfc.dao.AgendaDAOImp;
import es.pfc.model.Agenda;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko
 */
public class AgendaBO {
    
    public static Agenda dameEventos(String sala,int idCentro,Date fecha){
        Agenda agenda = new Agenda();
        AgendaDAOImp agendaevento = new AgendaDAOImp();
        try {
            
            agenda=agendaevento.listarEventos(sala, idCentro,fecha);
            
        } catch (Exception ex) {
            Logger.getLogger(AgendaBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return agenda;
    }
    
    public static boolean InsertaEventos(Agenda agenda,String evento){
        boolean insertado=false;
        try {
            AgendaDAOImp agendaevento = new AgendaDAOImp();
            //miro si tengo que actualizar el registro en la BD o insertar uno nuevo
            //System.out.println("-->"+agenda.getSala());
            //IdSalaL.add(agendaevento.listaIdSala(agenda.getSala(), agenda.getIdCentro()));
            //String ide = String.valueOf(IdSalaL.get(0));
            System.out.println("Si existen eventos en la agenda del centro: "+agenda.getIdCentro()+" en la fecha "+agenda.getFecha()+" y en la sala "+Integer.valueOf(agenda.getSala()));
            
            //ME FALTA PASAR EL ID DEL USUARIO !!!!!!!!!!!!!!!!!!!!!!!!!!!            
            if(agendaevento.existenEventos(agenda.getIdCentro(),agenda.getFecha(),Integer.valueOf(agenda.getSala()))){
                System.out.println("actualizo registro de agenda");
                //Inroducir estado del evento               
                insertado= agendaevento.actualizarEvento(agenda,evento);
                agendaevento.insertaEstadoEvento(evento, agenda.getIdCentro(), agenda.getIdSala(),agenda.getFecha(),"en curso",3,2);
                return insertado;
            }else{
                System.out.println("nuevo registro de agenda");
                //Inroducir estado del evento     
                insertado=agendaevento.insertarEvento(agenda,evento);
                agendaevento.insertaEstadoEvento(evento, agenda.getIdCentro(), agenda.getIdSala(),agenda.getFecha(),"en curso",3,2);
                return insertado;
            }
            
        } catch (Exception ex) {
            Logger.getLogger(AgendaBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static List dameSalas(String nombre, int idCentro){
        AgendaDAOImp salasCentro = new AgendaDAOImp();
        List lista = new ArrayList();
        try {
            lista=salasCentro.listaIdSala(nombre, idCentro);
            
            return lista;
        } catch (Exception ex) {
            Logger.getLogger(AgendaBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static List listaSalas (int idCentro){
        AgendaDAOImp listasalas = new AgendaDAOImp();
        List lista = new ArrayList();
        
        try{
            lista=listasalas.listarSalas(idCentro);
        }catch(Exception ex){
            Logger.getLogger(AgendaBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
        
    }
    
    public static boolean ActualizaEvento(String evento, Agenda agenda,int idUsuario){
        AgendaDAOImp eventoactualizado = new AgendaDAOImp();
        try{
            return eventoactualizado.actualizaEstadoEvento(evento, agenda.getIdCentro(),agenda.getIdSala(), agenda.getFecha(), agenda.getEstado(), idUsuario, agenda.getValoracion());
            
        }catch(Exception ex){
             Logger.getLogger(AgendaBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
       
    }
}
