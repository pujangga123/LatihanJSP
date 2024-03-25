<%-- 
    Document   : method_post
    Created on : Mar 25, 2024, 10:31:37 PM
    Author     : En Tay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Method Post</title>
    </head>
    <body>
        <form action="tampil_post.jsp" method="POST">
            <table>
                <tr>
                    <td>Nama</td>
                    <td><input type="text" name="nama"></td>
                </tr>
                <tr>
                    <td>Domisili</td>
                    <td><input type="text" name="domisili"></td>
                </tr>
                <tr>
                    <td>Pekerjaan</td>
                    <td><input type="text" name="job"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="SEND">
                        <input type="reset" value="CANCEL">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
