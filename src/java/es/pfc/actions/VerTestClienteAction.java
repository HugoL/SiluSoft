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

import es.pfc.model.PreguntaTest;
import es.pfc.model.TestCliente;
import es.pfc.negocio.PreguntaTestBO;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class VerTestClienteAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "correcto";

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
         TestCliente test = new TestCliente();
         List listaGeneral = new ArrayList();
         List listaResultados = new ArrayList();
         String id = String.valueOf(request.getAttribute("idCliente"));
         int idCliente = Integer.parseInt(id);
         
         //recojo una lista de objetos pregunta con el id de la pregunta y el id de la respuesta escogida
         listaResultados = PreguntaTestBO.leerResultados(idCliente);
                  
         //para cada objeto pregunta de la lista relleno el texto de la pregunta según el idPregunta y la respuesta escogida según el idRespelegida
         for (Iterator iter = listaResultados.iterator();  iter.hasNext();) {
            PreguntaTest pregunta = (PreguntaTest) iter.next();                           
            pregunta=PreguntaTestBO.leePreguntaResultado(pregunta);
            listaGeneral.add(pregunta);
         }
         //CREO UN OBJETO TEST CON EL RESULTADO
         test=PreguntaTestBO.leerResultadoTest(idCliente);
         
         request.setAttribute("test",test);
         request.setAttribute("listaPreguntas",listaGeneral);
        return mapping.findForward(SUCCESS);
    }
}
