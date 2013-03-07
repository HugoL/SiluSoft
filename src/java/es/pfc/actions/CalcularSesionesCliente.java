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

import es.pfc.forms.CalcularSesionesForm;
import es.pfc.model.Cliente;
import es.pfc.model.Sesiones;
import es.pfc.negocio.ClientesBO;
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
public class CalcularSesionesCliente extends org.apache.struts.action.Action {

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
            CalcularSesionesForm CalculaSesionesForm = (CalcularSesionesForm) form;
            Sesiones sesiones = new Sesiones();
            //COGER DEL FORMULARIO EL PESO, Y LOS KILOS A PERDER
           
            //int idCliente = Integer.parseInt(request.getParameter("id"));
            //int fit= Integer.parseInt(request.getParameter("fit"));
            //int confort = Integer.parseInt(request.getParameter("confort"));
            
            //FÓRMULA PARA CALCULAR LAS SESIONES!!!            
            int sobrepeso;
            HttpSession sesion = request.getSession(false);
            if(sesion==null){
                System.out.println("la sesión ha caducado");
                return mapping.findForward(FAILURE);
            }
            Cliente cliente = new Cliente();
            cliente=(Cliente)request.getAttribute("cliente");
            
            sobrepeso = CalculaSesionesForm.getKilossobran();           
            //sobrepeso = (int) (peso - pesoideal); //me falta saber el peso ideal
            int y;             
            y = new Double(sobrepeso / 3).intValue();       
            int fit = 6*y;
            int comfort = 4*y;            
            sesiones.setIdCliente(CalculaSesionesForm.getIdCliente());
            sesiones.setFit(fit); //sesiones.setFit(fit);
            sesiones.setConfort(comfort); //sesiones.setConfort(comfort);
            sesiones.setTotal(sesiones.getFit()+sesiones.getConfort());         
            if(ClientesBO.insertaSesiones(sesiones, sesiones.getIdCliente())){         
                request.setAttribute("sesiones", sesiones);
                return mapping.findForward(SUCCESS);
            }
            return mapping.findForward(FAILURE);
    }     
}
