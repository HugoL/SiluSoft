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
<% String fit = request.getParameter("fit");
    String confort = request.getParameter("com");    
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuesto</title>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../css/nuevosestilos.css" rel="stylesheet">
        <script src="JS/jquery.js"></script>
        <script type="text/javascript">

     $(document).ready(function(){

          $("btncalcula").click(function(){
              var sesionestotal = Number($("txtsesionesf").val()) + Number($("txtsesionesc").val());
              var preciototal = sesionestotal * Number($("txtpreciosesion").val());
              preciototal = preciototal - Number($("txtdescuento").val);
              $("txtprecio").val(preciototal);
          })

      });

</script>
    </head>
    <body>
        <div id="logo" style="float:none"> <img src="imagenes/logoSilu.jpg"/></div>
<div class="row-fluid">
    <legend>Presupuesto para el cliente <bean:write name="cliente" property="nombre"/> <bean:write name="cliente" property="apellidos"/> <bean:write name="cliente" property="apellido2"/></legend>
<p>SILUDERMIS REALIZA EL SIGUIENTE PRESUPUESTO</p>

<p>Sesiones para fit: <input type="text" name="txtsesionesf" value="<%= fit %>" /></p>
<p>Sesiones para comfort: <input type="text" name="txtsesionesc" value="<%= confort %>" /></p>
<p>Precio por sesión: <input type="text" name="txtpreciosesion"/></p>
<div>
                 <form styleClass="form-inline">
                     <div class="control-group"><span>Precio de la sesión: </span>
                         <div class="controls"><text name="txtpreciosesion" class="span2"/></div>
                     </div>
                     <div class="control-group"><span>Descuento: </span>
                         <div class="controls"><text name="txtdescuento" class="span2"/></div>
                     </div>
                     <div class="control-group">
                         <div class="controls"><input type="button" class="btn btn-primary btn-success" name="btncalcula" value="Ver presupuesto"/></div>
                     </div>
                 </form>
</div>
<p>Precio total: <input type="text" name="txtprecio" readonly="readonly" /></p>
<div id="firmas" style="float:none">
<div id="firmacliente" style="float:left"><p align="left">El cliente <br/><br/><br/><br/><br/><br/><br/></p></div><div id="firmacentro" style="float:right"><p align="right">El centro<br/><br/><br/><br/><br/><br/><br/></p></div>
</div>
    <div id="imprimir" style="float: none" align="center">
        <form name="imprimir" action=""><input type="button" name="imprimir" value="Imprimir" onclick="window.print();" /></form>
    </div>
</div><!-- row -->
    </body>
</html>
