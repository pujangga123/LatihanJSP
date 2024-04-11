<%-- 
    Document   : tampil_post.jsp
    Created on : Mar 25, 2024, 10:32:21 PM
    Author     : En Tay
    Description: Menampilkan data POST yang dikirimkan dair method_post.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="0">
            <tr>
                <td width="70px">Nama</td>
                <td width="10px">:</td>
                <td><%= request.getParameter("nama")%></td>
            </tr>
            <tr>
                <td>Domisili</td>
                <td>:</td>
                <td><%= request.getParameter("domisili")%></td>
            </tr>
            <tr>
                <td>Pekerjaan</td>
                <td>:</td>
                <td><%= request.getParameter("job")%></td>
            </tr>
            <tr>
                <td colspan="3" align="center"><a href="method_post.jsp">Back to Page</a>
                </td>
            </tr>
        </table>
    </body>
</html>
