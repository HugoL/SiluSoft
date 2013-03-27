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
<%@page import="es.pfc.model.Usuario"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    session.removeAttribute("cliente");
%>
<!DOCTYPE html>

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
<%--<bean:write name="cabecera" filter="false"/>--%>
<div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <div class="row-fluid">        
        <div class="span3"><logic:equal name="ConsultaCentro" property="activado" value="true"><html:link href="listaTratamientosCentro.do?di=1"><img src="imagenes/tratamiento.png" /></html:link></logic:equal></div>
	<div class="span3"><logic:equal name="ConsultaCentro" property="activado" value="true"><a href="FichaCentro.do?Id=<bean:write name="usuario" property="idCentro"/>"><img src="imagenes/admin.png" /></a></logic:equal></div>
	<div class="span3"><logic:equal name="ConsultaAgenda" property="activado" value="true"><a href="miAgenda.do?var=0"><img src="imagenes/agenda.png" width="130" height="94" /></a></logic:equal></div>
    </div>
    </div>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
</div>
</logic:present>
     
<logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="welcome.identificarse"/></html:link></center>
</logic:notPresent>
        </div> <!-- container -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="JS/bootstrap.min.js"></script>
    <script src="JS/bootstrap-modal.js"></script>
</body>
</html>