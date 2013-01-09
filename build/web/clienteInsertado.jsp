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
    along with this program.  If not, see <http://www.gnu.org/licenses/>.-oct-2011, 17:43:17   
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

<!DOCTYPE html>
<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="clientein.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <center><tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
         <table class="cuerpoblanco">
         <tr>
             <td>		 
         <center><div class="cuerpo" align="center">
             <p align="right"><bean:message key="general.sesion"/>: <strong>
	 <bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</p>
        <h3><bean:message key="clientein.titulo"/></h3>
        
        <table bgcolor="#FFFFFF" width="80%">     
        <tr class="datos">            
            <td align="center"><a href="ActualizarCliente.do?Id=<bean:write name="cliente" property="idCliente"/>"><img src="imagenes/botonRellenarFicha.png"/></a> </td> 
            <td align="center"><html:link href="principal.jsp"><img src="imagenes/home.png"></html:link> </td>   
        </tr>
        </table>
             &nbsp;</div></td><tr></table>
    </div></center>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html:html>
