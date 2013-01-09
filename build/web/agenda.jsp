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
    Agenda agendafit = (Agenda) request.getAttribute("agendaFit");
	Agenda agendaconfort = (Agenda) request.getAttribute("agendaConfort");
	Agenda agendacabina = (Agenda) request.getAttribute("agendaCabina");
	Agenda agendaotra = (Agenda) request.getAttribute("agendaOtra");
    List lista = (List) request.getAttribute("listaFit");
    List listaConfort = (List) request.getAttribute("listaConfort");
    List listaCabina = (List) request.getAttribute("listaCabina");
    List listaOtra = (List) request.getAttribute("listaOtra");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="agenda.titulo"/></title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
              <%-- include header --%>
    <tiles:insert page="plantillas/logo.jsp" flush="true"/>
    <logic:present name="usuario">
	<center>    
	<div >   
        <tiles:insert page="plantillas/PestanasGenerales2.jsp" flush="true"/>
        
        <logic:equal name="ConsultaAgenda" property="activado" value="true">
     <table class="cuerpoblanco">
         <tr>
             <td>
		 	   <div id="agenda"> 
					<div align="center"><p class="tituloform">Agenda</p>
					</div>
					<div > 
					  
					</div>
                    <table width="80%" border="1" cellspacing="0" cellpadding="0" class="agenda">
					<tr> 
						<td colspan="5"><div align="center"><center><a href="dameAgenda.do?var=0">Ver d&iacute;a de hoy </a></center></div></td>
					</tr>
                        <tr class="destacado">
                            <td colspan="5"><center><a href="dameAgenda.do?fecha=<%=String.valueOf(agendafit.getFecha()) %>&var=-1"><</a> <strong><bean:write name="agendaFit" property="fecha" /></strong> <a href="dameAgenda.do?fecha=<%=String.valueOf(agendafit.getFecha()) %>&var=1">></a></center></td>
                        </tr>
                        <tr>
                          <td width="8%"></td>
                          <td width="23%" class="agendafit"><div align="center"><strong>Fit</strong></div></td>
                          <td width="23%" class="agendaconfort"><div align="center"><strong>Confort</strong></div></td>
                          <td width="23%" class="agendacabina"><div align="center"><strong>Cabina</strong></div></td>
                          <td width="23%" class="agendaotra"><div align="center"><strong>Otra</strong></div></td>
                        </tr>
                    
                        <tr>
                          <td class="hora1">09:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento90" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento90&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento90" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento90&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento90" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento90&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento90" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento90&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">09:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento93" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento93&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento93" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento93&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento93" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento93&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento93" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento93&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">10:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento10" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento10&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento10" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento10&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento10" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento10&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento10" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento10&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">10:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento103" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento103&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento103" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento103&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento103" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento103&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento103" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento103&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">11:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento11" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento11&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento11" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento11&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento11" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento11&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento11" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento11&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">11:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento113" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento113&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento113" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento113&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento113" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento113&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento113" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento113&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">12:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento12" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento12&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento12" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento12&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento12" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento12&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento12" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento12&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">12:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento123" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento123&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento123" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento123&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento123" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento123&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento123" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento123&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">13:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento13" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento13&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento13" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento13&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento13" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento13&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento13" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento13&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">13:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento133" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento133&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento133" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento133&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento133" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento133&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento133" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento133&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">14:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento14" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento14&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento14" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento14&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento14" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento14&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento14" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento14&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">14:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento143" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento143&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento143" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento143&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento143" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento143&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento143" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento143&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">15:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento15" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento15&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento15" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento15&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento15" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento15&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento15" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento15&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">15:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento153" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento153&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento153" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento153&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento153" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento153&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento153" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento153&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">16:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento16" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento16&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento16" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento16&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento16" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento16&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento16" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento16&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">16:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento163" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento163&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento163" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento163&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento163" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento163&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento163" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento163&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">17:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento17" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento17&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento17" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento17&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento17" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento17&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento17" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento17&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">17:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento173" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento173&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento173" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento173&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento173" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento173&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento173" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento173&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">18:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento18" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento18&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento18" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento18&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento18" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento18&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento18" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento18&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">18:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento183" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento183&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento183" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento183&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento183" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento183&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento183" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento183&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">19:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento19" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento19&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento19" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento19&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento19" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento19&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento19" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento19&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora1">19:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento193" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento193&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento193" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento193&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento193" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento193&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento193" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento193&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">20:00</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento20" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento20&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento20" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento20&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento20" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento20&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento20" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento20&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td class="hora2">20:30</td>
                          <td class="agendafit"><bean:write name="agendaFit" property="evento203" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento203&maquina=<%=String.valueOf(lista.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendafit" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaconfort"><bean:write name="agendaConfort" property="evento203" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento203&maquina=<%=String.valueOf(listaConfort.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendacabina"><bean:write name="agendaCabina" property="evento203" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento203&maquina=<%=String.valueOf(listaCabina.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendacabina" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                          <td class="agendaotra"><bean:write name="agendaOtra" property="evento203" /><span class="evento"><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=Evento203&maquina=<%=String.valueOf(listaOtra.get(0))%>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaotra" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                  </table><div class="calendario"> 
                    <p>&nbsp;</p>
                    <p>Aqui ira el calendario pequeño</p>
                  </div>
		 	   </div>
			 </td>
         </tr>
    </table>                                                                    
	</div>        
        </logic:equal>
        <logic:notEqual name="ConsultaAgenda" property="activado" value="true">
         <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tabla" >   
    		<tr>
                    <td><div class="cuerpoblanco" align="center"><p> <bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"> Volver</a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
    </logic:present>
    <logic:notPresent name="usuario" scope="session">
                <center><bean:message key="general.noidentificado"/></center><br /><html:link href="./Registro.do"><bean:message key="general.identificarse"/></html:link>
     </logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
