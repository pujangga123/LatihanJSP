<%-- 
    Document   : edit2_mahasiswa.jsp
    Description: 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Mahasiswa"%>
<%
    String nim = request.getParameter("nim");
    String mode = request.getParameter("mode");
    
    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.baca(nim);
    
    if(mode.equals("simpan")) {
        mahasiswa.nama = request.getParameter("nama");
        mahasiswa.ipk = Double.parseDouble(request.getParameter("ipk"));
        mahasiswa.update();
    }     
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Data</title>
    </head>
    <body>
        <h1>Form Data</h1>
        <form action="insert2_mahasiswa.jsp" method="post" >
            <input type="hidden" name="mode" value="simpan">
            NIM : <input name="nim"><br>
            Nama : <input name="nama"><br>
            IPK : <input name="ipk"><br>
            <button type="submit">Simpan</button>
        </form>
        <a href="index.html">Kembali ke halaman depan</a>
    </body>
</html>
