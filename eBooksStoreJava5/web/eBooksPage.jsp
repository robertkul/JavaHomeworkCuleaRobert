<%-- 
    Document   : eBooksPage
    Created on : Oct 1, 2017, 6:35:35 PM
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
        <!-- Begin Display eBooks Table -->
        <div>
            <table class="tablewithborder">
                 <tr><th>eBooks list</th></tr>
                <tr>                  
                    <th>ISBN</th>
                    <th>Title</th> 
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Language</th>
                    <th>Publishing</th>
                    <th>Rating</th>
                    <th>Pages</th>                    
                    <th>Type</th>
                    <th>Price</th>
                </tr>
                <tr>                   
                    <td>0132350882</td>
                    <td>Clean Code</td> 
                    <td>ROBERT MARTIN</td>
                    <td>Computers & Technology</td>
                    <td>English</td>
                    <td>Prentice Hall</td>
                    <td>*****</td>
                    <td>464</td>
                    <td>PDF</td>
                    <td>37.12</td>                    
                </tr>
               <tr>                   
                    <td>1232350882</td>
                    <td>Matterhorn</td> 
                    <td>KARL MARLANTES</td>
                    <td>History</td>
                    <td>English</td>
                    <td>Atlantic Monthly Press</td>
                    <td>*****</td>
                    <td>617</td>
                    <td>EPUB</td>
                    <td>9.96</td>                    
                </tr>
            </table>
        </div>
        <!-- End Display eBooks Table -->
    </body>
</html>
