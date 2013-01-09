<%-- 
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
--%>
<%@page import="java.util.HashMap"%>
<%@page import="es.pfc.model.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
    List Clientes = (List) request.getAttribute("listado"); 
    session.removeAttribute("cliente");
 %>
<!DOCTYPE html>
<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="listadoclientes.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <%-- include header --%>
     <%-- include header --%>
     <center>
	 <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
	 
	 <logic:equal name="usuario" property="rol" value="1" scope="session" >
         <div class="cuerpoblanco"> 
		 <center><img src="imagenes/Lock.png" width="64" height="64">
		 </center>
           
		 <h3><bean:message key="listadoclientes.titulo"/> </h3>        
        <table bgcolor="#FFFFFF" width="80%">
        	<tr>                
                    <td><strong><bean:message key="formulario.nombre" /></strong></td>
                    <td><strong><bean:message key="formulario.apellido1"/></strong></td>  
                    <td><strong><bean:message key="formulario.apellido2"/></strong></td>  
                    <td></td>          
                    <td></td>
                    <td colspan="2"></td>
                </tr>
               
                 <logic:iterate id="cliente" name="listado" scope="request" type="es.pfc.model.Cliente">
                    
        <tr class="datos"> 
                  
                  <td id="Nombre"><bean:write name="cliente" property="nombre"/></td>
                  <td><bean:write name="cliente" property="apellidos"/></td>  
                  <td><bean:write name="cliente" property="apellido2"/></td> 
                  <td><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=3">Ver Ficha</a></td>                            
                  <td><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=8">Editar</a> </td>
                  <td><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=7">Asistencia</td>
        </tr>
         </logic:iterate>
        
    </table>
         </div>
	 </logic:equal>
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/></p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>	 
   </logic:present>
<logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></center>
</logic:notPresent>
</center>
<p></p>
         
         
         
      
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html:html>

