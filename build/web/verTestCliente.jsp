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
<%@page import="es.pfc.model.TestCliente"%>
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
        <title>Ver Test Cliente</title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
        
    </head>
    <body>
           <%-- include header --%>
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
<%--<bean:write name="cabecera" filter="false"/>--%>
<center>
<tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>

<table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" > 
                <tr>
      			<td class="pestanaclientes"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3"><img src="imagenes/PestanaDatos.png" width="90" height="38" align="left"  /></a></td> 
			<td><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1"><img src="imagenes/PestanaTratam.png" width="90" height="38" align="left"  /></a></td>
      			<td width="auto"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6"><img src="imagenes/PestanaObserv.png" width="90" height="38" align="left" /></a></td>   
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4"><img src="imagenes/PestanaTest_.png" align="left" /></a></td>
	  		<td><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5"><img src="imagenes/PestanaSesiones.png" align="left" /></a></td>
			<td width="*">&nbsp;</td>
    		</tr>   
     	</table> 
                        <logic:equal name="ConsultaClientes" property="activado" value="true">
                        
                        <div>
                            <div class="cuerpo" with="80%">
                                <br />
                                <bean:message key="test.de"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong>:<br/>
                                <logic:iterate id="pregunta" name="listaPreguntas" scope="request" type="es.pfc.model.PreguntaTest">
                                    <bean:write name="pregunta" property="texto" />: <bean:write name="pregunta" property="respelegidatexto" /><br/>
                                </logic:iterate>
                                <br />
                                <bean:message key="test.resultado"/>: <strong><bean:write name="test" property="resultado" /></strong><br />
                                <bean:message key="ficha.fecha"/>: <bean:write name="test" property="fecha" />
                                <br /><br />
                            </div>
                            <div class="cuerpoblanco">
                                <html:link href="principal.jsp"><img src="imagenes/home.png"></html:link>
                                <a href="ListaClientes.do"><img src="imagenes/User_female_.png" /> </a>   
                            </div>
                        </div>
                        </logic:equal> 
                        <logic:notEqual name="ConsultaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>     
        </logic:notEqual>
    </logic:present>
    <logic:notPresent name="sesiones">
            <tr>
                <td colspan="2"><bean:message key="general.cliente"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong> <bean:message key="sesiones.no"/></td>
            </tr>         
        </logic:notPresent>
    <p></p>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
</body>
</html>
