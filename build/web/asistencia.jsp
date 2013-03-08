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
        <title><bean:message key="asistencia.titulo"/></title>
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
        <legend><bean:message key="asistencia.de"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></legend>
            <logic:equal name="tiene" value="false">
                <div class="alert alert-warning"><bean:message key="general.cliente"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong> <bean:message key="asistencia.nosesiones"/></div>
                <div class="span5"><a class="btn btn-success" href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><em class="icon-heart icon-white"></em> <bean:message key="asistencia.calcular"/></a></div>                
             </logic:equal>
            <logic:equal name="tiene" value="true">                   
                <logic:equal name="quedan" value="false">
                    <div class="alert alert-info" align="center"><bean:message key="asistencia.consumidas"/></div>
                    <div><a class="btn btn-success" href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><em class="icon-user icon-white"></em> <bean:message key="asistencia.ficha"/></a></div>                   
                </logic:equal>
                <logic:equal name="quedan" value="true">
                    <div class="clearfix"></div>
                    <div class="span5"><bean:message key="asistencia.sesionesfit"/>: <span class="badge badge-important"><bean:write name="sesiones" property="resFit" /></span></div>
                    <div class="span5"><bean:message key="asistencia.sesionescomfort"/>: <span class="badge badge-info"><bean:write name="sesiones" property="resConfort" /></span></div>
                    <div class="clearfix"></div>
                    <html:form action="/Asistencia" >                                                    
                    <logic:notEqual name="sesiones" property="resFit" value="0">
                        <div class="span5"><bean:message key="asistencia.fit"/>:<html:radio property="maquina" value="fit" /></div>
                    </logic:notEqual>
                    <logic:notEqual name="sesiones" property="resConfort" value="0">
                        <div class="span5"><bean:message key="asistencia.comfort"/><html:radio property="maquina" value="confort" /></div>
                    </logic:notEqual>
                        <html:hidden name="cliente" property="idCliente"/><html:submit styleClass="btn btn-danger" value="Enviar" />                               
                    </html:form> 
                </logic:equal>                                 
            </logic:equal> 
    </logic:present>      
    </div>
            <div class="span11" align="center"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
                <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
    </div>
    </div>
    </logic:equal> 
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
     </logic:notEqual>
    </logic:present>
    <logic:notPresent name="usuario" scope="session">
    <center>No se le ha conocido como usuario registrado</center><br /><html:link href="./Registro.do">Registrarse</html:link>
</logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/><br/>
     </div>
     </div>
    </body>
</html>
