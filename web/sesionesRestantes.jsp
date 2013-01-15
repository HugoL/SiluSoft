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
        <title><bean:message key="sesiones.restantes"/></title>        
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
    <logic:equal name="ConsultaClientes" property="activado" value="true">
        <div class="row"> 
    <div class="span11">
    <ul class="nav nav-tabs">  
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
	<li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
            <logic:present name="sesiones">
                <div class="span4"><bean:message key="sesiones.restantes"/>: <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></div>
           <div class="clearfix"></div>
           <div class="span3"><bean:message key="sesiones.fit"/>: <bean:write name="sesiones" property="resFit" /></div>
           <div class="span3"><bean:message key="sesiones.comfort"/>: <bean:write name="sesiones" property="resConfort" /></div>
           <div class="clearfix"></div>
           <div class="span3"><center><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><bean:message key="sesiones.ficha"/></a></center></div>            
        </logic:present>
            
        <logic:notPresent name="sesiones">
            <div class="alert"><bean:message key="general.cliente"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong> <bean:message key="sesiones.no"/></div>                    
        </logic:notPresent>
        
        </logic:equal>
        <logic:notEqual name="ConsultaClientes" property="activado" value="true">
            <div class="span10" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a class="btn btn-danger" href="javascript:history.back()"> Volver</a></div></div>    		
        </logic:notEqual>
    </div>
        </logic:present>
        <div class="clearfix">&nbsp;</div>
        <div class="span11">
            <a class="btn btn-inverse" href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><em class="icon-user icon-white"></em> Volver a la ficha</a>
            <a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
                <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
        </div><!-- row -->   
    </div>
    <logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>  
    </div>
     </div>
    </body>
</html>
