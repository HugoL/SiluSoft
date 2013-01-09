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
<%
    String maquina = request.getParameter("maquina");
    String evento = request.getParameter("evento");
    String fecha = request.getParameter("fecha");
    String estilo = request.getParameter("estilo");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Evento</title>
        <LINK href="../estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="cuerpoblanco">
            <logic:present name="usuario">
            <logic:equal name="ManipulaAgenda" property="activado" value="true">
		<p align="center" class="<%= estilo %>"><br />Anotaci&oacute;n de agenda para el d&iacute;a <strong><%= fecha %></strong></p>
            <center><html:form action="/InsertaEvento" >
                <html:hidden property="evento" value="<%=evento%>" /><br />
                <html:hidden property="maquina" value="<%=maquina%>" /><br />
                <html:hidden property="fecha" value="<%=fecha%>" /><br />
				<p>Escribe en el cuadro de texto la anotaci&oacute;n </p>
                 <br/>
                Cliente: <html:select property="acto" >
                    <html:option value="0">---</html:option>
                    <logic:iterate id="cliente" name="listaClientes" scope="session" type="es.pfc.model.Cliente">
                        <html:option value="${cliente.nombre} ${cliente.apellidos}"><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></html:option>
                    </logic:iterate>                 
                </html:select>
                    Trabajador:  <html:select property="asignado" >
                    <html:option value="0">---</html:option>
                    <logic:iterate id="usuariolista" name="listaUsuarios" scope="session" type="es.pfc.model.Usuario">
                        <html:option value="${usuariolista.nombre} ${usuariolista.apellidos}"><bean:write name="usuariolista" property="nombre" /> <bean:write name="usuariolista" property="apellidos" /></html:option>
                    </logic:iterate>                 
                </html:select>
                    Otra informaci&oacute;n: <html:text property="masinfo" > </html:text>
                    <br />
                <html:submit value="Enviar" />
            </html:form></center>
        </logic:equal>
        <logic:notEqual name="ManipulaAgenda" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> Ud. no tiene permisos para introducir datos en la agenda</p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
            </logic:present>
            <logic:notPresent name="usuario">
            <div class="cuerpoblanco" align="center"> No se le reconoce como usuario</div>
                </logic:notPresent>
        </div>
    </body>
</html>
