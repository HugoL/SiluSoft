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

<%@page import="es.pfc.model.Cliente"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="sesiones.restantes"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
           <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">       
        
    <center>	
	  
        <div class="cuerpoblanco">
            <br />
	<table width="80%" cellspacing="5">
            <tr>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><bean:message key="sesiones.restantes"/>: <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></td>
            </tr>
            <tr>
                <td><span class="agendafit"><bean:message key="sesiones.fit"/>:</span> 
              <strong><bean:write name="sesiones" property="fit" /></strong></td>
                <td><span class="agendaconfort"><bean:message key="sesiones.comfort"/>:</span> 
              <strong><bean:write name="sesiones" property="confort" /></strong></td>
            </tr>
            <tr>
                <td colspan="2"><center><a href="verFichaDatos.do?Dni=<bean:write name="cliente" prperty="dni"/>"><bean:message key="sesiones.ficha"/></a></center></td>
            </tr>
        </table>
        </logic:present>	
        </center>  
    </div>
    <logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>    
    </body>
</html>
