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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

/**
 *
 * @author ko
 */
public class InsertaTesClienteDinamicoAction extends org.apache.struts.action.Action {

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
        PreguntaTest pregunta;
        TestCliente test = new TestCliente();
        int idCliente=0;
        int i=0;
        boolean insertado=false;
        idCliente = (Integer)((DynaActionForm)form).get("idCliente");
        java.lang.Integer[] campos = (java.lang.Integer[])((DynaActionForm)form).get("campos");
        String morfologia = (String)((DynaActionForm)form).get("morfologia");
        java.lang.Integer[] idPregunta = (java.lang.Integer[])((DynaActionForm)form).get("numPregunta");
   
        for(int j=0;j<idPregunta.length;j++){
            pregunta = new PreguntaTest(idCliente);
            //objeto TestPregunta al que le establezco la pregunta correspondiente (campo hidden en la jsp) y la respuesta
            pregunta.setIdPregunta(idPregunta[j]);            
            pregunta.setRespelegida(campos[i]);
            i++;
            //llamar a la función que me meta los resultados de cada pregunta (el resultado es "campo")
            insertado=PreguntaTestBO.insertarResultadoPregunta(pregunta);    
            //System.out.println("Pregunta "+i+", Respuesta: "+pregunta.getRespelegida()+". Insertado: "+insertado);            
        }
        //llamar a la función que me introduce el resultado del test y la fecha
        test.setIdCliente(idCliente);
        test.setResultado(morfologia);
        //pongo la fecha en la que se realiza el test
        Date fechaactual = new Date();
        String fecha;
        SimpleDateFormat formato = new SimpleDateFormat("yyMMdd");
        fecha=formato.format(fechaactual);        
        test.setFecha(fecha);
        if(insertado && test.getResultado()!=null){
            PreguntaTestBO.insertarTestCliente(test);
            return mapping.findForward(SUCCESS);            
        }else{
            if(!insertado)
                System.out.println("PETA porque no se insertan todos los resultados");
            else
                if(test.getResultado()==null)
                    System.out.println("PETA porque no se ha insertado el resultado del TEST");
                else
                    System.out.println("PETA porque no se insertan los resultados ni el resultado del TEST");
        
            return mapping.findForward(FAILURE);    
        }
    }
}
