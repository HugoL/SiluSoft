/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.pfc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ko
 */
public class Conexion {
    public static Connection getConexion(){
        String usuario = "root";
        String pass = "523360";
        Connection c = null;        
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SiluBd",usuario,pass);
        }catch(ClassNotFoundException e){
            System.out.println("Error al cargar la conexion: "+e);
        }
        catch(SQLException e){
            System.out.println("Error SQL: "+e);
        }
        
        return c;
    }
}
