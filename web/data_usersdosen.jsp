<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.UsersDosen" %>
<%
    List<UsersDosen> daftar = UsersDosen.getList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data User Dosen</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tipe</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% for (UsersDosen row : daftar) {%>
                <tr>
                    <td><%=row.id%></td>
                    <td><%=row.tipe%></td>
                    <td><%=row.status%></td>
                    <td><a href="form_usersdosen.jsp?mode=baca&id=<%=row.id%>">edit</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <a href="form_usersdosen.jsp">Tambah</a> - 
        <a href="index.jsp">Kembali ke halaman depan</a>
    </body>
</html>
