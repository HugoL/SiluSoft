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
<%@page import="es.pfc.model.TestCliente"%>
<%@page import="es.pfc.model.Cliente"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="test.titulo"/></title>
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
        <script type="text/javascript" src="JS/jquery.js"></script>        
        <script>
        $(document).ready(function(){
            var values = {};
            $("#nerviosatxt").val("0");
            $("#biliosatxt").val("0");
            $("#nerviosatxt").val("0");
            $("#linfaticatxt").val("0"); 
            $("#sanguineatxt").val("0");
            $("select.sel").change(function(){ 
                var valor = this.value;
                var id = this.id; 
                var cont = 0;
                //compruebo si se está cambiando un valor que ya se había dado           
                if(values[id]!=null){
                     switch(values[id]){
                    case "1":                        
                        cont = parseInt($("#nerviosatxt").val(),10)-1;                                               
                        values[id] = valor;
                        $("#nerviosatxt").val(cont);
                        break;
                    case "2":
                        cont = parseInt($("#biliosatxt").val(),10)-1;        
                        values[id] = valor;
                        $("#biliosatxt").val(cont);
                        break;
                    case "3":
                        cont = parseInt($("#linfaticatxt").val(),10)-1;    
                        values[id] = valor;
                        $("#linfaticatxt").val(cont);
                        break;
                    case "4":
                        cont = parseInt($("#sanguineatxt").val(),10)-1; 
                        values[id] = valor;
                        $("#sanguineatxt").val(cont);
                        break;
                    default:
                }
                }
                //alert (valor);
                switch(valor){
                    case "1":                        
                        cont = parseInt($("#nerviosatxt").val(),10)+1;                                               
                        values[id] = valor;
                        $("#nerviosatxt").val(cont);
                        break;
                    case "2":
                        cont = parseInt($("#biliosatxt").val(),10)+1;        
                        values[id] = valor;
                        $("#biliosatxt").val(cont);
                        break;
                    case "3":
                        cont = parseInt($("#linfaticatxt").val(),10)+1;    
                        values[id] = valor;
                        $("#linfaticatxt").val(cont);
                        break;
                    case "4":
                        cont = parseInt($("#sanguineatxt").val(),10)+1; 
                        values[id] = valor;
                        $("#sanguineatxt").val(cont);
                        break;
                    default:
                }
            });        
        
            $('btncalcula').click(function() {
                // get all the inputs into an array.
                var $selects = $('#form_test :select');   
                // get an associative array of just the values.
                var values = {};
                $selects.each(function() {
                    values[this.name] = $(this).val();
                    alert(this.name+", "+this.val);
                });
                 //calcula(values);
            });
        });    
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
        <div class="row"> 
    <div class="span11">
    <ul class="nav nav-tabs">  
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=3">Datos</a></li> 
        <li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
        <li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=9">Calcular Sesiones</a></li>
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha"> 
        <legend><bean:message key="test.de"/><strong> <bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></legend>
        <logic:equal name="ManipulaClientes" property="activado" value="true">            
	  	<table align="center" class="table-bordered">                    
                    <html:form action="/InsertaTestDinamico" styleId="form_test">
                        <html:hidden name="cliente" property="idCliente"/>                                                    
                        <thead>    
                    <tr>
                        <td>&nbsp;</td>
			<td><div align="center"><img src="imagenes/sanguinea.jpg" /></div></td>
			<td><div align="center"><img src="imagenes/linfatica.jpg" /></div></td>
			<td><div align="center"><img src="imagenes/biliosa.jpg" /></div></td>
			<td><div align="center"><img src="imagenes/nerviosa.jpg" /></div></td>
			<td></td>
		    </tr>
                    </thead>
                    <tbody>
                    <tr>
			<td><div align="center">&nbsp;</div></td>
			<td><div align="center"><strong><bean:message key="test.sanguinea"/></strong></div></td>
			<td><div align="center"><strong><bean:message key="test.linfatica"/></strong></div></td>
			<td><div align="center"><strong><bean:message key="test.biliosa"/></strong></div></td>
			<td><div align="center"><strong><bean:message key="test.nerviosa"/></strong></div></td>
                        <td><div align="center"><strong><bean:message key="test.respuesta"/></strong></div></td>
		   </tr>                          
                       <logic:iterate id="pregunta" name="listaPreguntas" scope="request" type="es.pfc.model.PreguntaTest">                         
                   <tr>                      
                       <input type="hidden" name="numPregunta" value="<bean:write name="pregunta" property="idPregunta"/>"/>
                        <td class="warning"><strong><bean:write name="pregunta" property="texto" /></strong></td>                            
                        <td align="center" class="datos"><bean:write name="pregunta" property="respsanguinea" /></td>
                        <td align="center" class="datos"><bean:write name="pregunta" property="resplinfatica" /></td>
                        <td align="center" class="datos"><bean:write name="pregunta" property="respbiliosa" /></td>
                        <td align="center" class="datos"><bean:write name="pregunta" property="respnerviosa" /></td>
                        <td class="datos"><select property="campos" id="sel<bean:write name="pregunta" property="idPregunta"/>" class="sel">
                                            <option value="0">--</option>
                                            <option value="4"><bean:write name="pregunta" property="respsanguinea" /></option> 
                                            <option value="3"><bean:write name="pregunta" property="resplinfatica" /></option>
                                            <option value="2"><bean:write name="pregunta" property="respbiliosa" /></option>
                                            <option value="1"><bean:write name="pregunta" property="respnerviosa" /></option>
                                          </select></td>
                    </tr>                    
                       </logic:iterate>   
                    <tr>                        
                        <td></td>
                        <td>
                           <div class="control-group success">
                           <label class="control-label">Sanguínea</label>
                           <div class="controls">
                                <input type="text" name="sanguineatxt" id="sanguineatxt" class="span1" />                  
                           </div>
                           </div>
                        </td>
                        <td>
                            <div class="control-group warning">
                           <label class="control-label">Linfática</label>
                           <div class="controls">
                                <input type="text" name="linfaticatxt" id="linfaticatxt" class="span1"/>                
                           </div>
                           </div>
                        </td>
                        <td>
                            <div class="control-group info">
                           <label class="control-label">Biliosa</label>
                           <div class="controls">
                                <input type="text" name="biliosatxt" id="biliosatxt" class="span1" />                
                           </div>
                           </div>
                        </td>
                        <td>
                        <div class="control-group error">
                           <label class="control-label">Nerviosa</label>
                           <div class="controls">
                                <input type="text" name="nerviosatxt" id="nerviosatxt" class="span1" />               
                           </div>
                           </div>                                
                       </td>
                        <td></td>
                    </tr>                    
                    <tr  class="warning">
                        <td><strong><bean:message key="test.resultado"/>: </strong></td>
                        <td colspan="4" align="center">
                                        <select name="morfologia" id="morfologia">
                                            <option value="Nerviosa"><bean:message key="test.nerviosa"/></option> 
                                            <option value="Biliosa"><bean:message key="test.biliosa"/></option>
                                            <option value="Linfatica"><bean:message key="test.linfatica"/></option>
                                            <option value="Sanguinea"><bean:message key="test.sanguinea"/></option>
                                        </select>
                        </td>	
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td colspan=6>&nbsp;</td>
                    </tr>
            </tbody>
		</table>
    <div class="span11"><center><input type="submit" value="insertar" class="btn btn-primary btn-large" /></center></div>
                </html:form>
    </div>
<div class="span11" align="center"><p><br/><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
         <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a><br/><br/></p>
         </div>
        </div>
    </logic:equal>
		
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
        <center><table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
            </table></center>    
        </logic:notEqual>
</logic:present>
<logic:notPresent name="usuario" scope="session">
    <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
    </div>
    </body>
</html>
