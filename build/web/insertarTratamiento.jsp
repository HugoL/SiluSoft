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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html:html>
    <head>
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
        <link href="css/bootstrap-responsive.css" rel="stylesheet" >
        <link href="css/nuevosestilos.css" rel="stylesheet" >
        <link rel="stylesheet" type="text/css" href="tcal.css" />
	<script type="text/javascript" src="tcal.js"></script> 
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
    <div class="span11 cuerpoficha">
        <logic:present name="cliente">
            <legend><bean:message key="tratamiento.nuevo"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></legend>
        <logic:equal name="ManipulaClientes" property="activado" value="true">
            <html:form action="/InsertarTratamiento" styleClass="form-horizontal">                                    
             <html:hidden name="cliente" property="idCliente"/>
                <div class="span10" align="right"><a class="btn btn-success" href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=2">Ver tratamientos</a></div>
                
                <div class="control-group">
                    <label class="control-label"><bean:message key="tratamiento.tipo"/>:</label>
                    <div class="control">
                    <select name="tipo" >
                        <option value="0"><bean:message key="tratamiento.select" /></option>
                        <logic:iterate id="tratamiento" name="lista" scope="request" type="es.pfc.model.Tratamiento" >
                            <option value="<bean:write name="tratamiento" property="tipo" />"><bean:write name="tratamiento" property="tipo" /></option>					
                        </logic:iterate>
                    </select>
                    </div>
                </div>                 
    
                <div class="control-group">
                            
                        <label class="control-label"><bean:message key="formulario.fechaInicio"/>:</label>
                        <div class="controls">
                        <input type="text" name="fechaInicio" class="tcal"/>  
                        </div>
                </div>
                <div class="control-group">    
                    <label class="control-label"><bean:message key="formulario.fechaFin"/>:</label>
                    <div class="controls">
                    <input type="text" name="fechaFin" class="tcal"/>   
                    </div>
                </div>
		<div class="control-group">   
                    <label class="control-label"><bean:message key="tratamiento.intervalos"/>:</label>
                    <div class="controls">
                    <html:text property="intervalos" />
                    </div>
                </div>
		<div class="control-group">   
                    <label class="control-label"><bean:message key="tratamiento.resultados"/>:</label>
                    <div class="controls"><html:text property="resultados" /></div>
                </div>
                <div class="control-group">    
                    <label class="control-label"><bean:message key="tratamiento.observaciones"/>:</label>
                    <div class="controls"><html:text property="observaciones" /></div>
                </div>
                <div class="control-group">
                    <div class="controls"><input type="submit" class="btn btn-large btn-danger" value="Insertar" /></div>
                </div>
                <div class="span10" align="center"><center><html:errors/></center></div>     
          </div>				                                      
        </html:form> 
	</div>
	 <div class="span11" align="center"><p><br/><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
         <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a><br/><br/></p>
         </div>                
            </logic:equal>
        </div>	
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">           
                    <div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div>         
    </logic:notEqual>
     </logic:present>
                   
    </logic:equal>
     </logic:present>
      <logic:notPresent name="usuario" scope="session">
        <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
<%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </div>
     </div>
    </body>
</html:html>