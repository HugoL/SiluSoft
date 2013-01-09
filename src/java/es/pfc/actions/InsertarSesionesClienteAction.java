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

import es.pfc.forms.InsertarSesionesClienteForm;
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
public class InsertarSesionesClienteAction extends org.apache.struts.action.Action {

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
        InsertarSesionesClienteForm insertarSesionesForm = (InsertarSesionesClienteForm) form;
        HttpSession session = request.getSession(false);
        Cliente cliente = (Cliente)session.getAttribute("cliente");
        Sesiones sesiones = new Sesiones();
        sesiones.setFit(insertarSesionesForm.getFit());
        sesiones.setConfort(insertarSesionesForm.getComfort());
        //en sesiones restantes pongo las mismas porque todavía no ha consumido ninguna        
        sesiones.setIdCliente(cliente.getIdCliente());
        //comprobar si el cliente ya tenía sesiones calculadas para actualizar la BD
        
        if(ClientesBO.verSesionesCliente(cliente.getIdCliente())!=null){
            //se le acumulan las sesiones restantes                        
            if(ClientesBO.actualizaSesionesCliente(sesiones)){
                System.out.println("Se actualizan las sesiones del cliente");
                return mapping.findForward(SUCCESS);
            }else{
                System.out.println("No se han actualizado las sesiones del cliente");
                return mapping.findForward(FAILURE);
            }
        }else{  
            //como no tenía sesiones calculadas le restan las mismas que se han calculado (no ha consumido ninguna ni acumulado)
            sesiones.setResConfort(insertarSesionesForm.getComfort());
            sesiones.setResFit(insertarSesionesForm.getFit());
            if(ClientesBO.insertaSesiones(sesiones, cliente.getIdCliente()))        
                return mapping.findForward(SUCCESS);
            else
                return mapping.findForward(FAILURE);
        }
    }
}
