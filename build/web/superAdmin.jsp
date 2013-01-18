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
        <title><bean:message key="admin.titulo"/></title>
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
	 <logic:equal name="usuario" property="rol" value="1" scope="session" >
             <div clas="span11" align="center"><img class="media-object" src="imagenes/Lock.png" width="64" height="64"></div>		 
             <div><h4><bean:message key="admin.titulo"/></h4></div>
             <html:link href="insertarCentro.jsp" styleClass="btn btn-success"><bean:message key="admin.centro"/></html:link>
             <a class="btn btn-warning" href="ListaCentros.do"><bean:message key="admin.listacentros"/></a>                   
	 </logic:equal>             
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/></p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>	 
        </div><!--row-->
    </div><!--mi-hero-unit-->
    </logic:present>
    <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></center>
    </logic:notPresent>    
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </div>
    </div>    
</body>
</html:html>
