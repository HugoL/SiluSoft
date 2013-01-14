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
        <title><bean:message key="sala.titulo"/></title>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales3.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <div class="span11 nombreusuario"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</div>
         <logic:equal name="Administracion" property="activado" value="true">
    <div class="row">     
    <div class="span11"><h3 align="center"><bean:message key="insertarusuario.titulo"/></h3></div>
    <div class="clearfix"></div>
    <div class="span11 cuerpoficha">          
        <html:form action="/InsertaSala">
            <html:hidden  name="usuario" property="idCentro"  />
            <div span="3"><label><bean:message key="sala.nombre"/>:</label><html:text property="nombre" /></div>
            <div class="clearfix"></div>
            <div span="3" align="center"><html:submit value="Enviar" styleClass="btn btn-danger" /></div>        
        </html:form>
    </div><!-- cuerpo ficha -->
    <div><html:errors/></div>              
        <div class="span11"><a class="btn btn-success" href="principal3.jsp"><em class="icon-home icon-white"></em> Volver al menú</a></div>
        </div> <!-- row -->  
         </logic:equal>
    </div> <!-- mi hero unit -->
        <logic:notEqual name="Administracion" property="activado" value="true">
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
    </div><!-- container -->
    </div><!-- mifondo -->
    </body>
</html>
