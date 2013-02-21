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
        <li><a a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=1">Tratamiento</a></li>
      	<li class="active"><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=6">Observación</a></li>   
	<li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=4">Test</a></li>
        <li><a href="DameDatosCliente.do?dni=<bean:write name="cliente" property="dni"/>&op=5">Medidas</a></li>			    		
    </ul>
    </div> <!-- menu ficha -->    
    <div class="clearfix"></div>  
    <div class="span11 cuerpoficha"> 
            <html:form action="/InsertaObservacion" >              
                <legend><bean:message key="observaciones.titulo"/> <strong><bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /><input type="hidden" name="idCliente" value="<bean:write name="cliente" property="idCliente"/>"/></strong></legend>
                <div class="span11"><h5><bean:message key="observaciones.motivo"/>:</h5></div>
		<div class="span3"><label><bean:message key="observaciones.estetico"/></label>
                    <html:radio property="motivo" value="estetico" /></div>	                    
		<div class="span3"><label><bean:message key="observaciones.sobrepeso"/></label>
		 	      <html:radio property="motivo" value="Sobrepeso" /></div>		 	      
		<div class="span3"><label><bean:message key="observaciones.obesidad"/></label>		 	      
                    <html:radio property="motivo" value="Obesidad localizada" />
                </div>		 			 	
		<div class="span11"><label><bean:message key="observaciones.tratamientos"/></label>
                              <html:textarea property="tratamientosAnteriores"  />
                </div>
		 <div class="span11"><label><bean:message key="observaciones.variapeso"/>:</label>
                            <html:textarea property="variacionesPeso"  /></div>                 
                
                    <div class="span3"><label><span class="textoform"><bean:message key="observaciones.pesomax"/>: </label>
		      <html:text property="pesoMax" size="5" />Kgs.</div>
                    <div class="span3"><label><bean:message key="observaciones.pesomin"/>:</label>
                          <html:text property="pesoMin" size="5" />Kgs.</div>
                    <div class="span3"><label><bean:message key="observaciones.pesoIdeal"/>:</label>
                          <html:text property="pesoIdeal"  size="5" />Kgs.</div>
                               
                    <div class="span3"><label><bean:message key="observaciones.tallaActual"/>:</label>
                        <html:text property="tallaActual"  size="5" />Cm.</div>
                    <div class="span3 clearfix"><label><bean:message key="observaciones.tallaDeseada"/>:</label>
                        <html:text property="tallaDeseada"  size="5" />Cm.</div>              
		  <div class="span11">
                      <h5><bean:message key="observaciones.tension"/>:</h5></div>		  
                  <div class="span3"><label><bean:message key="observaciones.tensionmin"/>: </label>
                        <html:text property="tensionMin" size="5" />
                  </div>
		  <div class="span3 clearfix"><label><bean:message key="observaciones.tensionmax"/>:</label>
                        <html:text property="tensionMax" size="5" /></div>                  
		  <div class="span3"><label><bean:message key="observaciones.enfermedades"/>:</label>		        
                            <html:textarea property="enfermedades" cols="50"/>		    
                    </div>
		  <div class="span3"><label><span class="textoform">Alergias:</label>
		        <html:textarea property="alergias" cols="50" />
		    </div>
                  <div class="span3"><label>Terapias farmacol&oacute;gicas:</label>
                        <html:textarea property="terapias" cols="50" />
		  </div>
                  <div class="span11"><p><h5>Amnesis fisiológica</h5></p></div>
                  <div class="span11"><label>Menstruaciones:</label>
		        <html:textarea property="menstruaciones" cols="50" />
		  </div>
                  <div class="span3"><label>Embarazos</label>
                            <html:checkbox property="embarazos" value="1" />
                  </div>		  
                  <div class="span3"><label>Partos</label>
                    <html:checkbox property="partos" value="1" />
                  </div>
                  <div class="span3"><label>Abortos</label>		      
			  <html:checkbox property="abortos" value="1" /></div>
                  
                  <div class="span11"><label>M&eacute;todo anticonceptivo y problemas (si los hay): </label>
		      <html:textarea property="metodoAnticonceptivo" cols="50" />
		  </div>
                  <div class="span11"><h5>Funciones fisiológicas:</h5> </div>
                  <div class="span3"><label>Diuresis:</label>
			    <html:text property="diuresis" /></div>
                  <div class="span3 clearfix"><label>Sue&ntilde;o: </label>
		    <html:text property="suenyo" /></div>
                  <div class="span3"><label>Ritmo intestinal: </label>
                            <html:textarea property="ritmoIntestinal" />
		  </div>
                  <div class="span3 clearfix"><label>Actividad f&iacute;sica: </label>
                      <html:textarea property="actividadFisica" cols="50"/></div>
                      <div class="span11"><h5><bean:message key="observaciones.digestiones"/>:</h5></div>
                      <div class="span3"><label><bean:message key="observaciones.normales"/></label>
		      <html:radio property="digestiones" value="Normales" /></div>
                      <div class="span3"><label><bean:message key="observaciones.dificultosas"/>:</label>
                          <html:radio property="digestiones" value="Dificultosas" /></div>
                      <div class="span11"><label><bean:message key="observaciones.aerofagias"/>:</label>		      
                          <html:textarea property="digestiones" /></div>
                          <div class="span11"><h5><bean:message key="observaciones.disfunciones"/>:</h5></div>
		<div class="span3"><label><bean:message key="observaciones.pesadez"/>:</label>
		      <html:text property="pesadezPiernas" size="20" />
		</div>
		<div class="span3"><label><bean:message key="observaciones.dolor"/>:</label>
			    <html:text property="dolor" size="20" /></div>
                            <div class="clearfix">&nbsp;</div>
                <div class="span3"><label><bean:message key="observaciones.calambres"/>:</label>
	 	    <html:checkbox property="calambres" /></div>
		<div class="span3"><label><bean:message key="observaciones.piesfrios"/>:</label>
			<html:checkbox property="piesFrios" />
	 	</div>
		<div class="span3"><label><bean:message key="observaciones.manosfrias"/>: </label>
                    <html:checkbox property="manosFrias" />
	 	</div>                
                <div class="span11"><br/><center><input type="submit" class="btn btn-primary btn-large" value="Enviar" /></p></center></div>
                <div class="span11"><html:errors /></div>
		 </html:form>
        </div>
    <div class="span11" align="center"><p><br/><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
         <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a><br/><br/></p>
    </div>     
    </logic:equal>
        </div>	
    <logic:notEqual name="ManipulaClientes" property="activado" value="true">
        <center><table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> Ud. no tiene permisos para realizar la ficha de observaci&oacute;n. <br />El cliente no tiene ficha de observarci&oacute;n</p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
            </table></center>    
        </logic:notEqual>
          </logic:present> 
    <logic:notPresent name="usuario" scope="session">
    <center>No se le ha conocido como usuario registrado</center><br /><html:link href="./Registro.do">Registrarse</html:link>
</logic:notPresent>
    </div>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
        
    </div>
     </div>        
    </body>
</html>
