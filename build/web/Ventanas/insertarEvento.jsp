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
<%
    String maquina = request.getParameter("maquina");
    String evento = request.getParameter("evento");
    String fecha = request.getParameter("fecha");
    String estilo = request.getParameter("estilo");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../css/nuevosestilos.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Evento</title>
    </head>
    <body>
           <%-- include header --%>
     <tiles:insert page="../plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">            
     <div class="containter">   
     <div class="mi-hero-unit">
    <logic:equal name="ManipulaAgenda" property="activado" value="true">
        <div class="row"> 
            <legend><br />Anotaci&oacute;n de agenda para el d&iacute;a <strong><%= fecha %></strong></legend>
            <html:form action="/InsertaEvento" styleClass="form-inline" >
                <html:hidden property="evento" value="<%=evento%>" /><br />
                <html:hidden property="maquina" value="<%=maquina%>" /><br />
                <html:hidden property="fecha" value="<%=fecha%>" /><br />
                <div class="span11">Escribe en el cuadro de texto la anotaci&oacute;n </div>
                
                <label>Cliente: </label><html:select property="acto" >
                    <html:option value="0">---</html:option>
                    <logic:iterate id="cliente" name="listaClientes" scope="session" type="es.pfc.model.Cliente">
                        <html:option value="${cliente.nombre} ${cliente.apellidos}"><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></html:option>
                    </logic:iterate>                 
                </html:select>
                <label>Trabajador:  </label><html:select property="asignado" >
                    <html:option value="0">---</html:option>
                    <logic:iterate id="usuariolista" name="listaUsuarios" scope="session" type="es.pfc.model.Usuario">
                        <html:option value="${usuariolista.nombre} ${usuariolista.apellidos}"><bean:write name="usuariolista" property="nombre" /> <bean:write name="usuariolista" property="apellidos" /></html:option>
                    </logic:iterate>                 
                </html:select>
                
                    <label>Otra informaci&oacute;n: </label><html:text property="masinfo" > </html:text>
                    
                    <html:submit value="Enviar" styleClass="btn btn-danger" />
            </html:form>
        </logic:equal>
        </div>
    </div>
        <logic:notEqual name="ManipulaAgenda" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> Ud. no tiene permisos para introducir datos en la agenda</p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>            
     </div>
        </div>
    </body>
</html>
