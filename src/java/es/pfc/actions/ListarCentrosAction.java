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

import es.pfc.model.Usuario;
import es.pfc.negocio.CentrosBO;
import es.pfc.negocio.UsuariosBO;
import java.util.ArrayList;
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
public class ListarCentrosAction extends org.apache.struts.action.Action {

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
        List lista = new ArrayList();
        List listaUsuarios = new ArrayList();
        String[] miarray;
        try{

                lista = CentrosBO.listaCentros();
                
                if( lista != null){   
                    listaUsuarios = CentrosBO.listaUsuarios();
                    request.setAttribute("listado", lista);   
                    request.setAttribute("listaUsuarios", listaUsuarios);
                    //preparar un array con los centros y los usuarios para pasarlo a la función de javascript en la JSP
                    
                    return mapping.findForward(SUCCESS);
                }else{
                    return mapping.findForward(FAILURE);
                }  

       }catch(Exception e){
           throw new RuntimeException("Excepción en ListarCentrosAction:"+e);
       }
        
       
    }
    
    private String[] crearArray(String[] miarray){
        
        return miarray;
    }
}
