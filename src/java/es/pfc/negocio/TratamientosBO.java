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

import es.pfc.dao.TratamientosDAOImp;
import es.pfc.model.Cliente;
import es.pfc.model.Tratamiento;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko
 */
public class TratamientosBO {
    
    public static Tratamiento esInsertado(Tratamiento tratamiento){
        TratamientosDAOImp tratamientoInsertado = new TratamientosDAOImp();
        Tratamiento miTratamiento=new Tratamiento();
        
        System.out.println("TratamientosBO id: "+tratamiento.getIdCliente());
        try {
            miTratamiento=tratamientoInsertado.create(tratamiento);
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return miTratamiento;
    }
    
    public static boolean esInsertadoTratamientoCentro(Tratamiento tratamiento){
        TratamientosDAOImp tratamientoop = new TratamientosDAOImp();
        boolean insertado=false;
        try {
            insertado = tratamientoop.createTratamientoCentro(tratamiento);
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return insertado;
    }
    
    public static List esListado (Cliente cliente){
        
            TratamientosDAOImp tratamientoslistados = new TratamientosDAOImp();
            List listado = new ArrayList();
        try {
            listado = tratamientoslistados.list(cliente.getIdCliente());
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listado;
    }

    public static Tratamiento esActualizado(Tratamiento tratamiento) {
        Tratamiento tratamientoact = new Tratamiento();
        TratamientosDAOImp tratamientodao = new TratamientosDAOImp();
         try {
            tratamientoact = tratamientodao.update(tratamiento);                  
            
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return tratamientoact;
    }
    
    public static List verTratamientosCentro(int idCentro){
        TratamientosDAOImp tratamientoslistados = new TratamientosDAOImp();
        List listado = new ArrayList();
        try {
            listado = tratamientoslistados.listGeneral(idCentro);
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listado;
    }
        
    public static boolean eliminarTratamientoCentro(int id){
        TratamientosDAOImp tratamientoop = new TratamientosDAOImp();
        boolean eliminado=false;
        try {
            eliminado = tratamientoop.deleteTratamientoCentro(id);
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return eliminado;
    }
    
    public static boolean comprobarTratamientoCliente(int idTratamiento){
        TratamientosDAOImp tratamientoop = new TratamientosDAOImp();
        boolean eliminado=false;
        try {
            eliminado = tratamientoop.comprobarTratamientoCliente(idTratamiento);
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return eliminado;
    }
    
    public static Tratamiento leeDatosTratamiento(int id){
        TratamientosDAOImp tratamientoop = new TratamientosDAOImp();
        Tratamiento tratamiento = new Tratamiento();
        try {
            tratamiento=tratamientoop.read(id);
            return tratamiento;
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }
    
    public static float damePrecioTratamiento(int idCentro, int idTratamiento){
        TratamientosDAOImp preciotrat = new TratamientosDAOImp();
        try {
            return preciotrat.precioTratamiento(idCentro, idTratamiento);                            
            
        } catch (Exception ex) {
            Logger.getLogger(TratamientosBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
}
