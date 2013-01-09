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
public class Tratamiento implements Serializable {   
    private String Tipo;
    private String FechaInicio;
    private String FechaFin;
    private String Intervalos;
    private String Resultado;
    private String Mantenimiento;
    private String Observaciones;
    private int IdCliente;
    private String Descripcion;
    private int IdCentro;
    private float precio;
    private int idTratamiento;
    
    public Tratamiento(){
        
    }
    
    public int getIdTratamiento() {
            return idTratamiento;
    }

    public void setIdTratamiento(int idTratamiento) {
            this.idTratamiento=idTratamiento;
    }
    
    public String getTipo() {
            return Tipo;
    }

    public void setTipo(String Tipo) {
            this.Tipo=Tipo;
    }
    
    public String getFechaInicio() {
            return FechaInicio;
    }

    public void setFechaInicio(String FechaInicio) {
            this.FechaInicio=FechaInicio;
    }
    
    public String getFechaFin() {
            return FechaFin;
    }
    
    public void setFechaFin(String FechaFin) {
            this.FechaFin=FechaFin;
    }

    public String getIntervalos(){
            return Intervalos;
    }
    
    public void setIntervalos(String Intervalos){
            this.Intervalos=Intervalos;
    }
    
    public String getResultados(){
            return Resultado;
    }
    
    public void setResultados(String Resultado){
            this.Resultado=Resultado;
    }

    public String getMantenimiento(){
            return Mantenimiento;
    }
    
    public void setMantenimiento(String Mantenimiento){
            this.Mantenimiento=Mantenimiento;
    }
    
    public String getObservaciones(){
            return Observaciones;
    }
    
    public void setObservaciones(String Observaciones){
            this.Observaciones=Observaciones;
    }
    
    public int getIdCliente(){
            return IdCliente;
    }
    
    public void setIdCliente(int IdCliente){
            this.IdCliente=IdCliente;
    }
    
     public String getDescripcion(){
            return Descripcion;
    }
    
    public void setDescripcion(String Descripcion){
            this.Descripcion=Descripcion;
    }
    
    public int getIdCentro(){
            return IdCentro;
    }
    
    public void setIdCentro(int IdCentro){
            this.IdCentro=IdCentro;
    }
    
    public float getPrecio(){
            return precio;
    }
    
    public void setPrecio(float precio){
            this.precio=precio;
    }
    
}
