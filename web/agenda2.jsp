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

<%@page import="java.util.List"%>
<%@page import="es.pfc.model.Agenda"%>
<%@page import="es.pfc.model.Cliente"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Agenda agendafit = (Agenda) request.getAttribute("agenda");      
%>
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
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link href="css/nuevosestilos.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda</title>
    </head>
    <body>
       <%-- include header --%>
     <tiles:insert page="plantillas/barranav.jsp" flush="true"/>
     <div class="container mifondo">
     
     <tiles:insert page="plantillas/logo.jsp" flush="true"/>
     <logic:present name="usuario">
     <div class="containter">   
    <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
    <div class="mi-hero-unit">
    <logic:equal name="ConsultaAgenda" property="activado" value="true">
    <div class="row">           
    <div class="span11 cuerpoficha">   
         <div id="agenda"> 
                        <legend><h4><bean:message key="agenda.titulo"/></h4></legend>
                        <div class="span10"><center><a class="btn btn-inverse" href="miAgenda.do?var=0"><bean:message key="agenda.hoy"/></a></center></div>
                        <div class="clearfix"></div>
                        <div class="span10"><center><a class="btn btn-danger btn-small" href="miAgenda.do?fecha=<%=String.valueOf(agendafit.getFecha()) %>&var=-1"><em class="icon icon-arrow-left icon-white"></em></a> <strong><bean:write name="agenda" property="fecha" /></strong> <a class="btn btn-danger btn-small" href="miAgenda.do?fecha=<%=String.valueOf(agendafit.getFecha()) %>&var=1"><em class="icon icon-arrow-right icon-white"></em></a></center></div>                        
                        <div class="clearfix">&nbsp;</div>
                        <div class="span10">
                        <table class="table table-bordered table-striped">					                       
                        <tr class="warning">
                          <td><span class="label label-success"><bean:write name="agenda" property="diaSemana" /></span></td>
                        <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">                              
                              <td class="agendaotra"><div align="center"><strong><bean:write name="sala" property="sala" /></strong></div></td>
                          </logic:iterate>                          
                        </tr>                    
                        <tr>
                          <td class="sucess">09:00</td>
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento90" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento90&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento90" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento90&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>                              
                          </logic:iterate>
                          
                        </tr>
                        <tr>
                          <td class="sucess">09:30</td>                      
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento93" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento93&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento93" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento93&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">10:00</td>                         
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento10" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento10&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento10" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento10&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">10:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento103" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento103&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento103" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento103&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr class="sucess">
                          <td>11:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento11" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento11&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento11" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento11&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">11:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento113" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento113&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento113" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento113&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">12:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento12" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento12&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento12" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento12&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">12:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento123" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento123&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento123" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento123&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">13:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento13" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento13&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento13" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento13&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                          
                        </tr>
                        <tr>
                          <td class="sucess">13:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento133" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento133&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento13" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento130&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">14:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento14" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento14&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento14" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento14&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">14:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento143" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento143&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento143" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento143&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">15:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento15" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento15&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento15" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento15&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">15:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento153" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento153&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento153" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento153&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">16:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento16" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento16&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento16" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento16&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">16:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento163" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento163&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento163" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento163&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">17:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento17" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento17&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento17" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento17&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">17:30</td>                         
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento173" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento173&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento173" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento173&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">18:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento18" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento18&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento18" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento18&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">18:30</td>                         
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento183" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento183&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento183" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento183&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">19:00</td>                         
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento19" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento19&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento19" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento19&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort&acto=<bean:write name="sala" property="evento19" />" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">19:30</td>                         
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento193" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento193&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento193" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento193&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">20:00</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento20" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento20&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento20" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento20&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>
                        <tr>
                          <td class="sucess">20:30</td>                          
                          <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">
                              <td><bean:write name="sala" property="evento203" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento203&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a><logic:notEqual name="sala" property="evento203" value=""><a href="/SiluSoft/Ventanas/actualizarEvento.jsp?evento=Evento203&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort&acto=" target="_blank" style=""><img src="imagenes/evento.png" width="20" height="20" /></a></logic:notEqual></span></td>
                              
                          </logic:iterate>
                        </tr>                     
                  </table>                                         
                </div><!-- contenedor agenda -->			                                                  
	</div><!-- agenda -->
        <div class="span11" align="center"><a class="btn btn-success" href="principal2.jsp"><em class="icon-home icon-white"></em> <bean:message key="general.volvermenu"/></a></div>
    </div>   
        </logic:equal>
        <logic:notEqual name="ConsultaAgenda" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
    </div>
    </div>
    </logic:present>
    <logic:notPresent name="usuario" scope="session">
        
     </logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
     </div>
     </div>
    </body>
</html>
