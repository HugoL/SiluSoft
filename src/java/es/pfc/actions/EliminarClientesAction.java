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


import es.pfc.forms.EliminarClienteForm;
import es.pfc.model.Cliente;
import es.pfc.model.Usuario;
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
public class EliminarClientesAction extends org.apache.struts.action.Action {

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
       
        //Cliente cliente = new Cliente();
        //cliente= (Cliente)request.getAttribute("cliente");
        int id = (Integer.parseInt(request.getParameter("Id")));
        HttpSession session = request.getSession(false); 
        Usuario usuario=(Usuario)session.getAttribute("usuario");
       
        boolean eliminado=false;
      
        //si los datos me vienen de un formulario me vienen a "dni" e "id"
        //si los datos me vienen en la direccion me vienen a "dniuno" e "iduno"

        if(id==0){
              return mapping.findForward(FAILURE);                       
        }
       
        System.out.println("El Id que llega es: "+id);
          //////CREACION DEL OBJETO CLIENTE CON LOS DATOS /////////
        try {
            eliminado=ClientesBO.esEliminado(id);          
           if(eliminado==true){
                System.out.println("Cliente eliminado");
               return mapping.findForward(SUCCESS);
           }else{
               System.out.println("Cliente no eliminado --");
               return mapping.findForward(FAILURE);
           }
            //FactoriaDAO.getInstance().getClienteDao().create(cliente); //Aqui se hara la conexion a la bd
        }catch (Exception e1) {
           throw new RuntimeException("Excepción en EliminarClientesAction:"+e1);
	}       
        
    }
}
