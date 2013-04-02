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

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>

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
    <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
    <div class="mi-hero-unit">        
    <div class="row">  
	 <logic:equal name="ConsultaCentro" property="activado" value="true">         
         <div><h3><bean:message key="fichacentro.titulo"/></h3></div>
           
         <div class="well well-small"><strong><bean:message key="formulario.nombre"/>: </strong><bean:write name="centro" property="nombre" /></div>
         <div class="well well-small"><strong><bean:message key="formulario.direccion"/>: </strong><bean:write name="centro" property="direccion" /></div> 
         <div class="well well-small"><strong><bean:message key="formulario.telefono"/>: </strong><bean:write name="centro" property="telefono" /></div>
    </div>
         <div><p><logic:equal name="ManipulaCentro" property="activado" value="true"><a href="ActualizarCentro.do" class="btn btn-warning"><em class=" icon-pencil icon-white"></em> Modificar datos</a> </logic:equal>&nbsp;&nbsp;&nbsp;<a href="principal2.jsp" class="btn btn-success"><em class="icon-home icon-white"></em> Volver al menú</a></p></div>
    </div>		          
        </logic:equal>
        <logic:notEqual name="ConsultaCentro" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"><bean:message key="general.volver"/></a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
    </logic:present>
    <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
    </logic:notPresent>
     <%-- include header --%>
     <tiles:insert page="plantillas/pie.jsp" flush="true"/>    <p></p>
     </div>
    </body>
</html>
