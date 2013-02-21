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
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html:html>
 <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/nuevosestilos.css" rel="stylesheet">
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
	 <h3><bean:message key="buscarcliente.titulo"/></h3>
         <div class="well">
        <html:form action="/BuscarCliente">
            <div><bean:message key="buscarcliente.textodatos"/></div>
            <div><label><bean:message key="formulario.dni"/>:</label>
                <html:text property="dni" /></div>
            <div><label><bean:message key="formulario.nombre"/>:</label>
                <html:text property="nombre" /></div>     
            <div><label><bean:message key="formulario.apellido1"/>:</label>
                <html:text property="apellido1" /></div>        
            <div><label><bean:message key="formulario.apellido2"/>:</label>
                <html:text property="apellido2" /></div>      
                
                <div><p><input type="submit" class="btn btn-danger" value="Buscar" /></p></div>                 
        </html:form>
         </div>	
         <div><a href="principal.jsp" class="btn btn-success"><em class="icon-home icon-white"></em> Volver al menú</a></div>
         <p><html:errors/></p>
	 </div>
    </div>
     </div><!-- container -->
		 
     </logic:present>
     
     <logic:notPresent name="usuario" scope="session">
         <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html:html>
