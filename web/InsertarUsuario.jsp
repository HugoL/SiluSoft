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
            document.getElementById(i-1).style.display='block';
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
    <logic:equal name="ConsultaClientes" property="activado" value="true">
    <div class="row">     
        <legend><bean:message key="insertarusuario.titulo"/></legend>                 
    <div class="clearfix"></div>
    <div class="span11 cuerpoficha">                                              
        <html:form action="/InsertaUsuario" >
                <logic:notPresent name="nuevousuario">
                <html:hidden name="usuario" property="idCentro"/>
                <div class="span2"><label><bean:message key="formulario.dni"/>: * </label><html:text property="dni"/></div><div class="clearfix"></div>                                 
                <div class="span3"><label><bean:message key="formulario.nombre"/>:* </label><html:text property="nombre"/></div>                                  
                <div class="span3"><label><bean:message key="formulario.apellido1"/>: * </label><html:text property="apellido1" /></div>
                <div class="clearfix"></div>                  
                <div class="span3"><bean:message key="formulario.telefono"/>: </label><html:text property="telefono" /></div>                                
                <div class="span3"><label><bean:message key="formulario.email"/>: </label><html:text property="email" /></div>
                <div class="clearfix"></div>                 
                <div class="span11">
                <logic:iterate name="listaPermisos" id="permisodef" type="es.pfc.model.Permiso"  >                                                                            
                                <div id="<%=i%>" style="display:none" class="permisos">   
                                    <html:hidden name="permisodef" property="idPermiso"/>&nbsp;
                                    <html:text name="permisodef" property="permiso" readonly="true"/>&nbsp;
                                    
                                    <html:checkbox name="permisodef" property="activado"/>&nbsp;
                                    <html:hidden name="permisodef" property="activado"/>
                                    <br/>                     
                                </div> 
                                <% i++; %>
                </logic:iterate>    
                </div>                
                <!--<div class="span11"><strong>i: <%=i%></strong></div>-->
                <div class="span3"><label><bean:message key="formulario.rol"/>: </label>
                
                    <select name="rol" onchange="javascript:mostrar(this,<%=tam%>,<%=i%>)" >                            
                        <logic:iterate name="lista" id="rol" type="es.pfc.model.Permiso">                                                       
                            <option value="${rol.idRol}"><bean:write name="rol" property="rol"/></option>
                        </logic:iterate>
                            <option selected="selected"></option>
                    </select>
                </div>
                <div class="clearfix"></div> 
                
                <div class="span3"><label><bean:message key="formulario.password"/>: *</label><html:password property="password" /></div>
                <div class="clearfix"></div>                                
                <div class="clearfix"></div>                 
                <div class="span11" align="center"><input type="submit" class="btn btn-primary btn-danger" value="Insertar" /></div>
                <div class="span11" align="center"><html:errors /></div>               
                
                 </logic:notPresent>                
        </html:form>
                <div class="clearfix"></div>
                <div class="alert alert-info"><bean:message key="formulario.camposobligatorios"/></div>
        </div><!-- cuerpoficha -->  
        <div class="span11"><a class="btn btn-success" href="principal3.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
    </div> <!-- row -->    
    </logic:equal>
    </div> <!-- mi hero unit -->
        <logic:notEqual name="ManipulaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
    </div>  
     </logic:present>
    <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
    </logic:notPresent>
<%-- include header --%>    
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
     </div><!-- container -->
    </div><!-- mifondo -->
    </body>
</html:html>
