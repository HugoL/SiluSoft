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
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
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
        <title><bean:message key="cliente.actualizar"/></title>
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
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
    <logic:present name="cliente">
         <html:form action="/Modificar">
             <fieldset>
            <legend><bean:message key="cliente.actualizar"/></legend>
            <label><bean:message key="formulario.dni"/>: </label><html:text name="cliente" property="dni" />
            <html:hidden name="cliente" property="idCliente" />
            <div class="span3"><label><bean:message key="formulario.nombre"/>:</label><html:text name="cliente" property="nombre" /></div>                 
            <div class="span3"><label><bean:message key="formulario.apellido1"/>: </label><html:text name="cliente" property="apellidos"/></div> 
            <div class="span3"><label><bean:message key="formulario.apellido2"/>: </label><html:text name="cliente" property="apellido2" /></div>            
            <label><bean:message key="formulario.edad"/>: </label><html:text name="cliente" property="edad" />                  
            <label><bean:message key="formulario.telefono"/>: </label><html:text name="cliente" property="telefono" />
            <label><bean:message key="formulario.direccion"/>: </legal><html:text name="cliente" property="direccion"  />                               
            <label><bean:message key="formulario.email"/>: </label><html:text name="cliente" property="email"  />  
            <label><bean:message key="ficha.observaciones"/>: </label><html:text name="cliente" property="observaciones"/>
            <div class="control-group info">
            <label><bean:message key="formulario.altura"/>: </label><html:text name="cliente" property="altura" styleClass="input-small" /><span class="add-on">.m</span>
            <label><bean:message key="formulario.peso"/>: </label><html:text property="peso" styleClass="input-small"/><span class="add-on">.Kg</span>                                             
            <label><bean:message key="cliente.fechapeso"/>: </label><html:text property="fechapeso" value=""  styleClass="input-medium"/><span class="help-inline">(<bean:message key="cliente.dejablanco"/></span>)
            </div>
            <html:errors/>
            </fieldset>       
        </html:form>
            </div>
    </logic:present>
    <div class="span11" align="center"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
                <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
    </div><!-- row -->					
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
            <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
        </logic:notPresent>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </div>
     </div>
    </body>
</html>
