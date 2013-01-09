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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tama = String.valueOf(request.getAttribute("tam"));
    int tam = Integer.valueOf(tama);
    int i=1;
%>
<!DOCTYPE html>
<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="usuario.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
        <script language="javascript">
        function mostrar(selectobj,tam,i){    
            var id= selectobj.selectedIndex;            
            var j,z;
            //oculto todas
            for(z=1;z<i;z++){
                document.getElementById(z).style.display='none';
            }
            id=id*tam+1;            
            for(j=id;j<id+tam;j++){
                document.getElementById(j).style.display='block';
            }            
        }
        </script>
    </head>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
	 <center>    
        <tiles:insert page="plantillas/PestanasGenerales3.jsp" flush="true"/>	
     <center>
         <div>
	 <table class="cuerpoblanco">
	 <tr><td>
                 <p align="right"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</p>
                 <h3 align="center"><bean:message key="insertarusuario.titulo"/></h3>                 
             <logic:equal name="ManipulaClientes" property="activado" value="true">
             <center><div class="cuerpo">                                              
        <html:form action="/InsertaUsuario" >
            <logic:present name="nuevousuario">
                <p> <bean:message key="usuario.passno"/> </p>
                <table align="center" width="50%">
                    <tr>
                    <th colspan="2">Contraseñas incorrectas&nbsp;<html:hidden  name="usuario" property="idCentro"/></th>
                </tr>
                <tr>    
                    <td><bean:message key="formulario.dni"/>: </td>
                    <td>* <html:text name="nuevousuario" property="dni" /></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.nombre"/>:</td>
                    <td>* <html:text name="nuevousuario" property="nombre"/></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.apellido1"/>:</td>
                    <td>* <html:text name="nuevousuario" property="apellido1"/></td>                  
                </tr>
                
                <tr>    
                    <td><bean:message key="formulario.telefono"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text name="nuevousuario" property="telefono"/>></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.email"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text name="nuevousuario" property="email"/></td>                  
                </tr>
                
                <tr>                    
                    <td colspan="2">                        
                            <strong><bean:message key="insertarusuario.permisos"/>: </strong><br />
                              
                    </td>
                </tr>
                <tr>    
                    <td><bean:message key="formulario.password"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:password property="password"/></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.password2"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:password property="password2" value="" /></td>                  
                </tr>
                <tr>
               
                    <td><html:submit value="Insertar" /></td>
                </tr>
                </table>
                
                 </logic:present>
                
                <!---  AL PRINCIPIO APARECE LO SIGUIENTE: --------------------------------->
                 <logic:notPresent name="nuevousuario">
            <table align="center" width="50%">             
                <tr>
                    <th colspan="2">&nbsp;<html:hidden name="usuario" property="idCentro"/></th>
                </tr>
                <tr>    
                    <td><bean:message key="formulario.dni"/>: </td>
                    <td>* <html:text property="dni"/></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.nombre"/>:</td>
                    <td>* <html:text property="nombre"/></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.apellido1"/>:</td>
                    <td>* <html:text property="apellido1" /></td>                  
                </tr>
                
                <tr>    
                    <td><bean:message key="formulario.telefono"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text property="telefono" /></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.email"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;<html:text property="email" /></td>                  
                </tr>
                
                <tr>                    
                    <td colspan="2">
                    <logic:iterate name="listaPermisos" id="permisodef" type="es.pfc.model.Permiso"  >                                                                            
                                <div id="<%=i%>" style="display:block" class="permisos">   
                                    <html:hidden name="permisodef" property="idPermiso"/>&nbsp;
                                    <html:text name="permisodef" property="permiso" readonly="true"/>&nbsp;
                                    
                                    <html:checkbox name="permisodef" property="activado"/>&nbsp;
                                    <html:text name="permisodef" property="activado"/>
                                    <br/>                     
                                </div> 
                                <% i++; %>
                    </logic:iterate>    
                    </td>
                </tr>
                <tr><td><strong>i: <%=i%></strong></td></tr>
                 <tr>    
                    <td><bean:message key="formulario.rol"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;
                        <select name="rol" onchange="javascript:mostrar(this,<%=tam%>,<%=i%>)" >                            
                        <logic:iterate name="lista" id="rol" type="es.pfc.model.Permiso">                                                       
                            <option value="${rol.idRol}"><bean:write name="rol" property="rol"/></option>
                        </logic:iterate>
                            <option selected="selected"></option>
                    </select>
                    </td>                  
                </tr>
                
                
                <tr>    
                    <td><bean:message key="formulario.password"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;*<html:password property="password" /></td>                  
                </tr>
                <tr>    
                    <td><bean:message key="formulario.password2"/>:</td>
                    <td>&nbsp;&nbsp;&nbsp;*<html:password property="password2" value="" /></td>                  
                </tr>
                <tr>
               
                    <td colspan="2" align="center"><br /><html:submit value="Insertar" /></td>
                </tr>
                <tr>
               
                    <td colspan="2" align="center"><br /><html:errors /></td>
                </tr>
            </table>
                
                 </logic:notPresent>
                <p><bean:message key="formulario.camposobligatorios"/></p>
        </html:form></div></center>
        <p></p>
		</td></tr>
	 </table></center></div>
        </logic:equal>
        <logic:notEqual name="ManipulaClientes" property="activado" value="true">
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
    </body>
</html:html>
