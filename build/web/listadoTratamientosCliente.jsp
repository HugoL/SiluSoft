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
        <title><bean:message key="tratamiento.titulo"/></title>		
        <script language="javascript">
            
        </script>
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
        <li class="active"><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=9">Calcular Sesiones</a></li>
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span10 cuerpoficha">
            <div class="span11"><bean:message key="tratamiento.de"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></div>
            <div class="clearfix"></div>
            
            <logic:equal name="listadotrat" value="[]">
                <div class="alert"><center><bean:message key="tratamiento.nohay"/></center></div>
                <div class="clearfix"></div>
            </logic:equal>
        <logic:iterate id="tratamiento" name="listadotrat" scope="request" type="es.pfc.model.Tratamiento">
            <html:form action="/ActualizarTratamiento" styleClass="form-inline">	 
                <html:hidden name="tratamiento" property="idTratamiento"/>
                <div class="span3"><bean:message key="tratamiento.tipo"/>:</div>
                <div class="span3"><strong><html:text name="tratamiento" property="tipo" /></strong></div>
                <div class="clearfix"></div>
                <div class="span3"><strong><bean:message key="formulario.fechaInicio"/>: </strong><html:text name="tratamiento" property="fechaInicio" />,&nbsp; </div>
                <div class="span3"><strong><bean:message key="formulario.fechaFin"/>: </strong><html:text name="tratamiento" property="fechaFin" /></div>
                <div class="clearfix"></div>
                <div class="span3"><strong><bean:message key="tratamiento.intervalos"/>: </strong><html:text name="tratamiento" property="intervalos" />,&nbsp; </div>
                <div class="span3"><strong><bean:message key="tratamiento.mantenimiento"/>: </strong><html:text name="tratamiento" property="mantenimiento" /></div>
                <div class="clearfix"></div>
                <div class="span3"><strong><bean:message key="tratamiento.observaciones"/>: </strong><html:text name="tratamiento" property="observaciones" />,&nbsp; </div>
                <div class="span3"><strong><bean:message key="tratamiento.resultados"/>: </strong><bean:write name="tratamiento" property="resultados" /></div>
                <div class="clearfix"></div>
                <div class="span3" align="center"><html:submit value="Modificar" styleClass="btn btn-danger" /></div>
                <div class="clearfix"></div>			
            </html:form>
         </logic:iterate>
	</div>	 
        </div>	 	 
    <div class="span11" align="center"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
         <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a>
    </div> 	
    </logic:equal>
        </div>
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
        </div>
    </div>
    </body>
</html>
