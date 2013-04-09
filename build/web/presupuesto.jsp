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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">
        <link href="./css/nuevosestilos.css" rel="stylesheet">
        <script src="JS/jquery.js"></script>
        <script type="text/javascript">

     $(document).ready(function(){ 
          $("input#btncalcula").click(function(){              
              var sesionestotal = Number($("input#txtsesionesc").val()) + Number($("input#txtsesionesf").val());
              var preciototal = sesionestotal * Number($("input#txtpreciosesion").val());
              preciototal = preciototal - Number($("input#txtdescuento").val());
              $("input#txtprecio").val(preciototal);
          })

      });

</script>
<!-- TinyMCE -->
<script type="text/javascript" src="./jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "simple"
	});
</script>
<!-- /TinyMCE -->

    </head>
    <body class="blanco">        
        <div id="logo" style="float:none"> <img src="imagenes/logoSilu.jpg"/></div>
    <div class="container">    
            <div class="row-fluid span12">   
                <logic:present name="usuario">
                <logic:present name="cliente">    
    <h3>OBJETIVOS PARA EL CLIENTE</h3>
    <p>Sr/Sra <bean:write name="cliente" property="nombre"/> <bean:write name="cliente" property="apellidos"/> <bean:write name="cliente" property="apellido2"/></p>
    <p>El check-up Siludermis  es una análisis de su morfología y un estudio energético.<br/>
        Las medidas hechas en todo su cuerpo, nos permite verificar:<br/>
        Su peso ideal es de : <br/>
        Los kilos que usted debe de adelgazar son: <br/>
        Para obtener un resultado excelente y eliminar la grasa superflua acumulada en diferentes zonas de su cuerpo, usted necesita realizar:</p>
    <p>Sesiones para SILHOUWELL FIT: <input type="text" name="txtsesionesf" id="txtsesionesf" value="<%= fit %>" class="span1" /></p>
<p>Sesiones para SILHOUWELL CONFORT: <input type="text" name="txtsesionesc" id="txtsesionesc" value="<%= confort %>" class="span1"/></p>
<p>El completo estudio de sus formas corporales nos permite verificar que su predisposición morfológica es : 
El estudio energético que se le realiza, nos permite de una manera segura comprobar cómo es su estado energético, para poder indicar de manera  efectiva, los integradores , aceites esenciales y alimentación según su grupo sanguíneo, y siempre bajo la supervisión del profesional  Esteticista/ Terapeuta/.</p>
<p>El tratamiento PROGRAMA ADELGAZANTE PERSONALIZADO  que usted tiene que seguir , permitirá a ………………………. Dar una garantía de resultado deseado. 
PRECIO DEL PROGRAMA PERSONALIZADO.</p>    
<div>
                 <form>
                     <div class="control-group"><span>Precio de la sesión: </span>
                         <div class="controls"><input type="text" name="txtpreciosesion" id="txtpreciosesion" class="span1" maxlength="4"/></div>
                     </div>
                     <div class="control-group"><span>Descuento: </span>
                         <div class="controls"><input type="text" name="txtdescuento" id="txtdescuento" class="span1" value="0"/></div>
                     </div>
                     <div class="control-group">
                         <div class="controls"><input type="button" class="btn btn-primary btn-success" name="btncalcula" id="btncalcula" value="Ver presupuesto"/></div>
                     </div>
                 </form>
</div>
<p>Precio total: <input type="text" name="txtprecio" id="txtprecio" class="span2" readonly="readonly" /></p>
<div id="firmas" style="float:none">
    Elige la forma de pago:    
    <br/><br/>
</div>						
<div class="span12">
    <div class="firmacentro span5">Directora Técnica</div><div class="firmacliente span5">Cliente Informado</div>
</div>
<div class="span12" align="center">
    <html:form action="/InsertarPresupuesto">
        <html:textarea property="valor" rows="15" cols="80" style="width: 80%">Nam nisi elit, cursus in rhoncus sit amet, pulvinar laoreet leo. Nam sed lectus quam, ut sagittis tellus. Quisque dignissim mauris a augue rutrum tempor. Donec vitae purus nec massa vestibulum ornare sit amet id tellus. Nunc quam mauris, fermentum nec lacinia eget, sollicitudin nec ante. Aliquam molestie volutpat dapibus. Nunc interdum viverra sodales. Morbi laoreet pulvinar gravida. Quisque ut turpis sagittis nunc accumsan vehicula. Duis elementum congue ultrices. Cras faucibus feugiat arcu quis lacinia. In hac habitasse platea dictumst. Pellentesque fermentum magna sit amet tellus varius ullamcorper. Vestibulum at urna augue, eget varius neque. Fusce facilisis venenatis dapibus. Integer non sem at arcu euismod tempor nec sed nisl. Morbi ultricies, mauris ut ultricies adipiscing, felis odio condimentum massa, et luctus est nunc nec eros.
        </html:textarea>
        <html:submit styleClass="btn btn-danger">Guardar</html:submit>
    </html:form>
    
</div>
    <div id="imprimir" class="span12" align="center">
        <form name="imprimir" action=""><input class="btn btn-danger" type="button" name="imprimir" value="Imprimir" onclick="window.print();" /></form>
    </div>
                </logic:present>
</logic:present>
    <logic:notPresent name="usuario">
    <div class="alert alert-error">La sesión ha caducado. Debe loguearse de nuevo</div>
    </logic:notPresent>
    <logic:notPresent name="cliente">
    <div class="alert alert-error">La sesión ha caducado. Debe loguearse de nuevo</div>
    </logic:notPresent>
</div><!-- row -->      
    </div><!-- container -->

    </body>
</html>
