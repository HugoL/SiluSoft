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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Agenda</title>
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
                               <div align="center"><p class="tituloform"><bean:message key="agenda.titulo"/></p>
					</div>
					<div > 
					  
					</div>
					<div><center><a href="dameAgenda.do?var=0"><bean:message key="agenda.hoy"/></a></center></div>
					<div class="destacado"><center><a href="miAgenda.do?fecha=<%=String.valueOf(agendafit.getFecha()) %>&var=-1"><</a> <strong><bean:write name="agenda" property="fecha" /></strong> <a href="miAgenda.do?fecha=<%=String.valueOf(agendafit.getFecha()) %>&var=1">></a></center></div>
                    <table width="80%" border="1" cellspacing="0" cellpadding="0" class="agenda">
                        <tr>
                          <td></td>                         
                                <logic:iterate id="sala" name="listaSalas" scope="request" type="es.pfc.model.Agenda">                              
                                    <td class="agendaotra"><div align="center"><strong><bean:write name="sala" property="sala" /></strong></div></td>                                    
                                </logic:iterate>
                        </tr>
                        <td></td>
                          <logic:iterate id="evento" name="listaEventos" scope="request" type="es.pfc.model.Evento">
                              <tr>
                                <td class="hora1"><bean:write name="evento" property="evento"/></td>   
                                <logic:iterate id="sala" name="listaAgendas" scope="request" type="es.pfc.model.Agenda">                              
                                    <td class="agendaotra"><span class="evento"><bean:write name="sala" property="acto"/><a href="/SiluSoft/Ventanas/insertarEvento.jsp?evento=<bean:write name="evento" property="columna"/>&maquina=<bean:write name="sala" property="idSala"/>&fecha=<%=String.valueOf(agendafit.getFecha()) %>&estilo=agendaconfort" target="_blank" style=""><img src="imagenes/lapiz.png" width="20" height="20" /></a></span></td>
                                </logic:iterate>
                              </tr>
                          </logic:iterate>
                        </tr>
                         <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                  </table>
                    <div class="calendario"> 
                    <p>&nbsp;</p>
                    <p><html:image src="./imagenes/calendario.png"/></p>
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
                    <td><div class="cuerpoblanco" align="center"><p><bean:message key="general.noprivilegios"/></p><br /><a href="javascript:history.back()"><bean:message key="Volver"/></a></div></td>
    		</tr>   
     	</table>    
        </logic:notEqual>
    </logic:present>
    <logic:notPresent name="usuario" scope="session">
        
     </logic:notPresent>
     <%-- include header --%>
    <tiles:insert page="plantillas/pie.jsp" flush="true"/>
    </body>
</html>
