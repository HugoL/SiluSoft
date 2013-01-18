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
        <title><bean:message key="clientein.titulo"/></title>        
    </head>
    <body>
        <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <div class="row"> 
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
    <logic:present name="cliente">             
        <div class="alert alert-success"><h4><bean:message key="clientein.titulo"/></h4></div>                         
        <div class="span5" align="center"><a class="btn btn-danger" href="ActualizarCliente.do?Id=<bean:write name="cliente" property="idCliente"/>"><em class="icon-user icon-white"></em><bean:message key="clientein.rellenaficha"/></a></div> 
        <div class="span5" align="center"><html:link styleClass="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> <bean:message key="general.volvermenu"/></html:link></div>   
    </logic:present>
    </logic:present><!-- usuario -->
    </div>
    <logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
    </logic:notPresent>
    </div>
    </div>
        <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/><br/>
     </div>
     </div>
    </body>
</html:html>
