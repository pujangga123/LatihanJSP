<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Dosen" %>
<%
    // inisialisasi objek
    String hasil = "";
    Dosen dosen = new Dosen();
    
    String mode = request.getParameter("mode");
    if (mode==null) {
        mode = "insert";    
    } else if (mode.equals("insert")) { // operasi INSERT
        dosen.nid = request.getParameter("nid");
        dosen.nama = request.getParameter("nama");
        dosen.status = request.getParameter("status");
        dosen.tambah();
        mode = "update";
        hasil = "Berhasil ditambahkan";
    } else if (mode.equals("update")) {
        dosen.baca(request.getParameter("nid"));        
        dosen.nid = request.getParameter("nid");
        dosen.nama = request.getParameter("nama");
        dosen.status = request.getParameter("status");
        dosen.update();
        mode = "update";
        hasil = "Berhasil disimpan";
    } else if (mode.equals("baca")) {
        mode = "update";
        dosen.baca(request.getParameter("nid"));        
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
        <form action="form_dosen.jsp" method="post" >
            <input value="<%=mode%>" name="mode">
            NID : <input name="nid" value="<%=dosen.nid%>">
            Nama : <input name="nama" value="<%=dosen.nama %>"><br>
            Status: <input name="status" value="<%=dosen.status%>"><br>
            
            <button type="submit">Simpan</button>
        </form>
        <a href="form_mahasiswa.jsp">Tambah</a> - 
                <a href="index.jsp">Kembali ke halaman depan</a>

            <%=hasil%>
        <%=dosen.getErrMsg() %>


    </body>
</html>
