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

import es.pfc.dao.TestDAOImp;
import es.pfc.model.PreguntaTest;
import es.pfc.model.TestCliente;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author ko
 */
public class PreguntaTestBO {
    public static boolean tieneTest(int id){
        boolean tiene = false; 
        try {
            TestDAOImp operacionesTest = new TestDAOImp();
            tiene=operacionesTest.comprobarTest(id);
            
        } catch (Exception ex) {
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
        }
        return tiene;
    }
    
    public static List leerTestCliente(int id){
        List listaPreguntas = new ArrayList();
        List listaGeneral = new ArrayList();
        TestCliente test = new TestCliente();
        PreguntaTest pregunta = null;
        TestDAOImp operacionesTest = new TestDAOImp();
        try {
            //leo el resultado del test
            test=operacionesTest.leeclienteTest(id);
            
            //leo los textos de las preguntas y guardo una lista con un objeto pregunta por cada pregunta del test
            listaPreguntas=operacionesTest.leepreguntasTest();
            
            //leo las 4 respuestas posibles para cada pregunta
            Iterator iter = listaPreguntas.iterator();
            while(iter.hasNext()){ //recorro la lista de objetos pregunta. Cada objeto de la lista se lo paso a la funcion que lee las respuestas de cada pregunta y el objeto generado lo añado a la lista general
                pregunta = (PreguntaTest)iter.next();                
                listaGeneral.add(operacionesTest.leeRespuestasPregunta(pregunta));
            }
            
            //meter en la lista el objeto test que tiene el resultado
            listaGeneral.add(test);
            
            
        } catch (Exception ex) {
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
        }
        
        return listaGeneral;
    }
    
    public static List leerPreguntas(){
         TestDAOImp operacionesTest = new TestDAOImp();
        try{        
         return operacionesTest.leepreguntasTest();
        }catch(Exception ex) {
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
        }
        return null;
    }
    
    public static PreguntaTest leerRespuestasdePregunta(PreguntaTest pregunta){
        TestDAOImp operacionesTest = new TestDAOImp(); 
        try{                  
         pregunta=operacionesTest.leeRespuestasPregunta(pregunta);     
        }catch(Exception ex) {
            System.out.println("Error en PreguntaTestBO.leerRespuetasdePregunta: "+ex);
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
        }
        return pregunta;
    }
    
    public static List leerResultados(int idCliente){
         TestDAOImp operacionesTest = new TestDAOImp(); 
         List listaResultados = new ArrayList();
         try{                  
            listaResultados=operacionesTest.leeresultadosTest(idCliente);   
         }catch(Exception ex) {
            System.out.println("Error en PreguntaTestBO.leerRespuetasdePregunta: "+ex);
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
         }
         return listaResultados;
    }
    
    public static PreguntaTest leePreguntaResultado(PreguntaTest pregunta){
        TestDAOImp operacionesTest = new TestDAOImp(); 
         try{  
             operacionesTest.preguntaResultado(pregunta);               
         }catch(Exception ex) {
            System.out.println("Error en PreguntaTestBO.leerPreguntaResultado: "+ex);
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
         }
         return pregunta;
    }
    
    public static TestCliente leerResultadoTest(int idCliente){
        TestDAOImp operacionesTest = new TestDAOImp(); 
        TestCliente test = new TestCliente();
         try{  
             test=operacionesTest.leeclienteTest(idCliente);               
         }catch(Exception ex) {
            System.out.println("Error en PreguntaTestBO.leerPreguntaResultado: "+ex);
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
         }
         return test;
    }
    
    public static boolean insertarTestCliente(TestCliente test){
        TestDAOImp operacionesTest = new TestDAOImp();     
        boolean resultado=false;
         try{  
             resultado=operacionesTest.insertaclienteTest(test);               
         }catch(Exception ex) {
            System.out.println("Error en PreguntaTestBO.insertarTestCliente: "+ex);
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
         }
         return resultado;
    }
    
    public static boolean insertarResultadoPregunta(PreguntaTest pregunta){
        boolean res = false;
        TestDAOImp operacionesTest = new TestDAOImp();    
         try{  
           //llamar a la funcion que me introduce el resultado del test, la fecha y el id del cliente (tabla Cliente-Test)
             res=operacionesTest.insertarResultadoPregunta(pregunta);
         }catch(Exception ex) {
            System.out.println("Error en PreguntaTestBO.insertarResultadoTest: "+ex);
            Logger.getLogger(PreguntaTestBO.class.getName()).log(Level.ALL, null, ex);
         }
        return res;
    }
    
}
