<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Users" %>
<%@page import="kampus.UsersMahasiswa" %>
<%@page import="kampus.UsersDosen" %>

<%
    String id = "";
    String tipe = "";
    Users user;
    if(session.getAttribute("id")!=null) {
        id=(String)session.getAttribute("id");  
        tipe = (String)session.getAttribute("tipe");        
        
        if(tipe.equals("DOSEN")) {
            user = new UsersDosen();
        } else {
            user = new UsersMahasiswa();
        }
        user.baca(id);

    } else {
        user = null;
    }
   %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beranda: SI Kampus</title>
    </head>
    <body>
        <% if(id.equals("")){ %>
            <a href="login_dosen.jsp">LOGIN</a>
        <% } else { %>
            Halo <%=user.getNama() %> [<%=user.id %>]
        <% } %>
        <ul>
            <li><a href="data_mahasiswa.jsp">Mahasiswa</a></li>
            <li><a href="data_dosen.jsp">Dosen</a></li>
            <li><a href="data_userdosen.jsp">User</a></li>

        </ul>
    </body>
</html>
