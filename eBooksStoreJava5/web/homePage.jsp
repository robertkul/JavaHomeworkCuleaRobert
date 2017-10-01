<%-- 
    Document   : homePage
    Created on : Oct 1, 2017, 1:01:11 AM
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
        <!-- Begin CRUD Table -->
        <div>
            <table class="tablewithborder">                
                <tr>
                    <th>Select</th>
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
                    <td align="center"> <input type="checkbox" name="myTextEditBox" value="checked" ></td>
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
                    <td align="center"> <input type="checkbox" name="myTextEditBox" value="checked" ></td>
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
        <!-- End CRUD Table -->
        <div class="ebooksinput">
             <table class="tablecenterdwithborder">
            <form action="" method="POST">
                <tr>
                    <td class="label-login">
                        ISBN: 
                    </td>
                    <td>
                        <input class = "inputlarge" type="text" name="homepage_isbn"></input>
                    </td>
                </tr> 
                <tr>
                    <td class="label-login">
                        Title: 
                    </td>
                    <td>
                        <input class="inputlarge" type="text" name="homepage_title"></input>
                    </td>
                </tr> 
                 <tr>
                    <td class="label-login">
                        Author: 
                    </td>
                    <td>
                        <input class = "inputlarge" type="text" name="homepage_author"></input>
                    </td>
                </tr> 
                <tr>
                    <td class="label-login">
                        Genre: 
                    </td>
                    <td>
                        <input class="inputlarge" type="text" name="homepage_genre"></input>
                    </td>
                </tr> 
                 <tr>
                    <td class="label-login">
                        Language: 
                    </td>
                    <td>
                        <input class = "inputlarge" type="text" name="homepage_language"></input>
                    </td>
                </tr> 
                <tr>
                    <td class="label-login">
                        Publishing: 
                    </td>
                    <td>
                        <input class="inputlarge" type="text" name="homepage_publishing"></input>
                    </td>
                </tr> 
                 <tr>
                    <td class="label-login">
                        Rating: 
                    </td>
                    <td>
                        <input  type="text" name="homepage_rating"></input>
                    </td>
                </tr> 
                <tr>
                    <td class="label-login">
                        Pages: 
                    </td>
                    <td>
                        <input  type="number" name="homepage_pages"></input>
                    </td>
                </tr> 
                 <tr>
                    <td class="label-login">
                        Type: 
                    </td>
                    <td>
                        <input type="text" name="homepage_type"></input>
                    </td>
                </tr> 
                <tr>
                    <td class="label-login">
                        Price: 
                    </td>
                    <td>
                        <input type="number" name="homepage_price"></input>
                    </td>
                </tr> 
                <tr>
                    <td>
                        <input type="submit" name="homepage_insert" value="Insert"></input>
                    </td>
                    <td>
                        <input type="submit" name="homepage_update" value="Update"></input>
                    </td>
                    <td>
                        <input type="submit" name="homepage_delete" value="Delete"></input>
                    </td>
                </tr>
            </form>
        </table>
        </div>
    </body>
</html>
