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
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
        <link href="css/bootstrap-responsive.css" rel="stylesheet" >
        <link href="css/nuevosestilos.css" rel="stylesheet" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="medidas.sesiones"/></title>        
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
    <logic:equal name="ManipulaClientes" property="activado" value="true">
        <div class="row"> 
    <div class="span11">
    <ul class="nav nav-tabs">  
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
        <li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=9">Calcular Sesiones</a></li>
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
                <legend><bean:message key="medidas.para"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></strong></legend>
                <div class="span11" align="center"><a class="btn btn-success" href="listaMedidas.do?Id=<bean:write name="cliente" property="idCliente"/>&Dni=<bean:write name="cliente" property="dni"/>">Ver medidas</a><br/><br/></div>		                
                <html:form action="/insertaSesion" styleClass="form-horizontal">  
                        <div class="span4 well" >                        
                        <logic:iterate id="medida" name="listaZonas" scope="request" type="es.pfc.model.Medidas" length="5">
                            <div align="center" class="control-group">
                                <div class="input-prepend"><span class="add-on"><bean:write name="medida" property="zona" /></span>
                                    <html:text property="campos" size="5" value="" styleClass="input-mini" /><span class="add-on">mm.</span>
                                </div>
                            <input type="hidden" name="idZona" value="<bean:write name="medida" property="idZona"/>"/>    
                            </div>
                        </logic:iterate>
                        </div>
                        <div class="span4 well">
                        <logic:iterate id="medida" name="listaZonas" scope="request" type="es.pfc.model.Medidas" offset="6">
                            <div align="center" class="control-group">
                                <div class="input-prepend">
                                    <span class="add-on"><bean:write name="medida" property="zona" /></span>
                                    <html:text property="campos" size="5" value="" styleClass="input-mini" /><span class="add-on">.cm</span>
                                </div>
                            <input type="hidden" name="idZona" value="<bean:write name="medida" property="idZona"/>"/>    
                            </div>
                        </logic:iterate>
                        </div>      	                        
                        <input type="hidden" name="idCliente" value="<bean:write name="cliente" property="idCliente"/>"/>
		
                <div class="span11"><center><input type="submit" class="btn btn-danger btn-primary" value="Insertar" /></center></div>
                <div class="span11"><html:errors /></div>                
                    </html:form>
   
    <div class="span11" align="center"><p><br/><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
         <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a><br/><br/></p>
    </div>	
            </logic:equal>
    </div>
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
        <center><table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> <bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"><bean:message key="general.volver"/></a></div></td>
    		</tr>   
            </table></center>    
        </logic:notEqual>        
    </div>
     </logic:present>
    <logic:notPresent name="usuario" scope="session">
        <div class="alert alert-danger"><bean:message key="general.noidentificado"/></div>
     </logic:notPresent>
    <logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></center>
    </logic:notPresent>
    </div>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>    
        </div>
     </div>       
    </body>
</html>
