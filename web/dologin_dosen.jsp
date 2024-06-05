<%@page import="kampus.UsersDosen" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    UsersDosen user = new UsersDosen();
    if(user.login(username, password)) {
        session.setAttribute("id", username);
        session.setAttribute("tipe", "DOSEN");
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
%>