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
	<!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/nuevosestilos.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Test Cliente</title>        
    </head>
    <body>
           <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <logic:equal name="ConsultaClientes" property="activado" value="true">
     <div class="row">       
         <div class="span11">
    <ul class="nav nav-tabs">  
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
        <li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=9">Calcular Sesiones</a></li>
    </ul>
    </div> <!-- menu ficha -->  
     <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
        <legend><bean:message key="test.de"/><strong> <bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></legend>
    <logic:present name="cliente">
     <div class="span10"><bean:message key="test.de"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong>:</div>
                                <logic:iterate id="pregunta" name="listaPreguntas" scope="request" type="es.pfc.model.PreguntaTest">
                                    <div class="span10"><bean:write name="pregunta" property="texto" />: <bean:write name="pregunta" property="respelegidatexto" /></div>
                                </logic:iterate>
                                <div class="clearfix"></div>
                                <div class="span10"><bean:message key="test.resultado"/>: <span class="badge badge-warning"><bean:write name="test" property="resultado" /></span></div>
                                <div class="span10"><bean:message key="ficha.fecha"/>: <bean:write name="test" property="fecha" /></div>
                            </div>
			</div><!-- cuerpo ficha -->
                            <div class="span11"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>                <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
      </div><!-- row -->
      </div><!-- mihero-unit -->
      </logic:present>
       </logic:equal>      
       <logic:notEqual name="ConsultaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>     
        </logic:notEqual>        
    <logic:notPresent name="sesiones">
            <tr>
                <td colspan="2"><bean:message key="general.cliente"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong> <bean:message key="sesiones.no"/></td>
            </tr>         
        </logic:notPresent>
     </logic:present>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
	</div>
	</div>
</body>
</html>
