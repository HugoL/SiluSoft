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
        <title><bean:message key="sesiones.confirmar"/></title>
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
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
	<li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=9">Calcular Sesiones</a></li>
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>   
    <div class="span11 cuerpoficha">
    <logic:present name="cliente">              
        <legend><bean:message key="sesiones.calculadas"/> para <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></legend>
        <center><div class="span10">        
            <html:form action="/InsertaSesiones" styleClass="form-inline">
                <div class="control-group">
                <label><bean:message key="general.fit"/>:</label>                
                    <input type="text" name="fit" value="<bean:write name="sesiones" property="fit"/>" class="span1" />               
                </div>
                <div class="control-group">
                <label><bean:message key="general.comfort"/>:</label>                
                    <input type="text" name="comfort" value="<bean:write name="sesiones" property="confort" />" class="span1" />                
                </div>                
                <div class="control-group">
                    <html:submit value="Confirmar" styleClass="btn btn-danger"/>
                </div>
            </html:form>
    </div></center>
    </div>
    </logic:present>
    </logic:equal>
    </div>
    </div>
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
        <center><tr class="tabla">   
                <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/><br /><a href="javascript:history.back()"><bean:message key="general.volver"/></a></div></td>
    		</tr>   
        </table>
        </center>    
    </logic:notEqual>
     </logic:present>
      <logic:notPresent name="usuario" scope="session">
    <center>No se le ha conocido como usuario registrado</center><br /><html:link href="./Registro.do">Registrarse</html:link>
</logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
     </div>
     </div>
    </body>
</html>
