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
        <title><bean:message key="buscarcliente.titulo"/></title>        
    </head>
    <body>
         <%-- include header --%>
        <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
    <div class="mi-hero-unit">    
        <div class="row"> 
            <div class="span10"><h4><bean:message key="buscarcliente.resultado"/></h4></div>
        <logic:present name="cliente">
            <div class="span2"><strong><bean:message key="formulario.dni"/></strong></div>
            <div class="span2"><strong><bean:message key="formulario.nombre"/></strong></div>
            <div class="span2"><strong><bean:message key="formulario.apellido1"/></strong></div>  
            <div class="span2"><strong><bean:message key="formulario.apellido2"/></strong></div>
            
        <logic:iterate id="cliente" name="cliente" scope="request" type="es.pfc.model.Cliente">                         
                <div class="span2"><bean:write name="cliente" property="dni" /></div>
                <div class="span2"><bean:write name="cliente" property="nombre" /></div>          
                <div class="span2"><bean:write name="cliente" property="apellidos" /></div>
                <div class="span2"><bean:write name="cliente" property="apellido2" /></div>
                <div class="span1"><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=8" class="btn btn-warning">Editar</a></div>
                <div class="span1"><a href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=3" class="btn btn-inverse">Ficha</a></div>
                <div class="span1"><a href="EliminarCliente.do?Id=<bean:write name="cliente" property="idCliente" />" class="btn btn-danger">Eliminar</a></div>            
        </logic:iterate>
        </logic:present>
        <logic:notPresent name="cliente">
            <div><center><bean:message key="buscarcliente.noresultado"/></center></div>
    </logic:notPresent>
		<div class="span11" align="center"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
                <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
		</div><!-- row -->
     </logic:present>
    </div><!-- hero-unit -->
     <logic:notPresent name="usuario" scope="session">
         <div><center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></div>
</logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </div>
     </div>
    </body>
</html>
