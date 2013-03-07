<%-- 
    Document   : presupuesto
    Created on : 07-mar-2013, 0:49:28
    Author     : ko
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
        <title>Presupuesto</title>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../css/nuevosestilos.css" rel="stylesheet">
    </head>
    <body>
        <div id="logo" style="float:none"> <img src="imagenes/logoSilu.jpg"/></div>
<div id="contenido" style="float: none">
    <legend>Presupuesto para el cliente <bean:write name="cliente" property="nombre"/> <bean:write name="cliente" property="apellidos"/> <bean:write name="cliente" property="apellido2"/></legend>
<p>SILUDERMIS REALIZA EL SIGUIENTE PRESUPUESTO</p>

<p>Sesiones para fit: <bean:write name="sesiones" property="fit" /></p>
<p>Sesiones para comfort: <bean:write name="sesiones" property="confort" /> </p>
<p>Precio: </p>
</div>
<div id="firmas" style="float:none">
<div id="firmacliente" style="float:left"><p align="left">El cliente <br/><br/><br/><br/><br/><br/><br/></p></div><div id="firmacentro" style="float:right"><p align="right">El centro<br/><br/><br/><br/><br/><br/><br/></p></div>
</div>
    <div id="imprimir" style="float: none" align="center">
        <form name="imprimir" action=""><input type="button" name="imprimir" value="Imprimir" onclick="window.print();" /></form>
    </div>
    </body>
</html>
