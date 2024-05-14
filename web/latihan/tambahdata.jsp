<%-- 
    JSP execute update query mysql
    Pastikan Anda sudah menambahkan Mysql Connector di Library
--%>

<%-- bagian deklarasi & import --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%-- bagian pengolahan dan persiapan data --%>
<%
    // DEKLARASI OBJEK DAN VARIABEL
    Connection connection = null;
    String hasil = "";
        
    try {
        String connectionURL = "jdbc:mysql://localhost/test";
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL, "root", "");

        if (!connection.isClosed()) {

            // prepare select statement
            String sql = "INSERT INTO mahasiswa (nim,nama,nilai) values (?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "33333");
            st.setString(2, "JOKO");
            st.setInt(3, 99);
            st.executeUpdate();
        }
        connection.close();
        hasil = "Data berhasil ditambahkan";
    } catch (Exception ex) {
        hasil = "Data gagal disimpan: " + ex;
    }
%>
<%-- DOKUMEN HTML --%>
<!DOCTYPE html>
<html>
    <%-- DOKUMEN HTML: HEAD --%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Baru</title>

    </head>
    <%-- DOKUMEN HTML: BODY --%>
    <body>        
        <%=hasil%><br>
        <a href="index.html">Kembali ke halaman depan</a>
    </body>
</html>