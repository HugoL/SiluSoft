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
<%@page import="es.pfc.model.Usuario"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="sala.titulo"/></title>
         <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    <body>
             <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
         <logic:equal name="Administracion" property="activado" value="true">
	 <center>    
        <tiles:insert page="plantillas/PestanasGenerales3.jsp" flush="true"/>	
     <center>
	 <table class="cuerpoblanco">
	 <tr><td>
	 <p align="right"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</p>
	 <h3 align="center"><bean:message key="sala.titulo"/></h3>
             </td></tr>
        <html:form action="/InsertaSala">
            <html:hidden  name="usuario" property="idCentro"  />
        <tr>
            <td align="center"><bean:message key="sala.nombre"/>: <html:text property="nombre" /></td>
        </tr>
        <tr>
            <td align="center"><html:submit value="Enviar" /></td>
        </tr>
        </html:form>
        <tr>
            <td><center><html:errors/></center></td>
        </tr>        
         </table></center>    
         </logic:equal>
        <logic:notEqual name="Administracion" property="activado" value="true">
            <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
     </logic:present>
    <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
    </logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
