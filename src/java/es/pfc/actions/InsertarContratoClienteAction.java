/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.actions;

import es.pfc.forms.InsertarContratoClienteForm;
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
public class InsertarContratoClienteAction extends org.apache.struts.action.Action{
        private static final String SUCCESS = "correcto";
        private static final String FAILURE = "incorrecto";
        
        @Override
        public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception{
            HttpSession session = request.getSession(false);
            Usuario usuario=(Usuario) session.getAttribute("usuario");
            Cliente micliente = new Cliente();
            if(usuario==null){                
                System.out.println("Sesion usuario no encontrada");
                micliente = null;
                return mapping.findForward(FAILURE);
            }
            InsertarContratoClienteForm ContratoForm = (InsertarContratoClienteForm) form;            
            try{
               if(ClientesBO.InsertaContratoCliente(ContratoForm.getIdCliente(),ContratoForm.getValor())){
                   return mapping.findForward(SUCCESS);
               }
            }catch (Exception e1){
                throw new RuntimeException("Excepción en InsertarContratoClienteAction:"+e1);
            } 
            return mapping.findForward(FAILURE);
        }
}
