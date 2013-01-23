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

import es.pfc.forms.InsertarUsuarioForm;
import es.pfc.model.Permiso;
import es.pfc.model.Usuario;
import es.pfc.negocio.PermisosBO;
import es.pfc.negocio.UsuariosBO;
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
public class InsertarUsuarioAction extends org.apache.struts.action.Action {

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
        
        //InsertarUsuarioForm usuarioform = (InsertarUsuarioForm) form;        
        Usuario usuario = new Usuario();
        Usuario miusuario = new Usuario();
        //El array de booleanos de los permisos activados o desactivados me lo pilla mal de la jsp, me coge un vector más grande y los trues y falses no se corresponden
        boolean[] misactivados={true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,true,true,false,false,true,false,false,true,false};
        Permiso permisoObj;
        int z=0; 
        java.lang.String[] permiso = (java.lang.String[])((DynaActionForm)form).get("permiso");
        java.lang.Boolean[] activado = (java.lang.Boolean[])((DynaActionForm)form).get("activado");
        java.lang.Integer[] idPermiso = (java.lang.Integer[])((DynaActionForm)form).get("idPermiso");
        

        usuario.setDni((String)((DynaActionForm)form).get("dni"));
        usuario.setNombre((String)((DynaActionForm)form).get("nombre"));
        usuario.setApellidos((String)((DynaActionForm)form).get("apellido1"));
        usuario.setTelefono((String)((DynaActionForm)form).get("telefono"));
        usuario.setEmail((String)((DynaActionForm)form).get("email"));
        usuario.setPassword((String)((DynaActionForm)form).get("password"));        
        //String password2=(String)((DynaActionForm)form).get("password2");
        usuario.setRol((Integer)((DynaActionForm)form).get("rol"));
        usuario.setIdCentro((Integer)((DynaActionForm)form).get("idCentro"));
        
        /*usuario.setConsultaClientes(usuarioform.getConsultaClientes());
        usuario.setManipulaClientes(usuarioform.getManipulaClientes());
        usuario.setConsultaCentro(usuarioform.getConsultaCentro());
        usuario.setManipulaCentro(usuarioform.getManipulaCentro());
        usuario.setAdministracion(usuarioform.getAdministracion());
        usuario.setConsultaAgenda(usuarioform.getConsultaAgenda());
        usuario.setManipulaAgenda(usuarioform.getManipulaAgenda());
        usuario.setInsertaClientes(usuarioform.getInsertaClientes());
        usuario.setEliminaClientes(usuarioform.getEliminaClientes());*/
        
        /*System.out.println("Longitud de activado: "+activado.length);
        System.out.println("Longitud de permiso: "+permiso.length);               
        System.out.println("Logintud de idpermisos: "+idPermiso.length);
        System.out.println("Rol: "+usuario.getRol());*/
        int pos=7*(usuario.getRol()-1);                
        System.out.println("POSICION: "+pos);
        /*System.out.print("Valor de los permisos recogidos: ");
        for (int j=0;j<permiso.length;j++){
            System.out.print(permiso[j]+",");          
        }*/
       miusuario=UsuariosBO.insertaUsuarioCentro(usuario);
       System.out.println("miusuario.idusuario: "+miusuario.getIdUsuario());
        if(usuario!=null){
                for(int i=pos;i<pos+7;i++){                         
                        permisoObj = new Permiso();
                        permisoObj.setIdUsuario(miusuario.getIdUsuario());
                        //permisoObj.setRol(permiso[i]);                        
                        permisoObj.setPermiso(permiso[z]);
                        permisoObj.setActivado(misactivados[i]); 
                        permisoObj.setIdPermiso(idPermiso[z]);
                        System.out.println("usuario.setPermiso idPermiso: "+permisoObj.getIdPermiso()+"->"+permisoObj.getPermiso()+": "+misactivados[i]);
                        System.out.println("z: "+z);
                        PermisosBO.insertarPermisosUsuario(permisoObj);       
                        z++;
                }
                //envío email al usuario 
                if(UsuariosBO.enviarMail(usuario.getEmail(), usuario.getEmail(), usuario.getPassword())) {
                    System.out.println("Envío email correcto");
                }
                else {
                    System.out.println("Fallo en el envío de email");
                }
                return mapping.findForward(SUCCESS);                 
        }else{
            return mapping.findForward(FAILURE);
        }
    }
}
