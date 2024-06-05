<%@page import="kampus.User" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    User user = new User();
    if(user.login(username, password)) {
        session.setAttribute("id", username);
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
%>