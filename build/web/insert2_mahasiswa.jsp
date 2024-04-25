<%-- 
    Document   : insert2_mahasiswa
    Author     : En Tay
    Description: Menambahkan data ke database, tapi lewat class Mahasiswa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Mahasiswa" %>
<%
    // inisialisasi objek
    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.nim = request.getParameter("nim");
    mahasiswa.nama = request.getParameter("nama");
    mahasiswa.ipk = Double.parseDouble(request.getParameter("ipk"));
    String hasil = "";
    mahasiswa.tambah();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menambahkan data lewat class</title>
    </head>
    <body>
        <%=hasil%><br>
        <a href="index.html">Kembali ke halaman depan</a>

    </body>
</html>
