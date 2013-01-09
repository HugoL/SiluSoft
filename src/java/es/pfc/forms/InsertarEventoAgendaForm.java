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

import java.sql.Date;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author ko
 */
public class InsertarEventoAgendaForm extends ValidatorForm{
    
    private String fecha;
    private Date mifecha;
    private String evento;
    private String acto;
    private String maquina;
    private String asignado;
    private String masinfo;
    private String estado;
    private int valoracion;
    /**
     * @return
     */
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha= fecha;
    }
    
    public String getEvento() {
        return evento;
    }

    public void setEvento(String evento) {
        this.evento=evento;
    }
    
    public String getActo() {
        return acto;
    }

    public void setActo(String acto) {
        this.acto=acto;
    }
    
    public String getMaquina() {
        return maquina;
    }

    public void setMaquina(String maquina) {
        this.maquina=maquina;
    }
    
    public String getAsignado() {
        return asignado;
    }

    public void setAsignado(String asignado) {
        this.asignado=asignado;
    }
    
    public String getMasinfo() {
        return masinfo;
    }

    public void setMasinfo(String masinfo) {
        this.masinfo=masinfo;
    }
    
     public String getEstado(){
        return estado;
    }
    
    public void setEstado(String estado){
      this.estado=estado;
    }
    
    public int getValoracion(){
        return valoracion;
    }
    
    public void setValoracion(int valoracion){
      this.valoracion=valoracion;
    }
 

    /**
     *
     */
    public InsertarEventoAgendaForm() {
        super();
        // TODO Auto-generated constructor stub
    }
}
