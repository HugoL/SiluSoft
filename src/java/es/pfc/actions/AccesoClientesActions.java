/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.actions;

import es.pfc.forms.LoginClientesForm;
import es.pfc.model.Cliente;
import es.pfc.negocio.IdentificarBO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class AccesoClientesActions extends org.apache.struts.action.Action {
    private static final String SUCCESS = "correcto";
    private static final String FAILURE = "incorrecto";
    
     @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
     LoginClientesForm logon_form = (LoginClientesForm) form;
     Cliente cliente;
     try{
         cliente=IdentificarBO.esClienteAutorizado(logon_form.getIdentificador(),logon_form.getPassword());
        if(cliente!=null){
            return mapping.findForward(SUCCESS);
        }
     }catch(Exception e){
            throw new RuntimeException("Error en AccesoClientesAction");
        }
     return mapping.findForward(FAILURE);
    }
}
