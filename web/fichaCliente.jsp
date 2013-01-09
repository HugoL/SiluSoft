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

<%@page import="es.pfc.model.Peso"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="es.pfc.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<% 
    List pesos = (List) request.getAttribute("listapesos"); 
%>
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
    <script language="javascript">
            function aviso(destino){
                if(!confirm("Se va a eliminar el cliente y todos los datos asociados al mismo")){
                    return false;
                }else{
                    document.location = destino;
                    return true;
                }
            }
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
        <div class="span11 nombreusuario"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>&nbsp;</div>
    <logic:equal name="ConsultaClientes" property="activado" value="true">
        <div class="row"> 
    <div class="span11">
    <ul class="nav nav-tabs">  
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
	<li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
    <logic:present name="cliente">
        
        <div class="span4"><bean:message key="formulario.dni"/>: <div class="well well-small">
                <bean:write name="cliente" property="dni" /> </div></div>
                      <div class="clearfix"></div>        
          <div class="span4"><bean:message key="formulario.nombre"/>: <div class="well well-small">
          <bean:write name="cliente" property="nombre" /></div></div>
          
          <div class="span6"><bean:message key="formulario.apellido1"/>: <div class="well well-small"><bean:write name="cliente" property="apellidos" />
           <bean:write name="cliente" property="apellido2" /></div></div>                                     
        
           <div class="span6"><bean:message key="formulario.direccion"/>: <div class="well well-small"><bean:write name="cliente" property="direccion" /></div></div>
           <div class="span3"><bean:message key="formulario.telefono"/>: <div class="well well-small"><bean:write name="cliente" property="telefono" /></div></div>       
		
       
            <div class="span2"><bean:message key="formulario.edad"/>: <div class="well well-small"><bean:write name="cliente" property="edad" /></div></div>
            <div class="span5"><bean:message key="formulario.email"/>: <div class="well well-small"><bean:write name="cliente" property="email" /></div></div>
		
                  
            <div class="span10"><bean:message key="ficha.observacion"/>: <div class="well well-small"><bean:write name="cliente" property="observaciones" /></div></div>

            <div class="span2"><bean:message key="ficha.altura"/>: <div class="well well-small"><bean:write name="cliente" property="altura" />m.</div></div>	
			
            <div class="span5"> <!-- medidas -->
                <span>Peso</span><div class="well well-small" >
                            <logic:iterate id="lista" name="listapesos" scope="request" type="es.pfc.model.Peso" length="2">
                                
                                    <p><bean:message key="ficha.peso"/>: <bean:write name="lista" property="peso" /> &nbsp;&nbsp;
                                <bean:message key="ficha.fecha"/>: <bean:write name="lista" property="fecha" /></p>  
                            
                                </logic:iterate>   
                                    
                </div></div>
            <div class="span3"><br /><a class="btn btn-warning" href="leePeso.do?Dni=<bean:write name="cliente" property="dni"/>" target="ventana" onClick="window.open('','ventana','width=500,heigt h=300,lef t=100,top=50');"><em class="icon-list icon-white"></em> Ver listado pesos</a></div>
                       
            <div class="span10"><div class="well" align="center"><p><a class="btn btn-success" href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1"><em class="icon-plus-sign icon-white"></em> Nuevo tratamiento</a>&nbsp;&nbsp;<a class="btn btn-inverse" href="ConsultaSesionesRestantes.do?id=<bean:write name="cliente" property="idCliente"/>"><em class="icon-info-sign icon-white"></em> Ver sesiones</a>&nbsp;&nbsp;<logic:equal name="ManipulaClientes" property="activado" value="true"><a class="btn btn-warning" href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=8"><em class="icon-edit icon-white"></em> Editar</a> &nbsp;<a class="btn btn-danger" href="javascript:;" onClick="javascript:aviso('EliminarCliente.do?Id=<bean:write name="cliente" property="idCliente"/>')"><em class="icon-remove icon-white"></em> Eliminar</a></logic:equal></p></div></div>
       
                                    <div class="span5"><div class="alert alert-info"><bean:message key="ficha.qrfit"/>: </strong><span class="qr">http://localhost:8084/SiluSoft/AsistenciaQr.do?url=<bean:write name="cliente" property="url" />&maq=fit</span></div></div>
                                        <div class="span5"><div class="alert alert-success"><bean:message key="ficha.qrcomfort"/>: </strong><span class="qr">http://localhost:8084/SiluSoft/AsistenciaQr.do?url=<bean:write name="cliente" property="url" />&maq=confort</span></div></div>
                                        <p></p>
        </div> <!-- cuerpo ficha -->  
        </logic:present>
    
        
                                        <div class="span11"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
                                            <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
        </div><!-- row -->
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
