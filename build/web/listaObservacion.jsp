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

<%@page import="es.pfc.model.Observacion"%>
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
        <legend><bean:message key="observaciones.titulo"/> <bean:write name="cliente" property="nombre" /> <bean:write name="cliente" property="apellidos" /></legend> 	  
            <div class="span10"><bean:message key="observaciones.motivo"/>:  <bean:write name="observacion" property="motivo"  /></div>	   
        <div class="span10"><bean:message key="observaciones.tratamientos"/>: 
                              <bean:write name="observacion" property="tratamientosAnteriores"  /></div>
        <div class="span10"><label><bean:message key="observaciones.variapeso"/>:
                            <bean:write name="observacion" property="variacionesPeso"  /></div>
        <div class="span10"><bean:message key="observaciones.pesomax"/>:
		      <bean:write name="observacion" property="pesoMax" />Kgs.</div>		      
        <div class="span10"><span class="textoform"><bean:message key="observaciones.pesomin"/>:</span>
	        <bean:write name="observacion" property="pesoMin" />Kgs</div>	
	<div class="span10"><span class="textoform"><bean:message key="observaciones.pesoIdeal"/>:</span>
	        <bean:write name="observacion" property="pesoIdeal" />Kgs.</div>		    
        <div class="span10"><span class="textoform"><bean:message key="observaciones.tallaActual"/>:
		        </span>
		      <bean:write name="observacion" property="tallaActual" />
	        <span class="textoform">Cm.</span></div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.tallaDeseada"/>:</span>
	        <bean:write name="observacion" property="tallaDeseada" />Cm.</div>
	<div class="span10"><bean:message key="observaciones.tension"/>:</div>
	<div class="span10"><span class="textoform">T<bean:message key="observaciones.tensionmin"/>: </span>
		      <bean:write name="observacion" property="tensionMin" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.tensionmax"/>:</span>
           <bean:write name="observacion" property="tensionMax" />
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.enfermedades"/>:
		        </span>
                            <bean:write name="observacion" property="enfermedades"/>
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.alergias"/>:</span>
		        <bean:write name="observacion" property="alergias" />
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.terapias"/>:</span>
	        <bean:write name="observacion" property="terapias"/>
        </div>
        <div class="span10"><p><bean:message key="observaciones.amnesis"/></p></div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.menstruaciones"/>:</span>
		        <bean:write name="observacion" property="menstruaciones" />
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.embarazos"/></span>
                            <bean:write name="observacion" property="embarazos" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.partos"/></span>
	        <bean:write name="observacion" property="partos" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.abortos"/>
		      </span>
			  <bean:write name="observacion" property="abortos" />
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.anticonceptivo"/>: </span>
		      <bean:write name="observacion" property="metodoAnticonceptivo"/>
        </div>
        <div class="span10"><bean:message key="observaciones.funciones"/>: </div>
	<div class="span10"><label><span class="textoform"><bean:message key="observaciones.diuresis"/>:
			    </span>
			    <bean:write name="observacion" property="diuresis" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.suenyo"/>: </span>
		    <bean:write name="observacion" property="suenyo" />
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.ritmo"/>: </span>
                            <bean:write name="observacion" property="ritmoIntestinal"/>
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.actividad"/>: </span>
		      <bean:write name="observacion" property="actividadFisica" />
        </div>
        <div class="span10"><bean:message key="observaciones.digestiones"/>:</div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.normales"/>
		      </span>
		      <bean:write name="observacion" property="digestiones" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.dificultosas"/></span>
	        <bean:write name="observacion" property="digestiones" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.aerofagias"/>
		      </span>
			<bean:write name="observacion" property="digestiones" />
        </div>
        <div class="span10"><bean:message key="observaciones.disfunciones"/>: </div>
	<div class="span10"><bean:message key="observaciones.pesadez"/>:
		      <bean:write name="observacion" property="pesadezPiernas" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.dolor"/>:</span>
			    <bean:write name="observacion" property="dolor" />
        </div>
        <div class="span10"><span class="textoform"><bean:message key="observaciones.calambres"/>:</span>
	 	    <bean:write name="observacion" property="calambres" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.piesfrios"/>: </span>
			<bean:write name="observacion" property="piesFrios" />
        </div>
	<div class="span10"><span class="textoform"><bean:message key="observaciones.manosfrias"/>: </span>
			<bean:write name="observacion" property="manosFrias" />
        </div>
        </logic:equal>
        </div>
         <logic:notEqual name="ConsultaClientes" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> <bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>  
         </div>
        </logic:notEqual>
		</logic:present>
    <div class="span11" align="center"><p><br/><a class="btn btn-success" href="principal.jsp"><em class="icon-home icon-white"></em> Volver al menú</a>
         <a class="btn btn-warning" href="ListaClientes.do"><em class="icon-list icon-white"></em> Listado de clientes </a><br/><br/></p>
         </div> 
             <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
        </div>
        </div>
     </div>
       
    </body>
</html>
