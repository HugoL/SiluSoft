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

import es.pfc.model.Cliente;
import es.pfc.model.Medidas;
import es.pfc.model.Sesiones;
import es.pfc.negocio.MedidasBO;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

/**
 *
 * @author ko
 */
public class InsertaMedidasClienteDinamicoAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "correcto";

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
        int idCliente;
        java.lang.Float[] campos = (java.lang.Float[])((DynaActionForm)form).get("campos");
        HttpSession session = request.getSession(false);
        Cliente cliente= (Cliente) session.getAttribute("cliente");
        //idCliente = (Integer)((DynaActionForm)form).get("idCliente");
        idCliente=cliente.getIdCliente();
        java.lang.Integer[] idZona = (java.lang.Integer[])((DynaActionForm)form).get("idZona");        
        Medidas medida;
        //Introduzco la fecha actual       
        Date fechaactual = new Date();
        String fecha;
        SimpleDateFormat formato = new SimpleDateFormat("yyMMdd");
        fecha=formato.format(fechaactual);                
        int i=0;
        for(float campo: campos){
            medida = new Medidas();
            
            medida.setIdCliente(idCliente);
            medida.setMedida(campo);
            medida.setFecha(fecha);  
            medida.setIdZona(idZona[i]);
            MedidasBO.insertaMedidas(medida);
            i++;
        }       
        
        return mapping.findForward(SUCCESS);
    }
}
