/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.actions;

import es.pfc.model.Sesiones;
import es.pfc.model.Usuario;
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
public class CalcularPresupuestoAction extends org.apache.struts.action.Action {

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
         HttpSession sesion = request.getSession(false);
         float preciototal = 0;
         if(sesion==null){
             System.out.println("sesión caducada");
             return mapping.findForward(FAILURE);
         }
         Usuario usuario = (Usuario)sesion.getAttribute("usuario");
         Sesiones sesiones = (Sesiones)request.getAttribute("sesiones"); 
         try{                     
            //TratamientosBO.damePrecioTratamiento(usuario.getIdCentro(),sesiones.getIdTratamiento());         
            //preciototal = (Float)request.getAttribute("preciototal");                         
         }catch(Exception e){
             System.out.println("Error al convertir el precio");
         }
         request.setAttribute("sesiones",sesiones);
         request.setAttribute("preciototal", preciototal);
        return mapping.findForward(SUCCESS);
    }
    
}
