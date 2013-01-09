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
<%@page import="es.pfc.model.Centro"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="centro.actualizar"/></title>
         <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
           <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">       
        <center>
        <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
        <logic:equal name="ManipulaCentro" property="activado" value="true">
        <table class="cuerpoblanco">
            <tr><td>&nbsp;</td></tr>
        </table>
        <div class="cuerpo">
         <html:form action="/ModificarCentro">
            <table align="center" width="100%" cellspacing="5">             
                <tr>
                     <td><bean:message key="centro.actualizar"/></td>
                     <td><html:hidden name="centro" property="idCentro" /></td>
                </tr>
                 
                <tr>  
               
                    <td><strong><bean:message key="centro.nombre"/>: </strong><html:text name="centro" property="nombre" /> </td>
                    <td><strong><bean:message key="formulario.direccion"/>: </strong><html:text name="centro" property="direccion" /></td>                   
                
                </tr>
                <tr>            
                    <td><strong><bean:message key="formulario.telefono"/>: </strong><html:text name="centro" property="telefono" /></td>                               
                    <td></td>
                </tr>
           
                <tr>
                    <td colspan="2" align="center"><html:submit value="Modificar"/></td>
              
                </tr>
                <tr>            
                    <td colspan="2"><html:errors/></td>
                </tr>
            </table>          
        </html:form>
             <br />
             </div>
			 <table class="cuerpoblanco">
            <tr><td>&nbsp;</td></tr>
        </table></center>
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
