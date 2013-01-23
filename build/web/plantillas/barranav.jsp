<%-- 
    Document   : barranav
    Created on : 30-nov-2012, 1:05:27
    Author     : ko
--%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- barra navegación superior -->
<div class="navbar">
  <div class="navbar-inner">
    <a class="brand" href="./principal.jsp">SiluSoft</a>    
    <ul class="nav">        
      <li><a href="./perfilUsuario.jsp"><i class="icon icon-user"></i> Perfil</a></li>
      <li><html:link forward="logoff"><i class="icon icon-off"></i> Salir</html:link></li>
    </ul>  
      <div style="float: right" class="sesiondiv"><bean:message key="general.sesion"/><strong><bean:write scope="session" name="usuario" property="nombre" /></strong>!</div>
  </div>
</div>
<!-- --------------- -->
