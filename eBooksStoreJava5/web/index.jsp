<%-- 
    Document   : index.jsp
    Author     : gheorgheaurelpacurar
    Copyright  : gheorgheaurelpacurar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electronic Books Store Authentication and authorization</title>
        <link rel="stylesheet" type="text/css" href="./css/eBooksStoreCSS.css">
    </head>
    <body>
        <c:set var="activePage" value="index" scope="session"></c:set>
            <h3>Welcome to Electronic Books Store</h3>  
        <%-- <hr> --%>
        <!-- delegation of authentication and authorization is done to associated Servlet -->
        <table class="tablecenterdwithborder">
            <form action="${pageContext.request.contextPath}/index" method="POST">
                <tr>
                    <td class="label-login">
                        Username: 
                    </td>
                    <td>
                        <input class = "inputlarge" type="text" name="authenticationpage_username"></input>
                    </td>
                </tr> 
                <tr>
                    <td class="label-login">
                        Password: 
                    </td>
                    <td>
                        <input class="inputlarge" type="password" name="authenticationpage_password"></input>
                    </td>
                </tr> 
                <tr>
                    <td>
                        <input type="submit" name="authenticationpage_authenticate" value="Login"></input>
                    </td>
                </tr>
            </form>
        </table>
    </body>
</html>
