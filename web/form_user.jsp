<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.User" %>
<%
    // inisialisasi objek
    String hasil = "";
    User user = new User();
    
    String mode = request.getParameter("mode");
    if (mode==null) {
        mode = "insert";    
    } else if (mode.equals("insert")) { // operasi INSERT
        user.id = request.getParameter("id");
        user.tipe = request.getParameter("tipe");
        user.status = request.getParameter("status");
        user.tambah();
        mode = "update";
        hasil = "Berhasil ditambahkan";
    } else if (mode.equals("update")) {
        user.baca(request.getParameter("id"), request.getParameter("tipe"));        
        user.id = request.getParameter("id");
        user.tipe = request.getParameter("tipe");
        user.status = request.getParameter("status");
        user.update();
        mode = "update";
        hasil = "Berhasil disimpan";
    } else if (mode.equals("baca")) {
        mode = "update";
        user.baca(request.getParameter("id"), request.getParameter("tipe"));        
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
        <form action="form_user.jsp" method="post" >
            <input value="<%=mode%>" name="mode">
            ID : <input name="id" value="<%=user.id%>">
            Tipe : <input name="tipe" value="<%=user.tipe %>"><br>
            Status: <input name="status" value="<%=user.status%>"><br>
            
            <button type="submit">Simpan</button>
        </form>
        <a href="form_mahasiswa.jsp">Tambah</a> - 
                <a href="index.jsp">Kembali ke halaman depan</a>

            <%=hasil%>
        <%=user.getErrMsg() %>


    </body>
</html>
