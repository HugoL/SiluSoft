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
import es.pfc.model.Peso;
import es.pfc.negocio.ClientesBO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class LeePesoClienteAction extends org.apache.struts.action.Action {

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
        
         String dni =request.getParameter("Dni");
         Cliente cliente = new Cliente(); 
         List listapesos = new ArrayList();
        try {
           cliente=ClientesBO.leerDatos(dni);
           if(cliente!=null){            
               //cliente=ClientesBO.leePeso(cliente);
               listapesos=ClientesBO.leePeso(cliente);
               request.setAttribute("cliente", cliente); 
               request.setAttribute("listadop",listapesos);
               return mapping.findForward(SUCCESS);
           }else{
               System.out.println("Cliente no leido");
               return mapping.findForward(FAILURE);
           }
            //FactoriaDAO.getInstance().getClienteDao().create(cliente); //Aqui se hara la conexion a la bd
        }catch (Exception e1) {
           throw new RuntimeException("Excepción en FichaClientesAction:"+e1);
	}       
    }
}
