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
<%@page import="java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Cliente cliente=(Cliente)request.getAttribute("cliente"); 
    List pesos = (List) request.getAttribute("listapesos"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="cliente.insertapeso"/></title>
                <LINK href="estilo.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
         <div>
             <center><bean:message key="cliente.insertapeso"/></center>
                                <logic:iterate id="lista" name="listadop" scope="request" type="es.pfc.model.Peso">
                                
                                    <p class="medidas"><bean:message key="formulario.peso"/>: <bean:write name="lista" property="peso" /> &nbsp;&nbsp;
                                <bean:message key="cliente.fechapeso"/>: <bean:write name="lista" property="fecha" /></p>  
                            
                                </logic:iterate>   
         </div>
    </body>
</html>
