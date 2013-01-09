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

import es.pfc.forms.ActualizarClienteForm;
import es.pfc.model.Cliente;
import es.pfc.model.Usuario;
import es.pfc.negocio.ClientesBO;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.struts.action.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ko
 */
public class ModificarClienteAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "correcto";
    private static final String FAILURE = "incorrecto";  
    private static final String PESO = "pesoasignado"; 
    boolean modificarpeso = true;
    
    @Override
     public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            
        
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        
        ActualizarClienteForm ClienteForm = (ActualizarClienteForm) form;
        Cliente micliente = new Cliente();
        boolean tienepeso= false;
        float imc;                  
        
        micliente.setIdCliente(ClienteForm.getIdCliente());
        micliente.setDni(ClienteForm.getDni());
        micliente.setNombre(ClienteForm.getNombre());
        micliente.setApellidos(ClienteForm.getApellidos());
        micliente.setApellido2(ClienteForm.getApellido2());
        micliente.setEdad(ClienteForm.getEdad());
        micliente.setDireccion(ClienteForm.getDireccion());
        micliente.setTelefono(ClienteForm.getTelefono());
        micliente.setEmail(ClienteForm.getEmail());
        micliente.setObservaciones(ClienteForm.getObservaciones());
        micliente.setAltura(ClienteForm.getAltura());
        
        imc=ClienteForm.getPeso()/ClienteForm.getAltura();
        micliente.setIMC(imc);
        
        micliente.setPeso(ClienteForm.getPeso());      
        //System.out.println("peso: "+micliente.getPeso());
        //System.out.println("fecha: "+ClienteForm.getFechapeso());
        if(micliente.getPeso()==0.0){
            //System.out.println("No se insertara peso");
            tienepeso=false;
        }else{
            tienepeso=true;
            if("".equals(ClienteForm.getFechapeso()) || ClienteForm.getFechapeso()==null){
                //poner fecha de hoy
                System.out.println("Se pone fecha de hoy");
                Date fechaactual = new Date();
                String fecha;
                SimpleDateFormat formato = new SimpleDateFormat("yyMMdd");
                fecha=formato.format(fechaactual);        
                System.out.println(fecha);
                micliente.setFechapeso(fecha);     
            }else{
                 micliente.setFechapeso(ClienteForm.getFechapeso());
            }
        }
       
        try {
            float peso=ClientesBO.esActualizado(micliente,true);
            System.out.println("Peso: "+peso);
           if(peso>0){      
                return mapping.findForward(SUCCESS);                
           }else{
               if(peso==-1)
                return mapping.findForward(FAILURE);
               else
                return mapping.findForward(PESO);   
           }
            //FactoriaDAO.getInstance().getClienteDao().create(cliente); //Aqui se hara la conexion a la bd
        }catch (Exception e1) {
           throw new RuntimeException("Excepción en ModificarClientesAction:"+e1);
	}                                   
       }
}
