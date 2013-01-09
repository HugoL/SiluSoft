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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="sesiones.confirmar"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
	 <center>
	 <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
	 
     <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td class="pestanaclientes"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><img src="imagenes/PestanaDatos.png" width="90" height="38" align="left"  /></a></td> 
			<td><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1"><img src="imagenes/PestanaTratam_.png" width="90" height="38" align="left"  /></a></td>
      			<td width="auto"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6"><img src="imagenes/PestanaObserv.png" width="90" height="38" align="left" /></a></td>   
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4"><img src="imagenes/PestanaTest.png" align="left" /></a></td>
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><img src="imagenes/PestanaSesiones.png" align="left" /></a></td>
			<td width="*">&nbsp;</td>
    		</tr>   
     	</table> 
        <table align="center" width="80%" class="cuerpo"> 
            <center><div class="cuerpoblanco">
                <logic:equal name="ManipulaClientes" property="activado" value="true">
                <p><bean:message key="sesiones.calculadas"/>: </p>
                <p><bean:message key="sesiones.imc"/>: <strong><bean:write name="imc"/></strong></p>
                <p><html:form action="/InsertaSesiones">
                        <bean:message key="general.fit"/>: <input type="text" name="fit" value="<bean:write name="sesiones" property="fit"/>"/>
                        <bean:message key="general.comfort"/>: <input type="text" name="comfort" value="<bean:write name="sesiones" property="confort" />"/>                    
                       
                        <html:submit value="Enviar"/>
                    </p></html:form>
                    <br/><br/>
                                            <a href="contrato.jsp?fit=<bean:write name="sesiones" property="fit"/>&confort=<bean:write name="sesiones" property="confort"/>&total=<bean:write name="sesiones" property="total"/>" target="_blank"><html:image src="imagenes/contrato.png"/></a>

                </div></center>
        
           </logic:equal>
            <div class ="cuerpoblanco">
                &nbsp;
            </div>	
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
        <center><tr class="tabla">   
                <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/><br /><a href="javascript:history.back()"><bean:message key="general.volver"/></a></div></td>
    		</tr>   
        </table>
        </center>    
    </logic:notEqual>
     </logic:present>
      <logic:notPresent name="usuario" scope="session">
    <center>No se le ha conocido como usuario registrado</center><br /><html:link href="./Registro.do">Registrarse</html:link>
</logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
