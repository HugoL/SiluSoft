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
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
    List Clientes = (List) request.getAttribute("listado"); 
    session.removeAttribute("cliente");
 %>
<!DOCTYPE html>
<html:html>
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
    <body>
        <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales.jsp" flush="true"/>
    <div class="mi-hero-unit">
        <div class="span11"><h3><bean:message key="listadoclientes.titulo"/> </h3></div>        
        <div class="span11" align="right"><html:link href="/SiluSoft/buscarCliente.jsp" styleClass="btn ">Buscar cliente</html:link></div>
        <div class="pagination pagination-small"><a name="anclacli"></a>
        <ul>
        <li class="enabled"><a href="ListaClientes.do?pag=a#anclacli">A</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=b#anclacli">B</a></li>    
        <li class="enabled"><a href="ListaClientes.do?pag=c#anclacli">C</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=d#anclacli">D</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=e#anclacli">E</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=f#anclacli">F</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=g#anclacli">G</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=h#anclacli">H</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=i#anclacli">I</a></li> 
        <li class="enabled"><a href="ListaClientes.do?pag=j#anclacli">J</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=k#anclacli">K</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=l#anclacli">L</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=m#anclacli">M</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=n#anclacli">N</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=ñ#anclacli">Ñ</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=o#anclacli">O</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=p#anclacli">P</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=q#anclacli">Q</a></li>  
        <li class="enabled"><a href="ListaClientes.do?pag=r#anclacli">R</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=s#anclacli">S</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=t#anclacli">T</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=u#anclacli">U</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=v#anclacli">V</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=w#anclacli">W</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=x#anclacli">X</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=y#anclacli">Y</a></li>
        <li class="enabled"><a href="ListaClientes.do?pag=z#anclacli">Z</a></li>
        </ul>
    </div> 
    <div class="row">                          
             <div><p><a href="principal.jsp" class="btn btn-success"><em class="icon-home icon-white"></em> Volver al menú</a></p></div>   
             <table class="table table-condensed table-striped">
        	<thead>                
                    <th><strong><bean:message key="formulario.nombre" /></strong></th>
                    <th><strong><bean:message key="formulario.apellido1"/></strong></th>  
                    <th><strong><bean:message key="formulario.apellido2"/></strong></th>  
                    <th></th>          
                    <th></th>
                    <th colspan="2"></th>
                </thead>
                <tbody>
                 <logic:iterate id="cliente" name="listado" scope="request" type="es.pfc.model.Cliente">                    
                  <tr>                   
                  <td id="Nombre"><bean:write name="cliente" property="nombre"/></td>
                  <td><bean:write name="cliente" property="apellidos"/></td>  
                  <td><bean:write name="cliente" property="apellido2"/></td> 
                  <td><a class="btn btn-success btn-small" href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=3"><em class="icon-user icon-white"></em> Ver Ficha</a></td>                            
                  <td><a class="btn btn-warning btn-small" href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=8"><em class="icon-edit icon-white"></em> Editar</a> </td>
                  <td><a class="btn btn-inverse btn-small" href="DameDatosCliente.do?dni=<bean:write name='cliente' property='dni'/>&op=7"><em class="icon-ok-sign icon-white"></em> Asistencia</td>
                  </tr>
                 </logic:iterate>
                </tbody>
            </table>
            </div>                    
            <div class="pagination pagination-small">
        <ul>
        <li class="enabled"><a href="#">A</a></li>
        <li class="disabled"><a href="#">B</a></li>    
        <li class="disabled"><a href="#">C</a></li>  
        <li class="disabled"><a href="#">D</a></li>  
        <li class="disabled"><a href="#">E</a></li>  
        <li class="disabled"><a href="#">F</a></li>  
        <li class="disabled"><a href="#">G</a></li>  
        <li class="disabled"><a href="#">H</a></li>  
        <li class="disabled"><a href="#">I</a></li> 
        <li class="disabled"><a href="#">J</a></li>  
        <li class="disabled"><a href="#">K</a></li>  
        <li class="disabled"><a href="#">L</a></li>  
        <li class="disabled"><a href="#">M</a></li>  
        <li class="disabled"><a href="#">N</a></li>  
        <li class="disabled"><a href="#">Ñ</a></li>  
        <li class="disabled"><a href="#">O</a></li>  
        <li class="disabled"><a href="#">P</a></li>  
        <li class="disabled"><a href="#">Q</a></li>  
        <li class="disabled"><a href="#">R</a></li>
        <li class="disabled"><a href="#">S</a></li>
        <li class="disabled"><a href="#">T</a></li>
        <li class="disabled"><a href="#">U</a></li>
        <li class="disabled"><a href="#">V</a></li>
        <li class="disabled"><a href="#">W</a></li>
        <li class="disabled"><a href="#">X</a></li>
        <li class="disabled"><a href="#">Y</a></li>
        <li class="disabled"><a href="#">Z</a></li>
        </ul>
    </div>
        <div><a href="principal.jsp" class="btn btn-success"><em class="icon-home icon-white"></em> Volver al menú</a></div>
	</div>
	</div>	
     </logic:present>
     <logic:notPresent name="usuario" scope="session">
     <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
</logic:notPresent>
    <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/><p></p>
     </div>
    </body>
</html:html>
