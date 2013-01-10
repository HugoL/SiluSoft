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
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
        <link href="css/bootstrap-responsive.css" rel="stylesheet" >
        <link href="css/nuevosestilos.css" rel="stylesheet" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="usuario.titulo"/></title>     
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
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales3.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <div class="span11 nombreusuario"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</div>
    <logic:equal name="ConsultaClientes" property="activado" value="true">
    <div class="row">     
    <div class="span11" align="right"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</div>
    <div class="span11"><h3 align="center"><bean:message key="insertarusuario.titulo"/></h3>                 
    <div class="clearfix">
    <div class="span11 cuerpoficha">                                              
        <html:form action="/InsertaUsuario" >
            <logic:present name="nuevousuario">
                <div class="span11"><bean:message key="usuario.passno"/> </div>
                <div class="span11"><h5>Contraseñas incorrectas&nbsp;<html:hidden  name="usuario" property="idCentro"/></h5></div>
                <div class="span5"><bean:message key="formulario.dni"/>: </div>
                <div class="span5">* <html:text name="nuevousuario" property="dni" /></div>              
                <div class="span5"><bean:message key="formulario.nombre"/>:</div>
                <div class="span5">* <html:text name="nuevousuario" property="nombre"/></div>                  
                <div class="span5"><bean:message key="formulario.apellido1"/>:</div>
                <div class="span5">* <html:text name="nuevousuario" property="apellido1"/></div>                  
                <div class="span5"><bean:message key="formulario.telefono"/>:</div>
                <div class="span5"><html:text name="nuevousuario" property="telefono"/></div>                  
                <div class="span5"><bean:message key="formulario.email"/>:</div>
                <div class="span5"><html:text name="nuevousuario" property="email"/></div>                  
                <div class="span11"><strong><bean:message key="insertarusuario.permisos"/>: </strong></div>               
                <div class="span5"><bean:message key="formulario.password"/>:</div>
                <div class="span5"><html:password property="password"/></div>                  
                <div class="span5"><bean:message key="formulario.password2"/>:</div>
                <div class="span5"><html:password property="password2" value="" /></div>                  
                <div class="span11"><input type="submit" class="btn btn-primary btn-danger" value="Insertar" /></div>                
                 </logic:present>
                
                <!---  AL PRINCIPIO APARECE LO SIGUIENTE: --------------------------------->
                 <logic:notPresent name="nuevousuario">
                <html:hidden name="usuario" property="idCentro"/>
                <div class="span5"><bean:message key="formulario.dni"/>: </div>
                <div class="span5">* <html:text property="dni"/></div>                  
                <div class="span5"><bean:message key="formulario.nombre"/>:</div>
                <div class="span5">* <html:text property="nombre"/></div>                  
                <div class="span5"><bean:message key="formulario.apellido1"/>:</div>
                <div class="span5">* <html:text property="apellido1" /></div>                  
                <div class="span5"><bean:message key="formulario.telefono"/>:</div>
                <div class="span5"><html:text property="telefono" /></div>                  
                <div class="span5"><bean:message key="formulario.email"/>:</div>
                <div class="span5"><html:text property="email" /></div>                  
                <div class="span11">
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
                </div>                
                <div class="span11"><strong>i: <%=i%></strong></div>
                <div class="span5"><bean:message key="formulario.rol"/>:</div>
                <div class="span5">
                        <select name="rol" onchange="javascript:mostrar(this,<%=tam%>,<%=i%>)" >                            
                        <logic:iterate name="lista" id="rol" type="es.pfc.model.Permiso">                                                       
                            <option value="${rol.idRol}"><bean:write name="rol" property="rol"/></option>
                        </logic:iterate>
                            <option selected="selected"></option>
                    </select>
                </div>
                
                
                <div class="span5"><bean:message key="formulario.password"/>:</div>
                <div class="span5">*<html:password property="password" /></div>                  
                <div class="span5"><bean:message key="formulario.password2"/>:</div>
                <div class="span5">*<html:password property="password2" value="" /></div>                  
                <div class="span11" align="center"><input type="submit" class="btn btn-primary btn-danger" value="Insertar" /></div>
                <div class="span11" align="center"><html:errors /></div>               
                
                 </logic:notPresent>                
        </html:form>
        </div>
    <div class="alert alert-info"><bean:message key="formulario.camposobligatorios"/></div>
        </div>
    </div>
        </logic:equal>
    </div>
     </div>
        <logic:notEqual name="ManipulaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
        </div>
     </logic:present>
    </div>
    <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
    </logic:notPresent>
<%-- include header --%>    
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </div>
     </div>
    </body>
</html:html>
