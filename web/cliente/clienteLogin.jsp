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
    <meta charset="utf-8">
    <title>SiluSoft</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
         
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="../css/silusoftmovil.min.css" />
      <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile.structure-1.3.0.min.css" />
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.js"></script>
    </head>

    <body>
    <div data-role="page" id="principal" data-title="index" >

	<div data-role="header">
		<h3>Acceso Clientes</h3>
	</div><!-- /header -->
	
    <div data-role="content">
        <div id="grid" class="ui-grid-a">
            <html:form action="" >
            <div data-role="fieldcontain" class="ui-hide-label">               
                <input type="text" name="username" id="username" value="" placeholder="Dni"/>
            </div>
            <div data-role="fieldcontain" class="ui-hide-label">               
                <input type="text" name="username" id="username" value="" placeholder="Contraseña"/>
            </div>
            <div data-role="fieldcontain" class="ui-hide-label">
                <html:submit><button type="submit" data-theme="a" class="ui-btn-hidden" aria-disabled="false">Acceder</button></html:submit>
            </div>
            </html:form>
        </div>
    </div> <!-- content -->
    </div><!--page principal -->
    </body>
</html:html>
