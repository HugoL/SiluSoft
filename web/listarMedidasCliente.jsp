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

<%@ page import="es.pfc.model.Cliente"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="medidas.sesiones"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">
        <center>
     <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
          <logic:equal name="ConsultaClientes" property="activado" value="true">

	<table class="cuerpoblanco" >   
    		<tr>
      			<td class="pestanaclientes"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><img src="imagenes/PestanaDatos.png" width="90" height="38" align="left"  /></a></td> 
			<td><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1"><img src="imagenes/PestanaTratam.png" width="90" height="38" align="left"  /></a></td>
      			<td width="auto"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6"><img src="imagenes/PestanaObserv.png" width="90" height="38" align="left" /></a></td>   
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4"><img src="imagenes/PestanaTest.png" align="left" /></a></td>
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><img src="imagenes/PestanaSesiones_.png" align="left" /></a></td>
			<td width="*">&nbsp;</td>
    		</tr>   
     	</table>   
     <div class="cuerpo">
         
         <p class="tituloform"><bean:message key="medidas.sesiones"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></p>         
         <table>
             <tr>
         <logic:iterate id="zonamedida" name="listadoMedidas" scope="request" type="es.pfc.model.Medidas">
             <td><bean:write name="zonamedida" property="zona" /></td>
         </logic:iterate>
             </tr>
              <tr>
         <logic:iterate id="medida" name="listadoMedidas" scope="request" type="es.pfc.model.Medidas">
             <td><bean:write name="medida" property="medida" /></td>
         </logic:iterate>
             </tr>
         </table>
    </div>                   
             <div class="cuerpo"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Insertar nuevas medidas</a></div>                                      
     <table class="cuerpoblanco">
        <tr>
            <td align="right">
                <html:link href="principal.jsp"><img src="imagenes/home.png"></html:link>
                
            </td>
            <td>
                <a href="ListaClientes.do"><img src="imagenes/User_female_.png" /> </a>   
            </td>
        </tr>
    </table>      
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
     </logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
