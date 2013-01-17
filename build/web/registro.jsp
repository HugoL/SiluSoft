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

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="estilo.css" rel="stylesheet" type="text/css">
                <title><bean:message key="registro.titulo" /></title>
                
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { padding-top: 60px; margin-left: 10px; margin-right: 10px;}
        </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet"
    </head>
    <body>
       
       <div class="container">  
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
  <div class="hero-unit">
    <div class="row-fluid">
        
        <div class="span10" align="center">
            <html:form action="Login" styleClass="form-horizontal">
			<div class="control-group" align="center">
                            <label><bean:message key="registro.usuario" />:</label>
                            <div class="controls"><html:text property="nombre" styleId="nombre" /></div> 
			</div>
                        <div class="clearfix"></div>
			<div class="control-group">
                            <label><bean:message key="registro.password" />:</label>
                            <div class="controls"><html:password property="password"/></div> 
			</div>
			<div class="control-group">
                            <div class="controls"><html:submit value="Acceder" styleClass="btn btn-danger btn-large" /></div>
			</div>
            <html:errors/>
            </html:form>
        </div>
    </div>
   </div>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="JS/bootstrap.min.js"></script>
    <script src="JS/bootstrap-modal.js"></script>
    </body>
</html:html>
