/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.actions;

import es.pfc.forms.InsertarContratoClienteForm;
import es.pfc.model.Cliente;
import es.pfc.model.Contrato;
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
            Cliente micliente;
            if(usuario==null){                
                System.out.println("Sesion usuario no encontrada");              
                return mapping.findForward(FAILURE);
            }
            micliente = (Cliente)session.getAttribute("cliente");
            if(micliente == null){
                System.out.println("Sesion cliente no encontrada");                
                return mapping.findForward(FAILURE);
            }
            InsertarContratoClienteForm ContratoForm = (InsertarContratoClienteForm) form;
            Contrato contrato = new Contrato();
            try{
                contrato.setIdCliente(micliente.getIdCliente());
                contrato.setValor(ContratoForm.getValor());
                if(ClientesBO.InsertaContratoCliente(contrato)){
                   return mapping.findForward(SUCCESS);
                }
            }catch (Exception e1){
                throw new RuntimeException("Excepción en InsertarContratoClienteAction:"+e1);
            } 
            return mapping.findForward(FAILURE);
        }
}
