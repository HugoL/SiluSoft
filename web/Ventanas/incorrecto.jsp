<html:html>
    <head>
        <!?[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]?>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { margin-left: 30px; margin-right: 30px;}
        </style>
        <link href="../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../css/nuevosestilos.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Correcto</title>
        <script language="javascript1.1">
        function cerrar(){
            window.opener.document.location = "../miagenda.jsp";
            window.opener.location.reload();
            window.close();
        }
        </script>
    </head>
    <body onload="javascript: cerrar()">
     <%-- include header --%>
     <tiles:insert page="../plantillas/barranav.jsp" flush="true"/>
    <div class="containter">   
    <div class="mi-hero-unit">    
        <div class="row">            
            <div class="aler alert-success"><h5>Operación no realizada con éxito</h5></div>        
        <html:errors/>                    
        </div>
    </div>
    </div>
    </body>
</html:html>