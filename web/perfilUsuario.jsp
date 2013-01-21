<%-- 
    Document   : perfilUsuario
    Created on : 21-ene-2013, 13:10:56
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
        <title><bean:message key="perfil.titulo"/></title>
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
            <html:form action="/Modificar">
            <fieldset>
            <legend><bean:message key="cliente.actualizar"/></legend>
            <div class="span11"><label><bean:message key="formulario.dni"/>:</label> <html:text name="usuario" property="dni" styleClass="input-small" /></div>
            <html:hidden name="usuario" property="idUsuario" />
            <div class="span3"><label><bean:message key="formulario.nombre"/>:</label><html:text name="usuario" property="nombre" /></div>                 
            <div class="span3"><label><bean:message key="formulario.apellido1"/>: </label><html:text name="usuario" property="apellidos"/></div> 
            <div class="span3"><label><bean:message key="formulario.direccion"/>: </label><html:text name="usuario" property="direccion"  /></div>                               
            <div class="span3"><label><bean:message key="formulario.telefono"/>: </label><html:text name="usuario" property="telefono" styleClass="input-small" /></div> 
            <div class="clearfix"></div>
            <div class="span3"><label><bean:message key="formulario.email"/>: </label><html:text name="usuario" property="email" styleClass="input-medium" /></div>  
            <div class="span3"><label><bean:message key="ficha.observaciones"/>: </label><html:text name="usuario" property="observaciones"/></div>
            <div class="clearfix"></div>            
            <div class="span11" align="center"><html:submit styleClass="btn btn-danger"><bean:message key="perfil.actualiza"/></html:submit></div>
            <html:errors/>
            </fieldset>       
            </html:form>
        </div>
    </div><!-- row -->
    </logic:equal>
    </logic:present>
    <logic:notPresent name="usuario">
        <div class="alert-error"><bean:message key="welcome.noidentificado"/>. <html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link></div>
    </logic:notPresent>
    </div><!-- mi-hero-unit -->
    </div> <!-- container -->
    </div> <!-- continer mifondo -->
    </body>
</html>
