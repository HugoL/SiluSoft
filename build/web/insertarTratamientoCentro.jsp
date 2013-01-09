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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="tratamiento.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
           <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
	 <center>
	 <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/><br/><br/>	      
                        <logic:equal name="ManipulaCentro" property="activado" value="true">
                        <div class="cuerpoblanco">
                            <html:form action="/insertaTratamientoCentro">
                                <html:hidden name="usuario" property="idCentro" />
                            <table align="center" width="100%" cellspacing="5">             
                                <tr>
                                    <td colspan="2"><center><h3><bean:message key="tratamiento.nuevocentro"/></h3></center></td>                                    
                                </tr>
                 
                                <tr>  
                                    <td><strong><bean:message key="tratamiento.tipo"/>: </strong><html:text property="tipo" /> </td>
                                    <td><strong><bean:message key="tratamiento.descripcion"/>: </strong><html:text property="descripcion" /></td>                   
                                </tr>
                                <tr>            
                                    <td><strong><bean:message key="tratamiento.precio"/>: </strong><html:text property="precio" /></td>                               
                                    <td></td>
                                </tr>
                                
                                <tr>
                                    <td align="right"><html:submit value="Insertar"/></td>
                                    <td><html:link href="principal2.jsp"><img src="imagenes/home.png"></html:link></td>
                                </tr>
                                <tr>            
                                    <td colspan="2"><html:errors/></td>
                                </tr>
                            </table>  
                            </html:form>
                        </div>
                        </logic:equal>
                        
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
    </body>
</html>
