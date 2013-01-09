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
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="asistencia.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
           <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">    
        
         <center>
             <div><tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/></div><br /><br />
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
	<div class="cuerpoblanco">          
            <br />           
            <logic:equal name="tiene" value="false">
                <table width="80%" cellspacing="5" class="cuerpo">
                    <tr>
                        <td><bean:message key="general.cliente"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong> <bean:message key="asistencia.nosesiones"/>
                            <br /><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><bean:message key="asistencia.calcular"/></a>
                        </td>
                    </tr>
                </table>
             </logic:equal>
            <logic:equal name="tiene" value="true">
            <table width="80%" cellspacing="5" class="cuerpo">
                </tr>
                <logic:equal name="quedan" value="false">
                    <tr>
                        <td colspan="2" align="center"><bean:message key="asistencia.consumidas"/><br /><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><bean:message key="asistencia.ficha"/></a></td>
                    </tr>
                </logic:equal>
                <logic:equal name="quedan" value="true">
                <html:form action="/Asistencia" >   
                <tr>
                    <td colspan="2"><center><bean:message key="asistencia.de"/><strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong</center></td>
                
                <tr>
                    <td><bean:message key="asistencia.sesionesfit"/>: <bean:write name="sesiones" property="resFit" /></td>
                    <td><bean:message key="asistencia.sesionescomfort"/>: <bean:write name="sesiones" property="resConfort" /></td>
                </tr>
                <tr>
                    <logic:notEqual name="sesiones" property="resFit" value="0">
                        <td align="center"><bean:message key="asistencia.fit"/>:<html:radio property="maquina" value="fit" /></td>
                    </logic:notEqual>
                    <logic:notEqual name="sesiones" property="resConfort" value="0">
                        <td align="center"><bean:message key="asistencia.comfort"/><html:radio property="maquina" value="confort" /></td>
                    </logic:notEqual>
               </tr>
                <tr>
                    <td colspan="2"><html:hidden name="cliente" property="idCliente"/><center><html:submit value="Enviar" /></center></td>
                </tr>                
                </html:form> 
                </logic:equal>
            </table>                     
		</logic:equal> 
        </logic:equal>
            <logic:notEqual name="ManipulaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
            
        </logic:present>
    <table bgcolor="#FFFFFF" width="80%">
        <tr>
            <td align="right">
                <html:link href="principal.jsp"><img src="imagenes/home.png"></html:link>
            </td>
            <td>
                <a href="ListaClientes.do"><img src="imagenes/User_female_.png" /> </a>   
            </td>
        </tr>
    </table></center>  
    </div>                      
    <logic:notPresent name="usuario" scope="session">
    <center>No se le ha conocido como usuario registrado</center><br /><html:link href="./Registro.do">Registrarse</html:link>
</logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
