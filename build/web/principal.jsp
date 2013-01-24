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
<%   
    session.removeAttribute("cliente");
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <div class="row">        
        <div class="span3"><logic:equal name="ConsultaClientes" property="activado" value="true"><html:link href="/SiluSoft/insertarCliente.jsp"><img src="imagenes/Pencil.png" /></html:link></logic:equal></div>
        <!-- <div class="span3"><a href="ListaClientes.do?pag=1" class="btn btn-success btn-primary">Listado clientes</a></p></div> -->
        <div class="span3"><html:link href="ListaClientes.do?pag=a"><img src="imagenes/User_female.png" /></html:link></p></div>
	<div class="span3"><html:link href="/SiluSoft/buscarCliente.jsp"><img src="imagenes/Search.png" /></html:link></div>	
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