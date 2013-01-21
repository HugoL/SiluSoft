/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.forms;


import es.pfc.model.Usuario;
import org.apache.struts.validator.ValidatorForm;
/**
 *
 * @author Administrador
 */
public class ActualizarUsuarioForm extends ValidatorForm{
    private int id;
    private String dni;
    private String nombre;
    private String apellidos; 
    private String direccion;
    private String telefono;
    private String email;
    private String observaciones;
    
    Usuario usuario = new Usuario();
    /**
     * @return
     */
    
     public int getIdUsuario() {
        return id;
    }

    public void setIdUsuario(int id) {
        this.id = id;
    }
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre =nombre;
    }


    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos=apellidos;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion=direccion;
    }
    
    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono=telefono;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email=email;
    }
    
    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones=observaciones;
    }
    
    public Usuario getCliente(){
        return usuario;
    }
    
    public void setCliente(Usuario usuario){
        this.usuario=usuario;
    }
    
    

    /**
     *
    */ 
    public ActualizarUsuarioForm() {
        super();
        // TODO Auto-generated constructor stub
    }

}
