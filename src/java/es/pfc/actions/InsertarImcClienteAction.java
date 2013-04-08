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

import es.pfc.forms.InsertarImcClienteForm;
import es.pfc.model.Sesiones;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class InsertarImcClienteAction extends org.apache.struts.action.Action {

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
        InsertarImcClienteForm imcForm = (InsertarImcClienteForm) form;
        Sesiones sesiones = new Sesiones();
        
        float peso = imcForm.getPeso();
        int altura = imcForm.getAltura();
        
        //altura=(int)Math.pow(altura, altura);    
        //CALCULO IMC (peso x peso) / altura
        System.out.println("------------");
        System.out.println("altura: "+altura+"peso: "+peso);
        float imc = (peso*peso)/altura;
        System.out.println("IMC calculado: "+imc);
        request.setAttribute("imc", imc);
        request.setAttribute("peso",peso);
        if(imc>24.9){
            if(imc>24.9 && imc<30.0){
                System.out.println("existe sobrepeso");
            }else{ //el imc es 30 o más
                System.out.println("existe obesidad");
            }
            
        }else{
            System.out.println("no existe sobrepeso");
            sesiones.setFit(0);
            sesiones.setConfort(0);
        }                       
        request.setAttribute("sesiones", sesiones);        
        return mapping.findForward(SUCCESS);
    }
}
