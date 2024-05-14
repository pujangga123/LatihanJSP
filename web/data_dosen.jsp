<%-- 
    Document   : data_dosen
    Created on : May 7, 2024, 2:02:11 PM
    Author     : Lenovo
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Dosen" %>
<%
    List<Dosen> daftar = Dosen.getList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Dosen</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>NID</th>
                    <th>Nama</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for (Dosen row : daftar) {%>
                <tr>
                    <td><%=row.nid%></td>
                    <td><%=row.nama%></td>
                    <td><a href="form_dosen.jsp?mode=baca&nid=<%=row.nid%>">edit</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <a href="form_dosen.jsp">Tambah</a> - 
        <a href="index.jsp">Kembali ke halaman depan</a>
    </body>
</html>
