<%-- 
    Document   : delete2_mahasiswa
    Description: Menghapus data mahasiswa lewat GET parameter
                 cara pemanggilannya, lihat show_mahasiswa.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Mahasiswa" %>
<%
    String hasil = "";
    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.baca(request.getParameter("nim"));
    mahasiswa.hapus();
    hasil = "Data berhasil dihapus";
    
%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hapus Data</title>
    </head>
    <body>

        <%=hasil%><br>
        <a href="index.html">Kembali ke halaman depan</a>

    </body>
</html>
