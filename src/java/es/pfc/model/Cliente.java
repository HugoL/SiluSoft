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
import java.util.Date;

/**
 *
 * @author ko
 */
public class Cliente implements Serializable {
    private int id;
    private String dni;
    private String nombre;
    private String apellidos;
    private String apellido2;
    private int edad;
    private Date fechanacimiento;
    private float peso;
    private String direccion;
    private String telefono;
    private String email;
    private String observaciones;
    private int altura;
    private int grasa;
    private float IMC;
    private String fechapeso;
    private String url;
    private String password;
    
    
    public Cliente(){
        
    }
    
      public int getIdCliente() {
            return id;
      }

      public void setIdCliente(int id) {
            this.id = id;
      }
    
     public String getDni() {
            return dni;
      }

      public void setDni(String Dni) {
            this.dni = Dni;
      }
      
      public String getNombre() {
            return nombre;
      }

      public void setNombre(String nombre) {
            this.nombre = nombre;
      }
      
      public String getApellidos() {
            return apellidos;
      }

      public void setApellidos(String apellidos) {
            this.apellidos = apellidos;
      }
      
      public String getApellido2() {
            return apellido2;
      }

      public void setApellido2(String apellido2) {
            this.apellido2 = apellido2;
      }
      
       public Date getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(Date fechanacimiento) {
        this.fechanacimiento=fechanacimiento;
    }
      
      public int getEdad() {
            return edad;
      }

      public void setEdad(int edad) {
            this.edad = edad;
      }
      
      public float getPeso() {
            return peso;
      }

      public void setPeso(float peso) {
            this.peso = peso;
      }
    
      public String getFechapeso() {
        return fechapeso;
      }
      
      public void setFechapeso(String fechapeso) {
        this.fechapeso=fechapeso;
      }
      
      public String getDireccion() {
            return direccion;
      }

      public void setDireccion(String direccion) {
            this.direccion = direccion;
      }
      
      public String getTelefono() {
            return telefono;
      }

      public void setTelefono(String Telefono) {
            this.telefono = Telefono;
      }
      
      public String getEmail() {
            return email;
      }

      public void setEmail(String email) {
            this.email = email;
      }
      
      public String getObservaciones() {
            return observaciones;
      }

      public void setObservaciones(String observaciones) {
            this.observaciones = observaciones;
      }
      public int getAltura() {
            return altura;
      }

      public void setAltura(int altura) {
            this.altura = altura;
      }
      
       public int getIndiceGrasa() {
            return grasa;
      }

      public void setIndiceGrasa(int grasa) {
            this.grasa = grasa;
      }
      
       public float getIMC() {
            return IMC;
      }

      public void setIMC(float IMC) {
            this.IMC = IMC;
      }
      
      public String getUrl() {
            return url;
      }

      public void setUrl(String url) {
            this.url=url;
      }
      
       public String getPassword() {
            return password;
      }

      public void setPassword(String password) {
            this.password = password;
      }
    
}
