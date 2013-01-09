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

import es.pfc.model.Cliente;
import java.util.Date;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author ko
 */
public class ActualizarClienteForm extends ValidatorForm {
    
    private int id;
    private String dni;
    private String nombre;
    private String apellidos; 
    private String apellido2; 
    private Date fechanacimiento;
    private int edad;
    private float peso;
    private float altura;
    private String direccion;
    private String telefono;
    private String email;
    private String observaciones;
    private boolean modificarpeso;
    
    Cliente cliente = new Cliente();
    private String fechapeso;
    /**
     * @return
     */
    
    public int getIdCliente() {
        return id;
    }

    public void setIdCliente(int id) {
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
    
    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2=apellido2;
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
        this.edad=edad;
    }
    
    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        
        this.peso=peso;
    }
    
    public boolean getModificarpeso() {
        return modificarpeso;
    }

    public void setModificarpeso(boolean modificarpeso) {
        this.modificarpeso=modificarpeso;
    }
    
    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura=altura;
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
    
    public Cliente getCliente(){
        return cliente;
    }
    
    public void setCliente(Cliente cliente){
        this.cliente=cliente;
    }
    
    

    /**
     *
    */ 
    public ActualizarClienteForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    
}
