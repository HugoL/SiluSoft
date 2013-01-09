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
package es.pfc.negocio;

import es.pfc.dao.CentroDAOImp;
import es.pfc.model.Centro;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ko
 */
public class CentrosBO {
    public static Centro leerDatos(int id) throws Exception {
           CentroDAOImp CentroLeido = new CentroDAOImp();
           Centro centro = new Centro();
           
            //boolean esEliminado = false;
            try {
                  centro = CentroLeido.read(id);  
                  return centro;
            } catch (Exception e) {
                  throw e;
            }
     }
    
    public static boolean esActualizado(Centro centro)throws Exception{
        CentroDAOImp CentroActualizado = new CentroDAOImp();
        Centro micentro = new Centro();
        try{
            micentro=CentroActualizado.update(centro);
            if(micentro==null){
                return false;
            }
            return true;
        }catch(Exception e){
            throw e;
        }
    }
    
    public static int esInsertado(Centro centro) throws Exception{
        CentroDAOImp insertacentro = new CentroDAOImp();
        try{
               insertacentro.create(centro);
               return insertacentro.dameIdCentro(centro);
           
        }catch(Exception e){
            throw e;
        }
    }
    
    public static boolean esInsertadoTratamiento(String nombre, String descripcion, int idCentro) throws Exception{
        CentroDAOImp insertacentro = new CentroDAOImp();
        try{
            return insertacentro.insertaTratamiento(nombre, descripcion, idCentro);
        }catch(Exception e){
            throw e;
        }
    }
    
    public static List listaCentros() throws Exception{
        List lista = new ArrayList();
        CentroDAOImp centroslistados = new CentroDAOImp();
        try{
            lista = centroslistados.list();
        }catch(Exception e){
            throw e;
        }
        
        return lista;
    }
    
    public static List listaUsuarios() throws Exception{
        List lista = new ArrayList();
        CentroDAOImp usuariosListados = new CentroDAOImp();
        try{
            lista = usuariosListados.listarUsuarios();
        }catch(Exception e){
            throw e;
        }        
        return lista;
    }
    
    public static boolean insertaSala(int idCentro, String nombre) throws Exception{
        CentroDAOImp salaInsertada = new CentroDAOImp();
        try{
            return salaInsertada.insertaSala(idCentro, nombre);
        }catch(Exception e){
            throw e;
        }
    }
}
