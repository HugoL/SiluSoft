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
package es.pfc.actions;

import es.pfc.model.Agenda;
import es.pfc.model.Usuario;
import es.pfc.negocio.AgendaBO;
import es.pfc.negocio.ClientesBO;
import es.pfc.negocio.MiAgendaBO;
import es.pfc.negocio.UsuariosBO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ko
 */
public class MiAgendaAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "correcto";
    private static final String FAILURE = "incorrecto";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        String fechica = null;
        String fechaagenda = null;
        String var= String.valueOf(request.getParameter("var"));
        Agenda agenda = new Agenda();
        Agenda miagenda;
        java.util.Date mifecha = new java.util.Date();
        Date fecha = null;
        List lista = new ArrayList();
        List listaUsuarios = new ArrayList();
        int diasemana;
         HttpSession session = request.getSession(false);
        Usuario usuario=(Usuario) session.getAttribute("usuario");  
        
        //OPERACIONES CON FECHA
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        //Obtiene la fecha del sistema
        Calendar calendario = Calendar.getInstance(); 
        
        
        //convertir fecha de string a sql.date
        DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");  
             
        //si le paso una fecha como parametro la mando para hacer la consulta sobre esa fecha
        //sino hago la consulta con la fecha de hoy  
        
        if("0".equals(var)){
            fecha=new Date(mifecha.getTime());
            diasemana = calendario.get(Calendar.DAY_OF_WEEK);
        }else{          
           //convierto el parametro fecha en tipo util.Date
           fechica=request.getParameter("fecha");
           mifecha=formater.parse(fechica);
           
           //establezco la fecha del calendario con la fecha que le hemos pasao  
           calendario.setTime(mifecha); 
           if("1".equals(var)){ //sumo un dia
               
                calendario.add(Calendar.DATE,1); //le suma 1 dia                         
                fechaagenda=formato.format(calendario.getTime());        
                diasemana = calendario.get(Calendar.DAY_OF_WEEK);
                //convierto la cadena fechica a formato fecha (sql.date)
                java.util.Date parsedUtilDate = formater.parse(fechaagenda); 
                fecha= new java.sql.Date(parsedUtilDate.getTime());
           }else{
               if("-1".equals(var)){ //resto un dia
                    calendario.add(Calendar.DATE,-1); //le suma 1 dia
                    fechaagenda=formato.format(calendario.getTime());
                    diasemana = calendario.get(Calendar.DAY_OF_WEEK);
                    //convierto la cadena fechica a formato fecha (sql.date)
                    java.util.Date parsedUtilDate = formater.parse(fechaagenda);  
                    fecha= new java.sql.Date(parsedUtilDate.getTime());
               }else{
                   // Date fechaagenda = Date.valueOf(fechica);
                    //System.out.println(fechaagenda);
                    //fecha=fechaagenda;
                   fecha=new Date(mifecha.getTime());
                   diasemana = calendario.get(Calendar.DAY_OF_WEEK);
               }               
           }                    
        }
        agenda.setFecha(fecha);

        //RECOGER HORAS
        List listaEventos=MiAgendaBO.numeroEventos();
        request.setAttribute("listaEventos", listaEventos);
        
        //RECOGER SALAS DEL CENTRO EN UNA LISTA
        List listaSalas = new ArrayList();
        List listaAgendas = new ArrayList();
        
        listaSalas=AgendaBO.listaSalas(usuario.getIdCentro());
        
        Agenda agendatemp = new Agenda();
        //por cada sala recupero los eventos:
        for(int i=0;i<listaSalas.size();i++){
            agendatemp=(Agenda)listaSalas.get(i);
            //tengo un objeto agenda por cada sala
            //por cada agenda de listaSalas, o sea, por cada agendatemp, tengo que consultar (tabla dia) los actos de la agenda en esa sala, en el evento j
                miagenda = new Agenda();
                //agenda=MiAgendaBO.dameMisEventos(agendatemp.getSala(), usuario.getIdCentro(),fecha, j);            
                miagenda=MiAgendaBO.dameEventos(agendatemp.getSala(), usuario.getIdCentro(),fecha);            
                //relleno los campos necesarios     
                //System.out.println("MiAgenda Action, sala: "+i+" acto: "+agenda.getActo()+" evento: "+agenda.getEvento());
                miagenda.setFecha(fecha);
                String dia = damedia(diasemana);            
            agenda.setDiaSemana(dia);
                miagenda.setIdCentro(usuario.getIdCentro());
                miagenda.setIdSala(agendatemp.getIdSala());
                miagenda.setSala(agendatemp.getSala());            
                listaAgendas.add(miagenda);
            
        }
        //CREAR UN ATTRIBUTE POR CADA SALA
        request.setAttribute("listaSalas",listaSalas);
        request.setAttribute("listaAgendas",listaAgendas);
        request.setAttribute("agenda",agenda);
        
        listaUsuarios = UsuariosBO.listaUsuarios(usuario.getIdCentro());
        session.setAttribute("listaUsuarios", listaUsuarios);
        
        return mapping.findForward(SUCCESS);
    
    }
    
    private String damedia(int num){
        String dia="";
        switch(num){
            case 0: 
                dia = "lunes";
                break;
            case 1: 
                dia = "domingo";
                break;
            case 2: 
                dia = "lunes";
                break;
            case 3: 
                dia = "martes";
                break;
            case 4: 
                dia = "miércoles";
                break;
            case 5: 
                dia = "jueves";
                break;
            case 6: 
                dia = "viernes";
                break;
            case 7: 
                dia = "sábado";
                break;
        }                
        return dia;        
    }
}
