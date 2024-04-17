<%-- 
    Document   : insert2_mahasiswa
    Author     : En Tay
    Description: Menambahkan data ke database, tapi lewat class Mahasiswa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Mahasiswa"%>
<%
    // inisialisasi objek
    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.nim = request.getParameter("nim");
    mahasiswa.nama = request.getParameter("nama");
    mahasiswa.nilai = Integer.parseInt(request.getParameter("nilai"));
    String hasil = "";
    if (mahasiswa.tambah()) {
        hasil = "Data berhasil ditambahkan";
    } else {
        hasil = "Data GAGAL disimpan";
    }

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
