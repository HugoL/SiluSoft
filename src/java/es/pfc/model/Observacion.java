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
public class Observacion implements Serializable {
    private int idCliente;
    private String motivo;
    private String tratamientosAnteriores;
    private String variacionesPeso;
    private float pesoMax;
    private float pesoMin;
    private float pesoIdeal;
    private float tallaActual;
    private float tallaDeseada;
    private int tensionMin;
    private int tensionMax;
    private String enfermedades;
    private String alergias;
    private String terapias;
    private String menstruaciones;
    private boolean embarazos;
    private boolean partos;
    private boolean abortos;
    private String metodoAnticonceptivo;
    private String diuresis;
    private String suenyo;
    private String ritmoIntestinal;
    private String actividadFisica;
    private String digestiones;
    private String pesadezPiernas;
    private String dolor;
    private boolean calambres;
    private boolean piesFrios;
    private boolean manosFrias;
    
    public Observacion(){
        
    }
    
    //metodos get y set
    public int getIdCliente(){
        return idCliente;
    }
    
    public void setIdCliente(int idCliente){
        this.idCliente=idCliente;
    }
    
    public String getMotivo(){
        return motivo;
    }
    public void setMotivo(String motivo){
        this.motivo=motivo;
    }
    
    public String getTratamientosAnteriores(){
        return tratamientosAnteriores;
    }
    public void setTratamientosAnteriores(String tratamientosAnteriores){
        this.tratamientosAnteriores=tratamientosAnteriores;
    }
    
    public String getVariacionesPeso(){
        return variacionesPeso;
    }
    public void setVariacionesPeso(String variacionesPeso){
        this.variacionesPeso=variacionesPeso;
    }
    
    public float getPesoMax(){
        return pesoMax;
    }
    public void setPesoMax(float pesoMax){
        this.pesoMax=pesoMax;
    }
    
    public float getPesoMin(){
        return pesoMin;
    }
    public void setPesoMin(float pesoMin){
        this.pesoMin=pesoMin;
    }
    
    public float getPesoIdeal(){
        return pesoIdeal;
    }
    public void setPesoIdeal(float pesoIdeal){
        this.pesoIdeal=pesoIdeal;
    }
    
     public float getTallaActual(){
        return tallaActual;
    }
    public void setTallaActual(float tallaActual){
        this.tallaActual=tallaActual;
    }
    
     public float getTallaDeseada(){
        return tallaDeseada;
    }
    public void setTallaDeseada(float tallaDeseada){
        this.tallaDeseada=tallaDeseada;
    }
    
    public int getTensionMin(){
        return tensionMin;
    }
    public void setTensionMin(int tensionMin){
        this.tensionMin=tensionMin;
    }
    
    public int getTensionMax(){
        return tensionMax;
    }
    public void setTensionMax(int tensionMax){
        this.tensionMax=tensionMax;
    }
    
    public String getEnfermedades(){
        return enfermedades;
    }
    public void setEnfermedades(String enfermedades){
        this.enfermedades=enfermedades;
    }
    
    public String getAlergias(){
        return alergias;
    }
    public void setAlergias(String alergias){
        this.alergias=alergias;
    }
    
    public String getTerapias(){
        return terapias;
    }
    public void setTerapias(String terapias){
        this.terapias=terapias;
    }
    
    public String getMenstruaciones(){
        return menstruaciones;
    }
    public void setMenstruaciones(String menstruaciones){
        this.menstruaciones=menstruaciones;
    }
    
    public boolean getEmbarazos(){
        return embarazos;
    }
    public void setEmbarazos(boolean embarazos){
        this.embarazos=embarazos;
    }
    
    public boolean getPartos(){
        return partos;
    }
    public void setPartos(boolean partos){
        this.partos=partos;
    }
    
    public boolean getAbortos(){
        return abortos;
    }
    public void setAbortos(boolean abortos){
        this.abortos=abortos;
    }
    
    public String getMetodoAnticonceptivo(){
        return metodoAnticonceptivo;
    }
    public void setMetodoAnticonceptivo(String metodoAnticonceptivo){
        this.metodoAnticonceptivo=metodoAnticonceptivo;
    }
    
    public String getDiuresis(){
        return diuresis;
    }
    public void setDiuresis(String diuresis){
        this.diuresis=diuresis;
    }
    
    public String getSuenyo(){
        return suenyo;
    }
    public void setSuenyo(String suenyo){
        this.suenyo=suenyo;
    }
    
    public String getRitmoIntestinal(){
        return ritmoIntestinal;
    }
    public void setRitmoIntestinal(String ritmoIntestinal){
        this.ritmoIntestinal=ritmoIntestinal;
    }
    
    public String getActividadFisica(){
        return actividadFisica;
    }
    public void setActividadFisica(String actividadFisica){
        this.actividadFisica=actividadFisica;
    }
    
    public String getDigestiones(){
        return digestiones;
    }
    public void setDigestiones(String digestiones){
        this.digestiones=digestiones;
    }
    
    public String getPesadezPiernas(){
        return pesadezPiernas;
    }
    public void setPesadezPiernas(String pesadezPiernas){
        this.pesadezPiernas=pesadezPiernas;
    }
    
    public String getDolor(){
        return dolor;
    }
    public void setDolor(String dolor){
        this.dolor=dolor;
    }
    
    public boolean getCalambres(){
        return calambres;
    }
    public void setCalambres(boolean calambres){
        this.calambres=calambres;
    }
    
    public boolean getPiesFrios(){
        return piesFrios;
    }
    public void setPiesFrios(boolean piesFrios){
        this.piesFrios=piesFrios;
    }
    
    public boolean getManosFrias(){
        return manosFrias;
    }
    public void setManosFrias(boolean manosFrias){
        this.manosFrias=manosFrias;
    }
}
