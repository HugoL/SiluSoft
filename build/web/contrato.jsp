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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<% String fit = request.getParameter("fit");
    String confort = request.getParameter("confort");
    String total = request.getParameter("total");
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Contrato Siludermis</title>
</head>

<body>
    <div id="logo" style="float:none"> <img src="imagenes/logoSilu.jpg"/></div>
<div id="contenido" style="float: none">
<p align="center"><strong>CONTRATO TRATAMIENTO SILHOUWELL INTEGREE</strong></p>
<p>SILUDERMIS REALIZA EL SIGUIENTE CONTRATO</p>
<p>Nombre y Apellidos: 
  <label>
  <input type="text" name="nombre"  size="80"/>
  </label>
</p>
<p>Direcci&oacute;n:
<label>
  <input type="text" name="direccion"  size="120"/>
  </label></p>
<p> </p>
<p>El se&ntilde;or o se&ntilde;ora <label>
  <input type="text" name="don"  size="50"/>
  </label> Representante legal de Siludermis</p>
<p> </p>
<p>1/ El cliente acepta el programa personalizado de Silhouwell compuesto de <label>
        <input type="text" name="sesionesf"  size="4" value="<%=fit%>"/>
  </label></p>
<p>Sesiones de Fit y <label>
  <input type="text" name="sesionesc"  size="4" value="<%=confort%>"/>
  </label> sesiones de Confort, haciendo un total de <label>
  <input type="text" name="sesionest"  size="6" value="<%=total%>"/>
  </label>
  Sesiones de Silhouwell. Debiendo realizarse 2-3 veces por semana con el objetivo de reducir y moldear su figura.</p>
<p>2/ Al comienzo del tratamiento el/la cliente tiene un total de <label>
  <input type="text" name="sobra"  size="9"/>
  </label>cm de contorno del cuerpo, teniendo que reducir <label>
  <input type="text" name="reducir"  size="9"/>
  </label>. Tal objetivo viene garantizado por el centro de Est&eacute;tica Especializada Siludermis a condici&oacute;n de que el cliente respete escrupulosamente las siguientes condiciones para llevar a cabo el programa de reducci&oacute;n corporal.</p>
<p>3/ El importe convenido y aceptado por el cliente para el programa de tratamiento personalizado asciende a<label>
  <input type="text" name="euros"  size="15"/>
  </label> comprendiendo todos los productos que se aplicaran en el centro Siludermis para dicho tratamiento. El centro recomienda una confecci&oacute;n de productos espec&iacute;ficos para el seguimiento del tratamiento en domicilio, que ser&aacute;n por cuenta del cliente, aparte del coste de su tratamiento en Siludermis, debi&eacute;ndose seguir la aplicaci&oacute;n de productos espec&iacute;ficos hasta la finalizaci&oacute;n de su tratamiento.</p>
<p>4/ El cliente se compromete a abonar el importe del tratamiento en <label>
  <input type="text" name="dias"  size="50"/>
  </label></p>
<p>5/ El programa de tratamiento personalizado y su contrato le condiciona a reservar la totalidad de su tratamiento.</p>
<p>6/ El cliente se compromete a corresponder por entero el importe pactado con las condiciones establecidas, y en caso de suspensi&oacute;n del tratamiento no se abonar&aacute; en dinero, sino que el centro le reembolsar&aacute; un bono valor por las sesiones que le queden por recibir.</p>
<p>7/ El cliente se compromete a respetar el horario del centro, teniendo que anular las citas con una antelaci&oacute;n de 24 horas de lo contrario se dar&aacute; por p&eacute;rdida la sesi&oacute;n establecidas.</p>
<p>8/ el cliente decide bajo su responsabilidad ser plenamente id&oacute;neo para recibir el tratamiento Silhouwell, estar exento de enfermedades cr&oacute;nicas o contagiosas.</p>
<p>9/ El centro no responde de eventuales robos o sustracciones de objetos personales si no son consignados a la direcci&oacute;n</p>
<p>10/ El centro asegura con garant&iacute;a de la realizaci&oacute;n de tratamiento hasta la obtenci&oacute;n del resultado final, con el compromiso del cliente de seguir los consejos de alimentaci&oacute;n que se requiera para conseguir los objetivos establecidos para su bienestar:</p>
<p>Haber efectuado dos sesiones m&iacute;nimo semanales durante al menos tres meses.<br />
    <ul>
        <li>No haber fallado m&aacute;s de dos semanas.<br /></li>
  <li>Haber respetado las observaciones alimentarias.<br /></li>
  <li>No haber revelado alguna enfermedad cong&eacute;nita a la direcci&oacute;n.<br /></li>
  <li>La utilizaci&oacute;n de f&aacute;rmacos con asiduidad para patolog&iacute;as.<br /></li>
    </ul><br/>
  11/ El presente contrato obliga al centro Siludermis a realizar controles semanales y quincenales al cliente para valorar y analizar el buen seguimiento del tratamiento hacia la reducci&oacute;n de cent&iacute;metros y moldeamiento de su figura.</p>
<p>12/ Las t&eacute;cnicas que utilice el centro Siludermis ( presoterapia, electroterapia, crioterapia, cavitaci&oacute;n, y manualidades) ser&aacute; la direcci&oacute;n del centro Siludermis quien establezca si se abonan a parte del tratamiento Silhouwell o por el contrario se valorar&aacute; el precio de las sesiones a realizar de otras terapias.</p>
<p> </p>
<p> </p>
<p> </p>
</div>
<div id="firmas" style="float:none">
<div id="firmacliente" style="float:left"><p align="left">El cliente <br/><br/><br/><br/><br/><br/><br/></p></div><div id="firmacentro" style="float:right"><p align="right">El centro<br/><br/><br/><br/><br/><br/><br/></p></div>
</div>
    <div id="imprimir" style="float: none" align="center">
        <form name="imprimir" action=""><input type="button" name="imprimir" value="Imprimir" onclick="window.print();" /></form>
    </div>
</body>
</html>
