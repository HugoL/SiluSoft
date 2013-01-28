<%-- 
    Document   : pesoaperder
    Created on : 28-ene-2013, 10:50:42
    Author     : Administrador
--%>
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
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha">
        <div><bean:message key="medidas.imc"/><span class="label label-warning"><bean:write name="imc" /></span></div>        
        <logic:present name="cliente">
        <html:form action="/CalculaSesiones" styleClass="form-inline">
            <input type="hidden" property="imc" value="<bean:write name="imc"/>" />
            <input type="hidden" property="peso" value="<bean:write name="peso"/>" />
            <input type="hidden" property="idcliente" value="<bean:write name="cliente" property="id"/>"/>
            <html:text property="kilossobran"/>                                                       
            <html:submit value="Enviar" styleClass="btn btn-danger"/>
        </html:form>        
    <div class="span11" align="center"><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
                <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a></div>
            </div><!-- row -->
    </logic:present>
    </logic:equal>        
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
        <center><table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> <bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"><bean:message key="general.volver"/></a></div></td>
    		</tr>   
        </table></center>    
        </logic:notEqual>
        </div>
    </div>
     </logic:present>    
    <logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></center>
    </logic:notPresent>        
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
     </div>
     </div>    
    </body>
</html>