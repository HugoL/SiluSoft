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
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/nuevosestilos.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="cliente.insertapeso"/></title>              
    </head>
    <body>
         <div>
             <h3><bean:message key="cliente.insertapeso"/></h3>
             <div  class="cuerpoficha">
                                <logic:iterate id="lista" name="listadop" scope="request" type="es.pfc.model.Peso">                                
                                    <div class="span2"><bean:message key="formulario.peso"/>: <bean:write name="lista" property="peso" /></div>
                                <div class="span3"><bean:message key="cliente.fechapeso"/>: <bean:write name="lista" property="fecha" /></div>  
                                <div class="clearfix"></div>
                                </logic:iterate>   
             </div>
        </div>
    </body>
</html>
