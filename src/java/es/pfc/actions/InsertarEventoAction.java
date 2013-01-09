/*
 * SiluSoft
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

import es.pfc.forms.InsertarEventoAgendaForm;
import es.pfc.model.Agenda;
import es.pfc.model.Usuario;
import es.pfc.negocio.AgendaBO;
import es.pfc.negocio.ClientesBO;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class InsertarEventoAction extends org.apache.struts.action.Action {

    /* forward name="success" path=""
     */
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
        InsertarEventoAgendaForm eventoform = (InsertarEventoAgendaForm) form;
        HttpSession session = request.getSession(false);
        Usuario usuario=(Usuario) session.getAttribute("usuario");    
        String op=request.getParameter("op");
        
        Agenda agenda = new Agenda();
        
        
        agenda.setSala(eventoform.getMaquina());
        agenda.setIdSala(Integer.valueOf(eventoform.getMaquina()));
        
        //convertir la fecha en formato String a Date
        DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");  
        Date mifecha=formater.parse(eventoform.getFecha());
        java.util.Date parsedUtilDate = formater.parse(eventoform.getFecha()); 
        java.sql.Date fecha= new java.sql.Date(parsedUtilDate.getTime());
        
        agenda.setFecha(fecha);        
        agenda.setActo(eventoform.getActo()+", "+eventoform.getAsignado()+", "+eventoform.getMasinfo());
        agenda.setIdCentro(usuario.getIdCentro());
        agenda.setValoracion(eventoform.getValoracion());
        agenda.setEstado(eventoform.getEstado());
  
        
        if(!"1".equals(op)){
            System.out.println("Introduzco estado del evento");      
            if(AgendaBO.InsertaEventos(agenda,eventoform.getEvento()))
                return mapping.findForward(SUCCESS);
        }else{
            System.out.println("Actualizo el estado del evento");
            if(AgendaBO.ActualizaEvento(eventoform.getEvento(),agenda,usuario.getIdUsuario()))
                return mapping.findForward(SUCCESS);
        }
        return mapping.findForward(FAILURE);
    }
}
