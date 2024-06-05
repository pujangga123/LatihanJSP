<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.User" %>
<%
    User user = new User();
    if(session.getAttribute("id")!=null) {
        String id=(String)session.getAttribute("id");  
        user.baca(id, "DOSEN");        
    } else {
        String redirectURL = "login.jsp";
        response.sendRedirect(redirectURL);
    }
   %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beranda: SI Kampus</title>
    </head>
    <body>
        Halo, <%=0%>
        <ul>
            <li><a href="data_mahasiswa.jsp">Mahasiswa</a></li>
            <li><a href="data_dosen.jsp">Dosen</a></li>
            <li><a href="data_user.jsp">User</a></li>

        </ul>
    </body>
</html>
