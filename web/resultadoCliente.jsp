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
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="es.pfc.model.Cliente"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="buscarcliente.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     	<center><div class="cuerpoblanco">
                <p align="right"><bean:message key="general.sesion"/>: <strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</p>
                <h3><bean:message key="buscarcliente.resultado"/></h3>
        <logic:present name="cliente">
        <table width="80%" >
		<tr>
                    <td><strong><bean:message key="formulario.dni"/></strong></td>
                    <td><strong><bean:message key="formulario.nombre"/></strong></td>
                    <td><strong><bean:message key="formulario.apellido1"/></strong></td>  
                    <td><strong><bean:message key="formulario.apellido2"/></strong></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
        <logic:iterate id="cliente" name="cliente" scope="request" type="es.pfc.model.Cliente">             
            <tr class="datos">
                <td><bean:write name="cliente" property="dni" /></td>
                <td id="Nombre"><bean:write name="cliente" property="nombre" /></td>          
                <td><bean:write name="cliente" property="apellidos" /></td>
                <td><bean:write name="cliente" property="apellido2" /></td>
		<td><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=8">Editar</a> </td>
                <td><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=3">Ver Ficha</a></td>
                <td><a href="EliminarCliente.do?Id=<bean:write name="cliente" property="idCliente" />">Eliminar</a> </td>
            </tr> 
        </table>
        </logic:iterate>
        </logic:present>
        <logic:notPresent name="cliente">
            <center><bean:message key="buscarcliente.noresultado"/></center>
    </logic:notPresent>
		<p></p>
		 <html:link href="principal.jsp"><img src="imagenes/home.png"></html:link>
                 <html:link href="/SiluSoft/buscarCliente.jsp"><img src="imagenes/buscar.png" /></html:link>
        <p></p>
		</div></center>
     </logic:present>
     <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
