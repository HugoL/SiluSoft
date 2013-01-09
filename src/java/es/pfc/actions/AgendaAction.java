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

import es.pfc.forms.AgendaForm;
import es.pfc.model.Agenda;
import es.pfc.model.Cliente;
import es.pfc.model.Usuario;
import es.pfc.negocio.AgendaBO;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class AgendaAction extends org.apache.struts.action.Action {

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
        Agenda agendaFit = new Agenda();
        Agenda agendaConfort = new Agenda();
        Agenda agendaCabina = new Agenda();
        Agenda agendaOtra = new Agenda();
        java.util.Date mifecha = new java.util.Date();
        Date fecha = null;
       
        //Las variables siguientes no tendrán sentido con la mejora       
        List listaFit = new ArrayList();
        List listaConfort = new ArrayList();
        List listaCabina = new ArrayList();
        List listaOtra = new ArrayList();
    
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
        }else{          
           //convierto el parametro fecha en tipo util.Date
           fechica=request.getParameter("fecha");
           mifecha=formater.parse(fechica);
           
           //establezco la fecha del calendario con la fecha que le hemos pasao  
           calendario.setTime(mifecha); 
           if("1".equals(var)){ //sumo un dia
               
                calendario.add(Calendar.DATE,1); //le suma 1 dia               
                fechaagenda=formato.format(calendario.getTime());               
                //convierto la cadena fechica a formato fecha (sql.date)
                java.util.Date parsedUtilDate = formater.parse(fechaagenda); 
                fecha= new java.sql.Date(parsedUtilDate.getTime());
           }else{
               if("-1".equals(var)){ //resto un dia
                    calendario.add(Calendar.DATE,-1); //le suma 1 dia
                    fechaagenda=formato.format(calendario.getTime());                   
                    //convierto la cadena fechica a formato fecha (sql.date)
                    java.util.Date parsedUtilDate = formater.parse(fechaagenda);  
                    fecha= new java.sql.Date(parsedUtilDate.getTime());
               }else{
                   // Date fechaagenda = Date.valueOf(fechica);
                    //System.out.println(fechaagenda);
                    //fecha=fechaagenda;
                   fecha=new Date(mifecha.getTime());
               }               
           }                    
        }
        agendaFit.setFecha(fecha);
        agendaConfort.setFecha(fecha);
        agendaCabina.setFecha(fecha);
        agendaOtra.setFecha(fecha);
        
        //AgendaForm agendaform = (AgendaForm) form;
        HttpSession session = request.getSession(false);
        Usuario usuario=(Usuario) session.getAttribute("usuario");      
        
        
        //Una mejora sera consultar las salas del centro y crear un objeto agenda por cada sala
        listaFit = AgendaBO.dameSalas("fit", usuario.getIdCentro());
        listaConfort = AgendaBO.dameSalas("confort", usuario.getIdCentro());
        listaCabina = AgendaBO.dameSalas("cabina", usuario.getIdCentro());
        listaOtra = AgendaBO.dameSalas("otra", usuario.getIdCentro());
        
        agendaFit=AgendaBO.dameEventos("fit", usuario.getIdCentro(),fecha);
        agendaConfort=AgendaBO.dameEventos("confort", usuario.getIdCentro(),fecha);
        agendaCabina=AgendaBO.dameEventos("cabina", usuario.getIdCentro(),fecha);       
        agendaOtra=AgendaBO.dameEventos("otra", usuario.getIdCentro(), fecha);
        
        if(agendaFit.getIdAgenda()==0){ //si el dia de la agenda no tiene eventos relleno los campos necesarios
            agendaFit.setIdCentro(usuario.getIdCentro());
            agendaFit.setSala("fit");
            agendaFit.setFecha(fecha);
        }
        if(agendaConfort.getIdAgenda()==0){
            agendaConfort.setIdCentro(usuario.getIdCentro());
            agendaConfort.setSala("confort");
            agendaConfort.setFecha(fecha);
        }
        if(agendaCabina.getIdAgenda()==0){
            agendaCabina.setIdCentro(usuario.getIdCentro());
            agendaCabina.setSala("cabina");
            agendaCabina.setFecha(fecha);   
        }
        if(agendaOtra.getIdAgenda()==0){
            agendaCabina.setIdCentro(usuario.getIdCentro());
            agendaCabina.setSala("otra");
            agendaCabina.setFecha(fecha);   
        }
        
        request.setAttribute("agendaFit",agendaFit);
        request.setAttribute("agendaConfort",agendaConfort);
        request.setAttribute("agendaCabina",agendaCabina);
        request.setAttribute("agendaOtra",agendaOtra);
        
        request.setAttribute("listaFit", listaFit);
        request.setAttribute("listaConfort", listaConfort);
        request.setAttribute("listaCabina", listaCabina);
        request.setAttribute("listaOtra", listaOtra);
        
        return mapping.findForward(SUCCESS);
    
    }
}
