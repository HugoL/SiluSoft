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
<%@ page import="es.pfc.model.Cliente"%>
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
        <title><bean:message key="tratamiento.titulo"/></title>
<tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <logic:equal name="ManipulaCentro" property="activado" value="true">
    <div class="row"> 
      
    <div class="clearfix"></div>  
    <div class="span10 cuerpoficha">        
                            <html:form action="/insertaTratamientoCentro">
                                <html:hidden name="usuario" property="idCentro" />
                                <div class="span10"><center><h4><bean:message key="tratamiento.nuevocentro"/></h4></center></div>                                    
                                <div class="span10"><label><bean:message key="tratamiento.tipo"/>: </label><html:text property="tipo" /> </div>
                                <div class="span10"><label><bean:message key="tratamiento.descripcion"/>: </label><html:text property="descripcion" /></div>                   
                                <div class="span10"><label><bean:message key="tratamiento.precio"/>: </label><html:text property="precio" /></div>                               
                                <div class="span10"><html:submit value="Insertar" styleClass="btn btn-danger"/></div>
                                     <div><html:errors/></div>                                 
                            </html:form>    
    </div>
    <div class="span11" align="center"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
        <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a>
    </div>
    </logic:equal>
    </div>
    </div>
                        <logic:notEqual name="ManipulaCentro" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> <bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
        </logic:present>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
        <br/>
   
     </div>
    </body>
</html>
