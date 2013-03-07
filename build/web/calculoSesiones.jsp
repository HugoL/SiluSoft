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
<%@page import="es.pfc.model.Sesiones"%>
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
        <title>calculo de sesiones</title>
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
    <logic:equal name="ManipulaClientes" property="activado" value="true">
        <div class="row"> 
    <div class="span11">
    <ul class="nav nav-tabs">  
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
	<li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=9">Calcular Sesiones</a></li>
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
    <logic:present name="cliente">
            <logic:present name="sesiones">
                <div class="span4 well well-small"><bean:message key="general.fit"/>               
                    <span class="badge badge-important"><bean:write name="sesiones" property="fit" /></span></div>
                <div class="clearfix"></div>
                <div class="span4 well well-small"><bean:message key="general.comfort"/>
                    <span class="badge badge-info"><bean:write name="sesiones" property="confort" /></span></div>
                <div class="span4 well well-small"><bean:message key="general.total"/></td>
                    <span class="badge badge-warning"><bean:write name="sesiones" property="total" /></span></div>                
		  
            </logic:present>
            <logic:notPresent name="sesiones" >
                <div class="alert alert-warning"><bean:message key="sesiones.noencuentran"/></div>                            
            </logic:notPresent>    
      </logic:present>
    </div> 
    </logic:equal><!-- permisos -->
     </logic:present><!--usuario -->
        </div>
    </div>
    <logic:notPresent name="usuario" scope="session">
     </logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
     </div>
     </div>
    </body>
</html>
