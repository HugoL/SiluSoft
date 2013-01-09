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

import java.sql.Time;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author ko
 */
public class AgendaForm extends org.apache.struts.action.ActionForm {
    
    private int idAgenda;
    private Date fecha;
    private Time hora;
    private String evento90;
    private String evento93;
    private String sala;
    private int idCentro;
    private String evento10;
    private String evento103;
    private String evento11;
    private String evento21;
    private String evento113;
    private String evento12;
    private String evento123;
    private String evento13;
    private String evento133;
    private String evento14;
    private String evento143;
    private String evento15;
    private String evento153;
    private String evento16;
    private String evento163;
    private String evento17;
    private String evento173;
    private String evento18;
    private String evento183;
    private String evento19;
    private String evento193;
    private String evento20;
    private String evento203;
    
 
    public int getIdAgenda(){
        return idAgenda;
    }
    
    public void setIdAgenda(int idAgenda){
        this.idAgenda=idAgenda;
    }
    
    public Date getFecha(){
        return fecha;
    }
    
    public void setFecha(Date fecha){
        this.fecha=fecha;
    }
    
    public Time getHora(){
        return hora;
    }
    
    public void setHora(Time hora){
        this.hora=hora;
    }
    
    public String getEvento90(){
        return evento90;
    }
    
    public void setEvento90(String evento){
        evento90=evento;
    }
    
    public String getEvento93(){
        return evento93;
    }
    
    public void setEvento93(String evento){
        evento93=evento;
    }
    
    public String getEvento10(){
        return evento10;
    }
    
    public void setEvento10(String evento){
        evento10=evento;
    }
    
    public String getEvento103(){
        return evento103;
    }
    
    public void setEvento103(String evento){
        evento103=evento;
    }
    
     public String getEvento11(){
        return evento11;
    }
    
    public void setEvento11(String evento){
        evento11=evento;
    }
    
     public String getEvento113(){
        return evento113;
    }
    
    public void setEvento113(String evento){
        evento113=evento;
    }
    
     public String getEvento12(){
        return evento12;
    }
    
    public void setEvento12(String evento){
        evento12=evento;
    }
    
     public String getEvento123(){
        return evento123;
    }
    
    public void setEvento123(String evento){
        evento123=evento;
    }
    
     public String getEvento13(){
        return evento13;
    }
    
    public void setEvento13(String evento){
        evento13=evento;
    }
    
     public String getEvento133(){
        return evento133;
    }
    
    public void setEvento133(String evento){
        evento133=evento;
    }
    
     public String getEvento14(){
        return evento14;
    }
    
    public void setEvento14(String evento){
        evento14=evento;
    }
    
     public String getEvento143(){
        return evento143;
    }
    
    public void setEvento143(String evento){
        evento143=evento;
    }
    
     public String getEvento15(){
        return evento15;
    }
    
    public void setEvento15(String evento){
        evento15=evento;
    }
    
     public String getEvento153(){
        return evento153;
    }
    
    public void setEvento153(String evento){
        evento153=evento;
    }
    
     public String getEvento16(){
        return evento16;
    }
    
    public void setEvento16(String evento){
        evento16=evento;
    }
    
     public String getEvento163(){
        return evento163;
    }
    
    public void setEvento163(String evento){
        evento163=evento;
    }
    
     public String getEvento17(){
        return evento17;
    }
    
    public void setEvento17(String evento){
        evento17=evento;
    }
    
     public String getEvento173(){
        return evento173;
    }
    
    public void setEvento173(String evento){
        evento173=evento;
    }
    
     public String getEvento18(){
        return evento18;
    }
    
    public void setEvento18(String evento){
        evento18=evento;
    }
    
     public String getEvento183(){
        return evento183;
    }
    
    public void setEvento183(String evento){
        evento183=evento;
    }
    
     public String getEvento19(){
        return evento19;
    }
    
    public void setEvento19(String evento){
        evento19=evento;
    }
    
     public String getEvento193(){
        return evento193;
    }
    
    public void setEvento193(String evento){
        evento193=evento;
    }
    
     public String getEvento20(){
        return evento20;
    }
    
    public void setEvento20(String evento){
        evento20=evento;
    }
    
     public String getEvento203(){
        return evento203;
    }
    
    public void setEvento203(String evento){
        evento203=evento;
    }
    
     public String getEvento21(){
        return evento21;
    }
    
    public void setEvento21(String evento){
        evento21=evento;
    }
    
    public String getSala(){
        return sala;
    }
    
    public void setSala(String sala){
        this.sala=sala;
    }
    
    public int getIdCentro(){
        return idCentro;
    }
    
    public void setIdCentro(int idCentro){
        this.idCentro=idCentro;
    }
    
   

    /**
     *
     */
    public AgendaForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getIdCentro() == 0 ) {
            errors.add("name", new ActionMessage("error.name.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }
}
