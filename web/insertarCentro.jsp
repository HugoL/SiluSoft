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
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title><bean:message key="insertarcentro.titulo"/></title>
         <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
      <logic:present name="usuario" scope="session">
      <logic:equal name="usuario" property="rol" value="1" scope="session" >   
     <center><div class="cuerpoblanco">
             
             <center><div><h3><bean:message key="insertarcentro.titulo"/></h3></div></center>                     
                
         <html:form action="/InsertaCentro">
           <table align="center" width="100%" cellspacing="5" class="cuerpo">                                              
                <tr>                 
                    <td><strong><bean:message key="formulario.nombre"/>: </strong><input type="text" name="nombre" value=""/> </td>
                    <td><strong><bean:message key="formulario.direccion"/>: </strong><input type="text" name="direccion" value="" /></td>                                   
                </tr>
                <tr>            
                    <td><strong><bean:message key="formulario.telefono"/>: </strong><input type="text" name="telefono" value="" /></td>                               
                    <td></td>
                </tr>           
                <tr>
                    <td colspan="2" align="center"><html:submit value="Insertar"/></td>
                </tr>
                <tr>
		  <td colspan="2" align="center"><br/><html:link href="superAdmin.jsp"><img src="imagenes/home.png"></html:link></td>              
                </tr>
                <tr>
		  <td colspan="2" align="center"><br/><html:errors/></td>              
                </tr>
            </table>          
        </html:form>
             <br />
             </div></center> 
             </logic:equal>
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/></p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>
      </logic:present>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>            
    </body>
</html>
