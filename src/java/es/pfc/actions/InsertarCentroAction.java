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

import es.pfc.forms.ActualizarCentroForm;
import es.pfc.model.Centro;
import es.pfc.negocio.CentrosBO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class InsertarCentroAction extends org.apache.struts.action.Action {

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
        ActualizarCentroForm centroForm = (ActualizarCentroForm) form;
        Centro centro = new Centro();
        
        centro.setNombre(centroForm.getNombre());
        centro.setDireccion(centroForm.getDireccion());
        centro.setTelefono(centroForm.getTelefono());
        
        centro.setIdCentro(CentrosBO.esInsertado(centro));
        
        if(centro.getIdCentro()==-2){            
            System.out.println("No se ha insertado el centro");
            return mapping.findForward(FAILURE);
        }
        
        System.out.println("Id del nuevo centro: "+centro.getIdCentro());
        if(CentrosBO.esInsertadoTratamiento("Silhouwell", "Fit y Confort para el adelgazamiento. Rápido, seguro y eficaz.", centro.getIdCentro())){
            System.out.println("Se ha insetado el tratamiento por defecto");
            request.setAttribute("centro", centro);
            return mapping.findForward(SUCCESS);
        
        }else{
            System.out.println("No se ha insertado el tratamiento por defecto en el centro");
        }
        request.setAttribute("centro", centro);
        return mapping.findForward(SUCCESS);
    }
}
