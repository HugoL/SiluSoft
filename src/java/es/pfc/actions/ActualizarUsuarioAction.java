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
import javax.servlet.http.HttpSession;
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
        HttpSession session = request.getSession(false);
        if(session==null){
            System.out.println("La sesión ha caducado");
            return mapping.findForward(FAILURE);
        }
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
            System.out.println("OKEY");            
             Usuario usuario = (Usuario)session.getAttribute("usuario");
             usuario.setDni(miusuario.getDni());
             usuario.setNombre(miusuario.getNombre());
             usuario.setApellidos(miusuario.getApellidos());
             usuario.setDireccion(miusuario.getDireccion());
             usuario.setTelefono(miusuario.getTelefono());
             usuario.setEmail(miusuario.getEmail());
             session.setAttribute("usuario", usuario);
            return mapping.findForward(SUCCESS);                                            
        }else {                    
            System.out.println("ohhhhh");
            return mapping.findForward(FAILURE);                          
        }
    }
}
