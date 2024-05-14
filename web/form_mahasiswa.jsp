<%-- 
    Document   : form_mahasiswa.jsp
    Created on : Apr 2, 2024, 3:20:15 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Mahasiswa" %>
<%
    // inisialisasi objek
    String hasil = "";
    Mahasiswa mahasiswa = new Mahasiswa();

    String mode = request.getParameter("mode");
    if (mode == null) {
        mode = "insert";
    } else if (mode.equals("insert")) { // operasi INSERT
        mahasiswa.nim = request.getParameter("nim");
        mahasiswa.nama = request.getParameter("nama");
        mahasiswa.alamat = request.getParameter("alamat");
        mahasiswa.angkatan = request.getParameter("angkatan");
        mahasiswa.lahirTanggal = null;
        mahasiswa.lahirTempat = request.getParameter("lahirTempat");
        mahasiswa.status = request.getParameter("status");
        mahasiswa.tambah();
        mode = "update";
        hasil = "Berhasil ditambahkan";
    } else if (mode.equals("update")) {
        mahasiswa.baca(request.getParameter("nim"));
        mahasiswa.nim = request.getParameter("nim");
        mahasiswa.nama = request.getParameter("nama");
        mahasiswa.alamat = request.getParameter("alamat");
        mahasiswa.angkatan = request.getParameter("angkatan");
        mahasiswa.lahirTanggal = null;
        mahasiswa.lahirTempat = request.getParameter("lahirTempat");
        mahasiswa.status = request.getParameter("status");
        mahasiswa.update();
        mode = "update";
        hasil = "Berhasil disimpan";
    } else if (mode.equals("baca")) {
        mode = "update";
        mahasiswa.baca(request.getParameter("nim"));
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Data ke MySql</title>
    </head>
    <body>
        <h1>Form Data</h1>
        <form action="form_mahasiswa.jsp" method="post" >
            <input value="<%=mode%>" name="mode">
            NIM : <input name="nim" value="<%=mahasiswa.nim%>"><br>
            Nama : <input name="nama" value="<%=mahasiswa.nama%>"><br>
            Alamat: <input name="alamat" value="<%=mahasiswa.alamat%>"><br>
            Angkatan: <input name="angkatan" value="<%=mahasiswa.angkatan%>"><br>
            Lahir: <input name="lahirTempat" value="<%=mahasiswa.lahirTempat%>" placeholder="Tempat">
            <input name="lahirTanggal" value="<%=mahasiswa.lahirTanggal == null ? "" : mahasiswa.lahirTanggal%>" placeholder="Tanggal" type="Date"><br>
            Status: <input name="status" value="<%=mahasiswa.status%>"><br>
            IPK : <input name="ipk" value="<%=mahasiswa.getIpk()%>"><br>
            <button type="submit">Simpan</button>
        </form>
        <%=hasil%>
        <%=mahasiswa.getErrMsg()%>
        <a href="index.jsp">Kembali ke halaman depan</a>
    </body>
</html>
