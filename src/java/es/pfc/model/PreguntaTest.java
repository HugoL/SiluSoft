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
public class PreguntaTest implements Serializable{
    private int id;
    private int idCliente;
    private int idPregunta;
    private String texto;
    private String respsanguinea;
    private String resplinfatica;
    private String respbiliosa;
    private String respnerviosa;
    private int respelegida;
    private String respelegidatexto;
    
    public PreguntaTest(){
        
    }
    
    public PreguntaTest(int idCliente){
        this.idCliente=idCliente;
    }
    
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id=id;
    }
    
    public int getIdCliente(){
        return idCliente;
    }
    public void setIdCliente(int idCliente){
        this.idCliente=idCliente;
    }
    
    public int getIdPregunta(){
        return idPregunta;
    }
    public void setIdPregunta(int idPregunta){
        this.idPregunta=idPregunta;
    }
    
    public String getTexto(){
        return texto;
    }
    public void setTexto(String texto){
        this.texto=texto;
    }
    
    public String getRespsanguinea(){
        return respsanguinea;
    }
    public void setRespsanguinea(String respsanguinea){
        this.respsanguinea=respsanguinea;
    }
    
    public String getResplinfatica(){
        return resplinfatica;
    }
    public void setResplinfatica(String resplinfatica){
        this.resplinfatica=resplinfatica;
    }
    
    public String getRespbiliosa(){
        return respbiliosa;
    }
    public void setRespbiliosa(String respbiliosa){
        this.respbiliosa=respbiliosa;
    }
    
    public String getRespnerviosa(){
        return respnerviosa;
    }
    public void setRespnerviosa(String respnerviosa){
        this.respnerviosa=respnerviosa;
    }
    
    public int getRespelegida(){
        return respelegida;
    }
    public void setRespelegida(int respelegida){
        this.respelegida=respelegida;
    }
    
    public String getRespelegidatexto(){
        return respelegidatexto;
    }    
    public void setRespelegidatexto(String respelegidatexto){
        this.respelegidatexto=respelegidatexto;
    }
}
