<%-- 
    Document   : show_mahasiswa.jsp
    Created on : Apr 11, 2024, 9:20:28 AM
    Author     : En Tay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
    // deklarasi variable yang bisa diakses di seluruh halaman
    Connection connection = null;    
    ResultSet rs;
%>
<%
    try {
        String connectionURL = "jdbc:mysql://localhost/test";
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL, "root", "");

        if (!connection.isClosed()) {
        
        // prepare select statement
            String sql = "SELECT * FROM mahasiswa";
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery(sql);
            
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
        <a href="index.html">Kembali ke halaman depan</a>
        <table>
            <tr>
                <th>NIM</th>
                <th>Nama</th>
                <th>Nilai</th>
                <th></th>
            </tr>
            <%   
                // looping data untuk menampilkan data (rs) ke bentuk tabel
                while(rs.next()) {
                    out.println("<tr>"
                    + "<td>"+rs.getString("nim")+"</td>"
                    + "<td>"+rs.getString("nama")+"</td>"
                    + "<td>"+rs.getString("nilai")+"</td>"
                    + "<td><a href='delete_mahasiswa.jsp?nim="+rs.getString("nim")+"'>hapus</a><td>"
                    + "</tr>");
                }
            %>
        </table>
    </body>
</html>
<%
  connection.close();  
%>