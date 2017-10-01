<%-- 
    Document   : authorsPage
    Created on : Oct 1, 2017, 6:35:51 PM
    Author     : Rob C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD Page</title>
        <link rel="stylesheet" type="text/css" href="./css/eBooksStoreCSS.css">
        <link rel="stylesheet" type="text/css" href="./css/menu.css">
    </head>
    <body>    
        <!-- Begin Navigation Menu -->
        <div id="nav">
            <ul>
                <li><a href="homePage.jsp">Home</a></li>
                <li><a href="eBooksPage.jsp">eBooks</a></li>
                <li><a href="authorsPage.jsp">Authors</a></li>
            </ul>              
        </div>
        <!-- End Navigation Menu -->
        <!-- Begin Display Authors Table -->
        <div>
            
            <table class="tablewithborder">
                <tr><th>Authors list</th></tr>
                <tr>                   
                    <th>Firstname</th>
                    <th>Lastname</th>                     
                </tr>
                <tr>            
                    <td>Robert</td> 
                    <td>Martin</td>
                </tr>
                <tr>                  
                    <td>Karl</td> 
                    <td>Marlantes</td>
                </tr>
            </table>
        </div>
        <!-- End Display Authors Table -->
    </body>
</html>
