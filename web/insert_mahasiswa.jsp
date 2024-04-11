<%-- 
    Document   : insert_mahasiswa.jsp
    Author     : En Tay
    Description: Menambahkan record baru ke tabel mahasiswa berdasarkan data yang dikirimkan dari form_insert.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String connectionURL = "jdbc:mysql://localhost/test";
                Connection connection = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(connectionURL, "root", "");

                if (!connection.isClosed()) {

                    // prepare select statement
                    String sql = "INSERT INTO mahasiswa (nim,nama,nilai) values (?,?,?)";
                    PreparedStatement st = connection.prepareStatement(sql);
                    st.setString(1, request.getParameter("nim"));
                    st.setString(2, request.getParameter("nama"));
                    st.setInt(3, Integer.parseInt(request.getParameter("nilai")));
                    st.executeUpdate();
                }
                connection.close();
                out.println("Data berhasil ditambahkan");
            } catch (Exception ex) {
                out.println("Data gagal disimpan: " + ex);
            }
        %>
        <a href="index.html">Kembali ke halaman depan</a>
    </body>
</html>
