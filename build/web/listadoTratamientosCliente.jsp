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
<%@page import="es.pfc.model.Tratamiento"%>
<%@page import="es.pfc.model.Cliente"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="tratamiento.titulo"/></title>
		<LINK href="estilo.css" rel="stylesheet" type="text/css" />
                <script language="javascript">
            
        </script>
    </head>
    <body>
         <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">
		   <center>
     <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
     <logic:equal name="ConsultaClientes" property="activado" value="true">
        <table class="cuerpoblanco">   
    		<tr>
      			<td class="pestanaclientes"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><img src="imagenes/PestanaDatos.png" width="90" height="38" align="left"  /></a></td> 
			<td><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1"><img src="imagenes/PestanaTratam_.png" width="90" height="38" align="left"  /></a></td>
      			<td width="auto"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6"><img src="imagenes/PestanaObserv.png" width="90" height="38" align="left" /></a></td>   
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4"><img src="imagenes/PestanaTest.png" align="left" /></a></td>
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><img src="imagenes/PestanaSesiones.png" align="left" /></a></td>
			<td width="*">&nbsp;</td>
    		</tr>   
     	</table>   
         </center>
	<center>
	<table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabladedatos" > 
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2" align="center"><bean:message key="tratamiento.de"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <logic:equal name="listadotrat" value="[]">
                <tr><td><center><bean:message key="tratamiento.nohay"/></center></td></tr>
            </logic:equal>
        <logic:iterate id="tratamiento" name="listadotrat" scope="request" type="es.pfc.model.Tratamiento">
            <html:form action="/InsertarTratamiento">	 
                <tr >
                    <td align="right"><div align="right"><bean:message key="tratamiento.tipo"/>:</div></td>
			<td align="left"><strong><bean:write name="tratamiento" property="tipo" /></strong></td>
		</tr>
		<tr>
                    <td align="right"><strong><bean:message key="formulario.fechaInicio"/>: </strong><bean:write name="tratamiento" property="fechaInicio" />,&nbsp; </td>
                    <td><strong><bean:message key="formulario.fechaFin"/>: </strong><bean:write name="tratamiento" property="fechaFin" /></td>
		</tr>
		<tr>
                    <td align="right"><strong><bean:message key="tratamiento.intervalos"/>: </strong><bean:write name="tratamiento" property="intervalos" />,&nbsp; </td>
                    <td><strong><bean:message key="tratamiento.mantenimiento"/>: </strong><bean:write name="tratamiento" property="mantenimiento" /></td>
		</tr>
		<tr>
                    <td align="right"><strong><bean:message key="tratamiento.observaciones"/>: </strong><bean:write name="tratamiento" property="observaciones" />,&nbsp; </td>
                    <td><strong><bean:message key="tratamiento.resultados"/>: </strong><bean:write name="tratamiento" property="resultados" /></td>
		</tr> 
                <tr>
                    <td colspan="2" align="center"><html:submit value="Modificar" /></td>
		</tr>
		<tr>
			<td colspan="2" class="separacion">&nbsp;</td>
		</tr>
            </html:form>
         </logic:iterate>
	</table>	 
		 	 
    <table bgcolor="#FFFFFF" width="80%">
        <tr>
            <td align="right">
                <html:link href="principal.jsp"><img src="imagenes/home.png"></html:link>
            </td>
            <td>
                <a href="ListaClientes.do"><img src="imagenes/User_female_.png" /> </a>   
            </td>
        </tr>
    </table>
	</center>
    </logic:equal>
     <logic:notEqual name="ConsultaClientes" property="activado" value="true">
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
