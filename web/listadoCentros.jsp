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
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html:html>
    <head>
        <title><bean:message key="centros.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
        <script language="javascript">
        function mostrar(id,boton){            
            if(document.getElementById(id).style.display=='block'){
                document.getElementById(id).style.display='none';
                document.getElementById(boton).value="Mostrar usuarios";
            }else if(document.getElementById(id).style.display=='none'){
                document.getElementById(id).style.display='block';
                document.getElementById(boton).value="Ocultar usuarios";
            }            
        }
        </script>
    </head>
    <body>
     <%-- include header --%>
     <center>
	 <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
	 
	 <logic:equal name="usuario" property="rol" value="1" scope="session" >
         <div class="cuerpoblanco"> 
             
           <logic:iterate id="centro" name="listado" scope="request" type="es.pfc.model.Centro">     
                    <bean:define id="id" name="centro" property="idCentro"/>
                    <div class="admincentro">
                    <p>
                        <bean:message key="centro.id"/>: <bean:write name="centro" property="idCentro" />,
                        <bean:message key="centro.nombre"/>: <strong><bean:write name="centro" property="nombre" /></strong><br />
                        <bean:message key="formulario.direccion"/>: <bean:write name="centro" property="direccion" />, 
                        <bean:message key="formulario.telefono"/>: <bean:write name="centro" property="telefono" /><br />                                  
                    </p>
                    <input type="button" onclick="javascript:mostrar(<%=id%>,'boton<%=id%>')" value="ver usuarios" id="boton<%=id%>"/>
                    </div>
                    <div id="<%=id%>" style="display:none" class="listausuarios">
                        <bean:message key="admin.usuarios"/>:
                    <logic:iterate id="usuario" name="listaUsuarios" scope="request" type="es.pfc.model.Usuario">        
                        <p>                                   
                            <logic:equal  name="usuario" property="idCentro" value="<%=String.valueOf(id)%>"><br />
                                <bean:write name="usuario" property="dni" /><br />
                                <bean:write name="usuario" property="nombre" /><br />
                                <bean:write name="usuario" property="apellidos" /><br />  
                                <bean:write name="usuario" property="email" /><br />                               
                            </logic:equal>
                        </p>
                    </logic:iterate>
                    </div>
          </logic:iterate>
                    <br />
                    <br />
                    <center><html:link href="superAdmin.jsp"><img src="imagenes/home.png"></html:link></center>
         </div>
	 </logic:equal>
	 <logic:notEqual name="usuario" property="rol" value="1" scope="session">
	 	<div class="cuerpoblanco"> 
	 	  <p class="texto2form"><bean:message key="general.noadmin"/> </p>
                  <p><html:link forward="./index.jsp"><bean:message key="general.acceder"/></html:link></p>
	 	</div>
	 </logic:notEqual>	 
   </logic:present>
<logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></center>
</logic:notPresent>
</center>
<p></p>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
</body>
</html:html>
