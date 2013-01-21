/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.actions;

import es.pfc.forms.ActualizarUsuarioForm;
import es.pfc.model.Usuario;
import es.pfc.negocio.UsuariosBO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrador
 */
public class ActualizarUsuarioAction extends org.apache.struts.action.Action{
    
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
        
       Usuario miusuario = new Usuario();                        
        ActualizarUsuarioForm UsuarioForm = (ActualizarUsuarioForm) form;
        
        miusuario.setIdUsuario(UsuarioForm.getIdUsuario());
        miusuario.setDni(UsuarioForm.getDni());
        miusuario.setNombre(UsuarioForm.getNombre());
        miusuario.setApellidos(UsuarioForm.getApellidos());       
        miusuario.setDireccion(UsuarioForm.getDireccion());
        miusuario.setTelefono(UsuarioForm.getTelefono());
        miusuario.setEmail(UsuarioForm.getEmail());
        
        if(UsuariosBO.actualizaUsuario(miusuario)) {                    
                                return mapping.findForward(SUCCESS);                                            
        }else {                    
                                return mapping.findForward(FAILURE);                          
        }
    }
}
