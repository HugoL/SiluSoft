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
        <title><bean:message key="admin.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
     <%-- include header --%>
     <center>
	 <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
	 
	 <logic:equal name="usuario" property="rol" value="1" scope="session" >
         <div class="cuerpoblanco"> 
		 <center><img src="imagenes/Lock.png" width="64" height="64">
		 </center>
           
		 <p class="medidas"><strong><bean:message key="admin.titulo"/></strong></p>
           <p><span><html:link href="insertarCentro.jsp"><img src="imagenes/centro.png" width="130" height="94"></html:link></span>
            &nbsp;&nbsp;&nbsp;<span><a href="ListaCentros.do"><img src="imagenes/centros.png" width="130" height="94"></a>
            </span>
           &nbsp;&nbsp;&nbsp;<html:link forward="logoff"><img src="imagenes/Out.png" /></html:link></p>
           <br />
         </div>
	 </logic:equal>
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/></p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>	 
   </logic:present>
<logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></center>
</logic:notPresent>
</center>
<p></p>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
</body>
</html:html>
