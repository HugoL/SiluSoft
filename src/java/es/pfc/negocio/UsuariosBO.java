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
package es.pfc.negocio;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.MessagingException;
import javax.mail.Transport;
import java.util.Properties;
import es.pfc.dao.UsuarioDAOImpl;
import es.pfc.model.Usuario;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ko
 */
public class UsuariosBO {
    
    public static boolean ComprobarAdmin(Usuario usuario){
        UsuarioDAOImpl usuariocomprobado = new UsuarioDAOImpl();
        int rol;
        try {
            rol=usuariocomprobado.dameROl(usuario.getDni());
            if(rol==-1){
                System.out.print("Error al comprobar rol: -1");
                return false;
            }else{
                if(rol==1){
                    //es administrador
                    return true;
                }else{
                    //no es administrador
                    return false;
                }
      
            }
            
        } catch (Exception ex) {
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
    public static Usuario insertaUsuarioCentro(Usuario usuario){
        UsuarioDAOImpl usuarioinsertado = new UsuarioDAOImpl();
        boolean insertado=false;
        Usuario miusuario = new Usuario();
        try{
            insertado=usuarioinsertado.insertarUsuario(usuario);
            System.out.println("Usuario insertado: "+insertado);
            miusuario = usuarioinsertado.consultarUsuario(usuario.getNombre(), usuario.getPassword());
            System.out.println();
            usuario.setIdUsuario(miusuario.getIdUsuario());                           
        }catch(Exception ex){
             Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return miusuario;
    }
    
    public static boolean insertaUsuario(Usuario usuario){
        UsuarioDAOImpl usuarioinsertado = new UsuarioDAOImpl();
        boolean insertado=false;
        Usuario miusuario = new Usuario();
        try{
            insertado=usuarioinsertado.insertarUsuario(usuario);
            System.out.println("Usuario insertado: "+insertado);
            miusuario = usuarioinsertado.consultarUsuario(usuario.getNombre(), usuario.getPassword());
            usuario.setIdUsuario(miusuario.getIdUsuario());            
            if(insertado)
                return true;
        }catch(Exception ex){
             Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public static List listaUsuarios(int idCentro){
        UsuarioDAOImpl listausuarios = new UsuarioDAOImpl();
        try{
            
            return listausuarios.listarUsuarios(idCentro);
            
        }catch(Exception ex){
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static List listaRoles(){
        List lista = new ArrayList();
        UsuarioDAOImpl dameroles = new UsuarioDAOImpl();
        try{            
            lista=dameroles.consultarRoles();
        }catch(Exception ex){
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }    
        return lista;
    }        
    
    public static boolean enviarMail(String email, String usuario, String password){
        if("".equals(email)){
            System.out.println("contacto vacío");
            return false;
        }
        Properties prop = new Properties();
        prop.put("mail.smtp.host","smtp.gmail.com");
        prop.put("mail.from", "admin@silusoft.com");
        Session session = Session.getInstance(prop, null);
        try {
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom();
        msg.setRecipients(Message.RecipientType.TO,
                          email);
        msg.setSubject("Siludermis SiluSoft");
        msg.setSentDate(new Date());
        msg.setText("Hola, le da la bienvenida el equipo de Siludermis!\n. Sus datos de acceso son:\nusuario: "+usuario+"\ncontraseña: "+password);
        Transport.send(msg);
        } catch (MessagingException mex) {
            System.out.println("send failed, exception: " + mex);
        }
        return true;
    }
    
    public static boolean actualizaUsuario(Usuario usuario){
        UsuarioDAOImpl actualizaUsuario = new UsuarioDAOImpl();
        try{            
            return actualizaUsuario.modificarPerfil(usuario);
        }catch(Exception ex){
            Logger.getLogger(UsuariosBO.class.getName()).log(Level.SEVERE, null, ex);
        }    
        return false;
    }      
}
