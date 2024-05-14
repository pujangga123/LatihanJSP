<%-- 
    Document   : show2_mahasiswa.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="kampus.DatabaseTest" %>
<%
    // deklarasi variable yang bisa diakses di seluruh halaman
    Connection connection = null;
    ResultSet rs = null; // objek untuk menampung hasil query

    try {

        connection = DatabaseTest.connect();

        if (!connection.isClosed()) {
            // prepare select statement
            String sql = "SELECT * FROM mahasiswa";
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery(sql);
            // PERHATIKAN
            // perintah SQL SELECT di eksekusi menggunakan perintah executeQuery
            // berbeda dengan perintah SQL UPDATE & INSERT menggunakan executeUpdate
        }
    } catch (Exception ex) {
        out.println("Unable to connect to database" + ex);
    }
%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Mahasiswa</title>
    </head>
    <body>
        <table>
            <tr>
                <th>NIM</th>
                <th>Nama</th>
                <th>IPK</th>
                <th></th>
            </tr>
            <%  while (rs.next()) {%>
            <tr>
                <td><%=rs.getString("nim")%></td>
                <td><%=rs.getString("nama")%></td>
                <td><%=rs.getDouble("ipk")%></td>
                <td>
                    <a href='form_mahasiswa.jsp?mode=baca&nim=<%=rs.getString("nim")%>'>edit</a>
                <td>
            </tr>
            <% } %>
        </table>

        <a href="form_mahasiswa.jsp">Tambah</a> - 
        <a href="index.jsp">Kembali ke halaman depan</a>

    </body>
</html>
<%  // koneksi ditutup dibagian akhir halaman, karena koneksi masih di akses di 
    // bagian BODY halaman (lewat objek rs).
    connection.close();
%>