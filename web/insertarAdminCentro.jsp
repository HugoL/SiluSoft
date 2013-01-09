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
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="admin.insertacentro"/></title>
         <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
             <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
         <logic:equal name="usuario" property="rol" value="1" scope="session" >
     <center><div class="cuerpoblanco">
             <center><div><h3>Insertar Administrador del centro</div></h3></center>
              <html:form action="/InsertaUsuarioAdmin">
            <logic:present name="nuevousuario">
                <logic:equal name="usuario" property="rol" value="1" scope="session" >
                    <p> <bean:message key="usuario.passno"/></p>
                <table align="center" width="50%" class="cuerpo">
                    <tr>
                    <th colspan="2">&nbsp;<html:hidden name="centro" property="idCentro" /></th>
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.dni"/>: </td>
                    <td>* <html:text name="nuevousuario" property="dni" /></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.nombre"/>: </td>
                    <td>* <html:text name="nuevousuario" property="nombre"/></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.apellidos"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text name="nuevousuario" property="apellidos"/></td>                  
                </tr>
                
                <tr>    
                    <td align="right" ><bean:message key="formulario.telefono"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text name="nuevousuario" property="telefono"/></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.email"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text name="nuevousuario" property="email"/></td>                  
                </tr>
               
               <html:hidden property="rol" value="2" />
                
                <tr>    
                    <td align="right"><bean:message key="formulario.password"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:password property="password" value="" /></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.password2"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:password property="password2" value="" /></td>                  
                </tr>
                <tr>
               
                    <td align="center" colspan="2"><html:submit value="Insertar" /></td>
                </tr>
                </table>
                 </logic:equal>
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/></p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>
                 </logic:present>
                
                 <logic:notPresent name="nuevousuario">
            <table align="center" width="50%" class="cuerpo">             
                <tr>
                    <th colspan="2">&nbsp;<html:hidden name="centro" property="idCentro"/></th>
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.dni"/>: </td>
                    <td>* <html:text property="dni" /></td>                  
                </tr>
                <tr>    
                    <td align="right" ><bean:message key="formulario.nombre"/>:</td>
                    <td>* <html:text property="nombre" /></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.apellido1"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text property="apellidos" /></td>                  
                </tr>
                
                <tr>    
                    <td align="right"><bean:message key="formulario.telefono"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text property="telefono" /></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.email"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text property="email"/></td>                  
                </tr>
               <html:hidden property="rol" value="2" />
                <tr>    
                    <td align="right"><bean:message key="formulario.password"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:password property="password" /></td>                  
                </tr>
                <tr>    
                    <td align="right"><bean:message key="formulario.password2"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:password property="password2" /></td>                  
                </tr>
                <tr>
               
                    <td align="center" colspan="2"><html:submit value="Insertar" /></td>
                </tr>
            </table>
                 </logic:notPresent>
                <p><bean:message key="formulario.camposobligatorios"/></p>
        </html:form>
    <br />
     </div></center>
      </logic:equal>
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/></p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>
     </logic:present>
    <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
    </logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html:html>
