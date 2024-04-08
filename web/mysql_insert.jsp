<%-- 
    Document   : mysql_insert.jsp
    Created on : Apr 2, 2024, 3:22:48 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    try {
        String connectionURL = "jdbc:mysql://localhost/test";
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL, "root", "");

        if (!connection.isClosed()) {
        
        // prepare select statement
            String sql = "INSERT INTO mahasiswa (nim,nama,nilai) values (?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,"Budi");
            st.setInt(2, 60);
            ResultSet rs = st.executeQuery(sql);
        }
        connection.close();
    } catch (Exception ex) {
        out.println("Unable to connect to database" + ex);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
