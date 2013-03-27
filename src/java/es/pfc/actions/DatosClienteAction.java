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

import es.pfc.model.Cliente;
import es.pfc.model.PreguntaTest;
import es.pfc.model.Sesiones;
import es.pfc.model.TestCliente;
import es.pfc.negocio.ClientesBO;
import es.pfc.negocio.MedidasBO;
import es.pfc.negocio.PreguntaTestBO;
import es.pfc.negocio.TratamientosBO;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
public class DatosClienteAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
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
        String destino = "";
        int op = 3;
        String dni = request.getParameter("dni");        
        //idcliente = Integer.parseInt(request.getParameter("id"));
        if(request.getParameter("op")!=null){
            op = Integer.parseInt(request.getParameter("op"));
        }
        HttpSession session = request.getSession(true);
        Cliente cliente = new Cliente();                         
       
        try {
            //miro si el atributo cliente está creado
            if(session.getAttribute("cliente")!=null){                                  
                cliente = (Cliente)session.getAttribute("cliente");
                System.out.println("Existe cliente en la sesión: "+cliente.getDni()+". Dni parametro: "+dni);
                //si el el cliente de la sesion no es el mismo que el del dni del get, leo los datos del cliente con dni el del get
                //para evitar que se haya quedado guardado en la sesión un cliente que habíamos vistado anteriormente
                if(cliente.getDni() == null ? dni != null : !cliente.getDni().equals(dni)){ 
                    System.out.println("El cliente de la sesion no coincide con el del parametro dni: "+dni);          
                    if(dni!=null){
                        cliente=ClientesBO.leerDatos(dni);
                    }
                }
            }else{
                cliente=ClientesBO.leerDatos(dni);
            }
           
           if(cliente!=null){                                       
               session.setAttribute("cliente", cliente);
               switch(op){ //aquí hago otra especia de controller para redirigir a la pagina que me interese segun la opcion
                   case 1: 
                       destino = "insertarTratamiento"; //Insertar Tratamiento
                       break;
                   case 2: 
                       destino = "listaTratamientos"; //listar tratamientos
                       List lista = new ArrayList();                    
                       //cliente=ClientesBO.leerDatos(dni);
                       //cliente=ClientesBO.leerDatosPorId(idcliente);
                       lista = TratamientosBO.esListado(cliente);
                       if(lista != null){   
                        request.setAttribute("listadotrat", lista);      
                       }else{
                            destino="incorrecto";
                       }
                       break;
                   case 3:                     
                        List listapesos = new ArrayList();
                        listapesos=ClientesBO.leePeso(cliente);
                        request.setAttribute("listapesos",listapesos);
                        destino = "ficha";
                       break;
                   case 4:                       
                       TestCliente test = new TestCliente();
                       List listaPreguntas = new ArrayList();
                       List listaGeneral = new ArrayList();
                                             
                       if(!PreguntaTestBO.tieneTest(cliente.getIdCliente())){
                            listaPreguntas=PreguntaTestBO.leerPreguntas();                       
                            //leer las 4 respuestas posibles para cada pregunta para luego mostrarlas en la jsp                       
                            for (Iterator iter = listaPreguntas.iterator();  iter.hasNext();) {
                                PreguntaTest pregunta = (PreguntaTest) iter.next();                           
                                pregunta=PreguntaTestBO.leerRespuestasdePregunta(pregunta);
                                //COMPROBAR QUE COJO EL OBJETO PREGUNTA QUE CONTIENE EL TEXTO DE LA PREGUNTA Y ESE OBJETO LO PASO A LA FUNCION DE LEER LAS RESPUESTAS Y EN ESE MISMO OBJETO SE AÑADEN LAS RESPUETAS POSIBLES
                                listaGeneral.add(pregunta);
                            }
                            destino="test";
                       }else{
                           request.setAttribute("idCliente",cliente.getIdCliente());
                           destino="vertest";                       
                       }
                       request.setAttribute("listaPreguntas", listaGeneral);
                   break;
                   case 5:
                       List listaZonas = new ArrayList();        
                       listaZonas=MedidasBO.leeZonas();        
                       request.setAttribute("listaZonas", listaZonas);
                       destino="sesiones";
                       break;
                    case 6:
                       destino="observacion";
                       break;
                    case 7:
                        boolean tiene=false;
                        boolean quedan=false;
                        Sesiones sesiones = new Sesiones();
                        //Llamar a ClientesBO para mirar si el cliente está en la tabla Sesiones
                        sesiones=ClientesBO.verSesionesCliente(cliente.getIdCliente());
                        if(sesiones==null){  
                            tiene=false;                         
                        }else{                                                         
                            tiene=true;                            
                            if(sesiones.getResFit()==0 && sesiones.getResConfort()==0){ //si no le quedan sesiones
                             quedan=false;   
                            }else{
                              quedan=true;
                            }
                        }
                         request.setAttribute("quedan",quedan);
                         request.setAttribute("tiene", tiene);  
                         request.setAttribute("sesiones",sesiones);
                         destino="asistencia";
                        break; 
                    case 8:
                        destino="actualiza";
                    break;
                    case 9: //calcular imc
                         destino="calculaimc";
                        break;
                   default: return mapping.findForward(FAILURE);
               }
               System.out.println("Redirijo a: "+destino);
               return mapping.findForward(destino);
              
           }else{
               System.out.println("Cliente no leido");
               return mapping.findForward(FAILURE);
           }            
        }catch (Exception e1) {
           throw new RuntimeException("Excepción en DatosClienteAction:"+e1);
	}    
    }
}
