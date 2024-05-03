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
    
    if (mode==null) {
        mode = "insert";    
    } else if (mode.equals("insert")) { // operasi INSERT
        mahasiswa.nim = request.getParameter("nim");
        mahasiswa.nama = request.getParameter("nama");
        mahasiswa.ipk = Double.parseDouble(request.getParameter("ipk"));
        mahasiswa.tambah();
        mode = "update";
        hasil = "Berhasil ditambahkan";
    } else if (mode.equals("update")) {
        mahasiswa.nim = request.getParameter("nim");
        mahasiswa.nama = request.getParameter("nama");
        mahasiswa.ipk = Double.parseDouble(request.getParameter("ipk"));
        mahasiswa.update();
        mode = "update";
        hasil = "Berhasil disimpan";
    } else if (mode.equals("update")) {
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
            NIM : <input name="nim" value="<%=mahasiswa.nim %>"><br>
            Nama : <input name="nama" value="<%=mahasiswa.nama %>"><br>
            IPK : <input name="ipk" value="<%=mahasiswa.ipk %>"><br>
            <button type="submit">Simpan</button>
        </form>
        <%=hasil%>
        <a href="index.html">Kembali ke halaman depan</a>
    </body>
</html>
