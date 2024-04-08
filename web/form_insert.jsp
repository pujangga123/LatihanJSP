<%-- 
    Document   : form_insert.jsp
    Created on : Apr 2, 2024, 3:20:15 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Data ke MySql</title>
    </head>
    <body>
        <h1>Form Data</h1>
        <form action="mysql_insert.jsp" method="post" >
            NIM : <input name="nim"><br>
            Nama : <input name="nama"><br>
            Nilai : <input name="nilai"><br>
            <button type="submit">Simpan</button>
        </form>
    </body>
</html>
