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
<html>
<head>
 <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/nuevosestilos.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
        <script language="javascript">
          function aviso(destino){
                if(!confirm("Se va a eliminar el tratamiento")){
                    return false;
                }else{
                    document.location = destino;
                    return true;
                }
            }
        </script>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/nuevosestilos.css" rel="stylesheet">
</head>
    <body>
        <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
    <div class="mi-hero-unit">        
    <div class="row">
    <logic:present name="usuario">       
        <logic:equal name="ConsultaCentro" property="activado" value="true">
            <logic:iterate id="tratamiento" name="lista" type="es.pfc.model.Tratamiento">
                <div class="well">  
                    <span class="mietiqueta"><bean:message key="tratamiento.tipo"/>:</span>
                    <span class="midescripcion"><strong><bean:write name="tratamiento" property="tipo"/></strong></span><br />
                    <span class="mietiqueta"><bean:message key="tratamiento.descripcion"/>:</span> 
                    <span class="midescripcion"><bean:write name="tratamiento" property="descripcion"/></span><br />
                    <logic:equal name="ManipulaCentro" property="activado" value="true"><a class="btn btn-danger" href="javascript:;" onClick="javascript:aviso('eliminarTratamientoCentro.do?idTratamiento=<bean:write name="tratamiento" property="idTratamiento"/>')"><em class="icon-trash icon-white"></em> Eliminar</a></logic:equal>
                </div>                   
            </logic:iterate> 
           
            </div>
            <div><p><logic:equal name="ManipulaCentro" property="activado" value="true"><a href="insertarTratamientoCentro.jsp" class="btn btn-warning"><em class="icon-plus icon-white"></em> Nuevo tratamiento</a></logic:equal>&nbsp;&nbsp;&nbsp;<a href="principal2.jsp" class="btn btn-success"><em class="icon-home icon-white"></em> Volver al menú</a></p></div>             
        </div>
                <p>&nbsp;</p>
        </div><!-- container -->
        </logic:equal>
        <logic:notEqual name="ConsultaCentro" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> <bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
      </logic:present>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>    
    </body>
</html>
