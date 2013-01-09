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
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<% 
    String url = request.getParameter("url");
    String maq = request.getParameter("maq");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="asistencia.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
                  <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">
	<center>
        <div class="cuerpoblanco" align="center">
		<table class="tabla">
            <html:form action="/Asistencia" >   
                <tr>
                    <td colspan="2"><center><bean:message key="asistencia.de"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></center></strong></td>
                </tr>
                <tr>
                    <td align="center"><bean:message key="asistencia.fit"/>:<html:radio property="maquina" value="fit" /></td>
                    <td align="center"><bean:message key="asistencia.comfort"/><html:radio property="maquina" value="confort" /></td>
                </tr>
                <tr>
                    <td colspan="2"><html:hidden name="cliente" property="idCliente" /><center><html:submit value="Enviar" /></center></td>
                </tr>
                </html:form> 
			</table>
        </div>
		</center>
    </logic:present>
    </body>
</html>
