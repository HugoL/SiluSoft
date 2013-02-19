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
public class InsertarTratamientoForm extends ValidatorForm{
    
    private int Idcliente;
    private String tipo;
    private String fechaInicio;
    private String fechaFin;
    private String intervalos;
    private String resultado;
    private String mantenimiento;
    private String observaciones;
    private int Idcentro;
    private String descripcion;
    private float precio;
    private int idTratamiento;
    /**
     * @return
     */
    public int getIdTratamiento(){
        return idTratamiento;
    }
    
    public void setIdTratamiento(int IdTratamiento){
        this.idTratamiento = idTratamiento;
    }
    
    public int getIdcliente(){
        return Idcliente;
    }
    
    public void setIdCliente(int Idcliente){
        this.Idcliente=Idcliente;
    }
    
    public int getIdcentro(){
        return Idcentro;
    }
    
    public void setIdCentro(int Idcentro){
        this.Idcentro=Idcentro;
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo=tipo;        
    }
    
    
    public String getFechaInicio() {
            return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
            this.fechaInicio=fechaInicio;
    }
    
    public String getFechaFin() {
            return fechaFin;
    }
    
    public void setFechaFin(String fechaFin) {
            this.fechaFin=fechaFin;
    }

    public String getIntervalos(){
            return intervalos;
    }
    
    public void setIntervalos(String intervalos){
            this.intervalos=intervalos;
    }
    
    public String getResultados(){
            return resultado;
    }
    
    public void setResultados(String resultado){
            this.resultado=resultado;
    }

    public String getMantenimiento(){
            return mantenimiento;
    }
    
    public void setMantenimiento(String mantenimiento){
            this.mantenimiento=mantenimiento;
    }
    
    public String getObservaciones(){
            return observaciones;
    }
    
    public void setObservaciones(String observaciones){
            this.observaciones=observaciones;
    }
    
    public String getDescripcion(){
            return descripcion;
    }
    
    public void setDescripcion(String descripcion){
            this.descripcion=descripcion;
    }
    
    public float getPrecio(){
        return precio;
    }
    
    public void setPrecio(float precio){
        this.precio=precio;
    }


    /**
     *
     */
    public InsertarTratamientoForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    
}
