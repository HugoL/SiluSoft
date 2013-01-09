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
package es.pfc.forms;

import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author ko
 */
public class InsertarUsuarioForm extends ValidatorForm {
    
    private String dni;
    private String nombre;
    private String apellidos;
    private int idCentro;
    private String telefono;
    private String email;
    private int rol;
    private String password;
    private String password2;
    private String direccion;
    private boolean consultaClientes;
    private boolean manipulaClientes;
    private boolean consultaCentro;
    private boolean manipulaCentro;
    private boolean administracion;
    private boolean consultaAgenda;
    private boolean manipulaAgenda;
    private boolean insertaClientes;
    private boolean eliminaClientes;

    public String getPassword() {
            return password;
    }     

    public void setPassword(String password) {
            this.password = password;
    }
    
    public void setPassword2(String password2) {
            this.password2 = password2;
    }
      
    public String getPassword2() {
            return password2;
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
        this.nombre=nombre;
    }
    
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos=apellidos;
    }

    public int getIdCentro(){
          return idCentro;
      }
      
    public void setIdCentro(int idCentro){
          this.idCentro = idCentro;
    }
    
    public String getTelefono(){
          return telefono;
      }
      
      public void setTelefono(String telefono){
          this.telefono=telefono;
      }
      
      public String getDireccion(){
          return direccion;
      }
      
      public void setDireccion(String direccion){
          this.direccion=direccion;
      }
      
      public String getEmail(){
          return email;
      }
      
      public void setEmail(String email){
          this.email=email;
      }
      
      public int getRol(){
          return rol;
      }
      
      public void setRol(int rol){
          this.rol=rol;
      }
      
      public boolean getConsultaClientes(){
          return consultaClientes;
      }
      
      public void setConsultaClientes(boolean consultaClientes){
          this.consultaClientes=consultaClientes;
      }
      
      public boolean getManipulaClientes(){
          return manipulaClientes;
      }
      
      public void setManipulaClientes(boolean manipulaClientes){
          this.manipulaClientes=manipulaClientes;
      }
      
      public boolean getConsultaCentro(){
          return consultaCentro;
      }
      
      public void setConsultaCentro(boolean consultaCentro){
          this.consultaCentro=consultaCentro;
      }
      
      public boolean getManipulaCentro(){
          return manipulaCentro;
      }
      
      public void setManipulaCentro(boolean manipulaCentro){
          this.manipulaCentro=manipulaCentro;
      }
      
      public boolean getAdministracion(){
          return administracion;
      }
      
      public void setAdministracion(boolean administracion){
          this.administracion=administracion;
      }
      
      public boolean getConsultaAgenda(){
          return consultaAgenda;
      }
      
      public void setConsultaAgenda(boolean consultaAgenda){
          this.consultaAgenda=consultaAgenda;
      }
      
      public boolean getManipulaAgenda(){
          return manipulaAgenda;
      }
      
      public void setManipulaAgenda(boolean manipulaAgenda){
          this.manipulaAgenda=manipulaAgenda;
      }
      
      public boolean getInsertaClientes(){
          return insertaClientes;
      }
      
      public void setInsertaClientes(boolean insertaClientes){
          this.insertaClientes = insertaClientes;
      }
      
      public boolean getEliminaClientes(){
          return eliminaClientes;
      }
      
      public void setEliminaClientes(boolean eliminaClientes){
          this.eliminaClientes=eliminaClientes;
      }
    /**
     *
     */
    public InsertarUsuarioForm() {
        super();
        // TODO Auto-generated constructor stub
    }
}
