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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title><tiles:getAsString name="titulo"/></title>
   </head>
   <body>
        <table width="90%">
            <tr>
                <td height="25%" colspan="2">
                    <tiles:insert attribute="logo"></tiles:insert>
                </td>
            </tr>
            <tr>
                <td>
                    <tiles:insert attribute="menu"></tiles:insert>
                </td>
                <td>
                    <tiles:insert attribute="pie"></tiles:insert>
                </td>
            </tr>
        </table>
    </body>
</html>
