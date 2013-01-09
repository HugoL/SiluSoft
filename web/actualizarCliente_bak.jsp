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

<%@page import="es.pfc.model.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
    Cliente cliente = (Cliente) request.getAttribute("cliente");
    String ide= (String) request.getParameter("Id");
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar cliente</title>
         <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
      <logic:present name="usuario">
          
	  <center>
	   <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
     <logic:equal name="usuario" property="manipulaClientes" value="true">
	 <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
      			<td class="pestanaclientes"><img src="imagenes/PestanaDatos_.png" width="90" height="38" align="left"  /></td> 
			<td><a a href="DameDatosCliente.do?dni=<%=cliente.getDni()%>&op=1"><img src="imagenes/PestanaTratam.png" width="90" height="38" align="left"  /></a></td>
      			<td width="auto"><a href="principal2.jsp"><img src="imagenes/PestanaObserv.png" align="left" /></a></td>   
	  		<td><a href="DameDatosCliente.do?dni=<%=cliente.getDni()%>&op=4" /><img src="imagenes/PestanaTest.png" align="left" /></a></td>
	  		<td><a href="principal2.jsp"><img src="imagenes/PestanaSesiones.png" align="left" /></a></td>
			<td width="*">&nbsp;</td>
    		</tr>   
     	</table>
	 <div>
         <html:form action="/Modificar">
            <table align="center" width="80%" cellspacing="5" class="cuerpo">             
                <tr>
                    <th colspan="3">Actualizar cliente</th>
                </tr>
                 
                <tr>                    
                    <td><strong>Dni: </strong><html:text property="dni" value="<%=cliente.getDni()%>" /></td>
                    <td><html:hidden property="id" value="<%=ide%>"/></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>            
                    <td><strong>Nombre: </strong><html:text property="nombre" value="<%=cliente.getNombre()%>" /></td>                  
              
                    <td><strong>Apellido1: </strong><html:text property="apellidos" value="<%=cliente.getApellidos()%>" /></td> 
                     <td><strong>Apellido2: </strong><html:text property="apellido2" value="<%=cliente.getApellido2()%>" /></td>
                    <td class="medidas"><strong>Altura: </strong><html:text property="altura" value="<%=String.valueOf(cliente.getAltura())%>" /></td>
                <tr>                
                    <td><strong>Edad: </strong><html:text property="edad" value="<%=String.valueOf(cliente.getEdad())%>" /></td>                  
              
                    <td><strong>Tel&eacute;fono: </strong>
                    <html:text property="telefono" value="<%=cliente.getTelefono()%>" /></td>
                    <td></td>
                </tr>
                <tr>               
                    <td><strong>Direcci&oacute;n: </strong><html:text property="direccion" value="<%=cliente.getDireccion()%>" /></td>                               
                    <td><strong>Email: </strong>
                    <html:text property="email" value="<%=cliente.getEmail()%>" /></td>  
                  <td class="medidas"><strong>Peso: </strong>
                 <html:text property="peso" value="0.0" /></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Observaciones: </strong>
                    <html:text property="observaciones" value="<%=cliente.getObservaciones()%>" /></td>                  
               
                    <td class="medidas"><span class="medidas"><strong>Fecha de peso: </strong>
                        <html:text property="fechapeso" value="" /> (dejar en blanco para fecha de hoy)
                    </span></td>
                </tr>
               
			   	<tr>
					<td colspan="3"><p><center><html:submit value="Modificar"/></center></p></td>
				</tr>
                <tr>
                  <td colspan="3" align="right" ><center>
                   <img src="imagenes/User_female_.png" />  
                    <html:link href="ListaClientes.do"></html:link>                  <html:link href="principal.jsp">
                    <img src="imagenes/home.png"></center>
                  </html:link> </td>
				</tr>
            </table>
                
        </html:form>
             <br />
             </div></center>
           </logic:equal>
        <logic:notEqual name="usuario" property="manipulaClientes" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> Ud. no tiene permisos para ver el contenido</p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>     
        </logic:notEqual>
        </logic:present>
        <logic:notPresent name="usuario" scope="session">
            <center>No se le ha conocido como usuario registrado</center><br /><html:link href="./Registro.do">Registrarse</html:link>
        </logic:notPresent>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
