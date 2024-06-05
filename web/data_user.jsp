<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.User" %>
<%
    List<User> daftar = User.getList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data User</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tipe</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for (User row : daftar) {%>
                <tr>
                    <td><%=row.id%></td>
                    <td><%=row.tipe%></td>
                    <td><a href="form_user.jsp?mode=baca&id=<%=row.id%>&tipe=<%=row.tipe%>">edit</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <a href="form_user.jsp">Tambah</a> - 
        <a href="index.jsp">Kembali ke halaman depan</a>
    </body>
</html>
