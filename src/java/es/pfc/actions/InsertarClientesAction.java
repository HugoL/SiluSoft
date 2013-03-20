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

import es.pfc.forms.InsertarClienteForm;
import es.pfc.model.Cliente;
import es.pfc.model.Usuario;
import es.pfc.negocio.ClientesBO;
import java.util.Random;
import org.apache.struts.action.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ko
 */
public class InsertarClientesAction extends org.apache.struts.action.Action{
    
      private static final String SUCCESS = "correcto";
      private static final String FAILURE = "incorrecto";
      
      char[] elementos ={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','s','t','u','v','w','x','y','z'};
      char[] cadena = new char [20];
      
         
    @Override
     public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            
        //recogo los datos
        InsertarClienteForm ClienteForm = (InsertarClienteForm) form;
        Cliente micliente = new Cliente();
        Cliente micliente2 = new Cliente();
        //micliente.setIdCliente(ClienteForm.getIdCliente()); ///CUIDAOOO
        micliente.setDni(ClienteForm.getDni());
        micliente.setNombre(ClienteForm.getNombre());
        micliente.setApellidos(ClienteForm.getApellidos());     
        micliente.setApellido2(ClienteForm.getApellido2());       
        
        HttpSession session = request.getSession(false);
        Usuario usuario=(Usuario) session.getAttribute("usuario");
       
        if(usuario!=null){
        //Generar url del cliente
        String url = generarCadena(usuario.getIdUsuario());
        
        micliente.setUrl(url);
        }else{
            System.out.println("Sesion usuario no encontrada");
            micliente = null;
            return mapping.findForward(FAILURE);
        }
        //////CREACION DEL OBJETO CLIENTE CON LOS DATOS /////////
        try {
            micliente=ClientesBO.esInsertado(micliente,usuario.getIdCentro());
            micliente2=ClientesBO.leerDatos(ClienteForm.getDni()); //me guardo los datos del cliente insertado en un objeto para tener el idCliente
            if(micliente2!=null){
                if(ClientesBO.esRelacionado(micliente2.getIdCliente(),usuario.getIdCentro())){                                           
                     request.setAttribute("cliente", micliente2);   
                     return mapping.findForward(SUCCESS);
                }
                System.out.println("no relacionado cliente con centro");
                return mapping.findForward(FAILURE);
                
            }else{
               System.out.println("Cliente no insertado");
               return mapping.findForward(FAILURE);
            }
            //FactoriaDAO.getInstance().getClienteDao().create(cliente); //Aqui se hara la conexion a la bd
        }catch (Exception e1) {
           throw new RuntimeException("Excepción en InsertarClientesAction:"+e1);
	}                                   
       }
    
    String generarCadena(int id){
        String url;
        String ids = String.valueOf(id);
        for(int i=0;i<20;i++){
            int elemento = (int)(Math.random()*36);
            System.out.println(elemento);
            cadena[i]=(char)elementos[elemento];
        }
        
        url = new String (cadena);
        return url+ids;
    }
    
}
