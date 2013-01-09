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
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="cliente.actualizar"/></title>
         <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
         <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
      <logic:present name="usuario">
          
	  <center>
	   <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
     <logic:equal name="ManipulaClientes" property="activado" value="true">
	 <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
      			<td class="pestanaclientes"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><img src="imagenes/PestanaDatos_.png" width="90" height="38" align="left"  /></a></td> 
			<td><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1"><img src="imagenes/PestanaTratam.png" width="90" height="38" align="left"  /></a></td>
      			<td width="auto"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6"><img src="imagenes/PestanaObserv.png" width="90" height="38" align="left" /></a></td>   
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4"><img src="imagenes/PestanaTest.png" align="left" /></a></td>
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><img src="imagenes/PestanaSesiones.png" align="left" /></a></td>
			<td width="*">&nbsp;</td>
    		</tr>   
     	</table>
	 <div>
         <html:form action="/Modificar">
            <table align="center" width="80%" cellspacing="5" class="cuerpo">             
                <tr>
                    <th colspan="3"><bean:message key="cliente.actualizar"/></th>
                </tr>
                 
                <tr>                    
                    <td><strong><bean:message key="formulario.dni"/>: </strong><html:text name="cliente" property="dni" /></td>
                    <td><html:hidden name="cliente" property="idCliente" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>            
                    <td><strong><bean:message key="formulario.nombre"/>:</strong><html:text name="cliente" property="nombre" /></td>                  
              
                    <td><strong><bean:message key="formulario.apellido1"/>: </strong><html:text name="cliente" property="apellidos"/></td> 
                     <td><strong><bean:message key="formulario.apellido2"/>: </strong><html:text name="cliente" property="apellido2" /></td>
                    <td class="medidas"><strong><bean:message key="formulario.altura"/>: </strong><html:text name="cliente" property="altura" /></td>
                <tr>                
                    <td><strong><bean:message key="formulario.edad"/>: </strong><html:text name="cliente" property="edad" /></td>                  
              
                    <td><strong><bean:message key="formulario.telefono"/>: </strong>
                    <html:text name="cliente" property="telefono" /></td>
                    <td></td>
                </tr>
                <tr>               
                    <td><strong><bean:message key="formulario.direccion"/>: </strong><html:text name="cliente" property="direccion"  /></td>                               
                    <td><strong><bean:message key="formulario.email"/>: </strong>
                    <html:text name="cliente" property="email"  /></td>  
                  <td class="medidas"><strong><bean:message key="formulario.peso"/>: </strong>
                 <html:text property="peso"/></td>
                </tr>
                <tr>
                    <td colspan="2"><strong><bean:message key="ficha.observaciones"/>: </strong>
                    <html:text name="cliente" property="observaciones"/></td>                  
               
                    <td class="medidas"><span class="medidas"><strong><bean:message key="cliente.fechapeso"/>: </strong>
                        <html:text property="fechapeso" value="" /> (<bean:message key="cliente.dejablanco"/>)
                    </span></td>
                </tr>
               
			   	<tr>
					<td colspan="3"><p><center><html:submit value="Modificar"/></center></p></td>
				</tr>
                <tr>
                  <td colspan="3" align="right" ><center>
                     
                    <html:link href="ListaClientes.do"><img src="imagenes/User_female_.png" /></html:link>                  <html:link href="principal.jsp">
                    <img src="imagenes/home.png"></center>
                  </html:link> </td>
				</tr>
                                <tr>
					<td colspan="3"><p><center><html:errors/></center></p></td>
				</tr>
            </table>
                
        </html:form>
             <br />
             </div></center>
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
</html>
