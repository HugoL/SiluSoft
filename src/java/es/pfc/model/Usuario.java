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
package es.pfc.model;
import java.io.Serializable;
/**
 *
 * @author ko
 */
public class Usuario implements Serializable {
    
    private int idUsuario;
    private String nombre;
    private String password;
    private int idCentro;
    private String dni;
    private String apellidos;
    private String telefono;
    private String email;
    private int rol;
    private String direccion;

    
    public Usuario(){
        
    }
      /*public Usuario (String usuario, String password) {
            this.nombre = usuario;
            this.password  = password;
      }*/
      public int getIdUsuario(){
          return idUsuario;
      }
      
      public void setIdUsuario(int idUsuario){
          this.idUsuario = idUsuario;
      }

      public String getPassword() {
            return password;
      }


      public void setPassword(String password) {
            this.password = password;
      }

      public String getNombre() {
            return nombre;
      }

      public void setNombre(String nombre) {
            this.nombre = nombre;
      }
      
      public int getIdCentro(){
          return idCentro;
      }
      
      public void setIdCentro(int idCentro){
          this.idCentro = idCentro;
      }
      
      public String getDni(){
          return dni;
      }
      
      public void setDni(String dni){
          this.dni = dni;
      }
      
      public String getApellidos(){
          return apellidos;
      }
      
      public void setApellidos(String apellidos){
          this.apellidos=apellidos;
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
      
      
}
