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
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.titulo"/></title>
        <html:base/>
        
        <!—[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]—>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { padding-top: 60px; margin-left: 10px; margin-right: 10px;}
        </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet">
    </head>
    <body>         
    <center>   
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        <div class="container">  
   <tiles:insert page="plantillas/logo.jsp" flush="true"/>    
    <div class="hero-unit">
        <div class="row-fluid">        
             <div class="span11" align="center">
                 <h2><bean:message key="welcome.cabecera"/></h2>
                 <p><bean:message key="welcome.textoinicio"/></p>
        </div>
    </div>
    </div>
   
    <logic:present name="usuario">
        <div class="row-fluid">
        <div class="span11" align="center">    
            <h1><bean:message key="welcome.bienvenido"/> <bean:write name="usuario" property="nombre"/>!</h1>
            <a href="principal.jsp" class="btn btn-success btn-large">Acceder al menu</a>
        </div>
        </div>
    </logic:present>
        
    <logic:notPresent scope="session" name="usuario">
        <div class="row-fluid">
        <div class="span12">    
        
        <a href="./registro.jsp" class="btn btn-warning btn-large"><i class="icon-user icon-white"></i> <bean:message key="welcome.identificarse" /></a>
        </div>
        </div>
        </logic:notPresent>
    <html:errors/>
        <UL>
                <logic:present name="usuario">
                <LI><html:link forward="logoff">Salir</html:link></LI>
                </logic:present>
        </UL>      
    </center>
        
        <footer
            &copy; siludermis 2012
        </footer>
    </div> <!-- container -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="JS/bootstrap.min.js"></script>
    <script src="JS/bootstrap-modal.js"></script>
    </body>
</html:html>
