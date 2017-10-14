<%-- 
    Document   : eBooksStoreOrdersByRating
    Created on : Oct 14, 2017, 6:52:46 AM
    Author     : Rob C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electronic Books Store Orders by Rating</title>
        <link rel="stylesheet" type="text/css" href=".\\css\\ebookstore.css">
    </head>
    <body>
        <%-- test if actual user is authenticated and authorized --%>
        <c:choose>
            <c:when test="${validUser == true}">   
                <!-- include menu -->
                <%@ include file="./utils/eBooksStoreMenu.jsp" %>
                <%-- Master view --%>                        
                <sql:setDataSource 
                    var="snapshot" 
                    driver="org.apache.derby.jdbc.ClientDriver40"
                    url="jdbc:derby://localhost:1527/ebooksstore;create=true;"
                    user="test"  
                    password="test"/>
                <sql:query dataSource="${snapshot}" var="result">
                    SELECT 
                    EBOOKS.EBOOKS.ISBN, EBOOKS.EBOOKS.DENUMIRE, EBOOKS.BOOK_AUTHOR.FIRST_NAME, EBOOKS.BOOK_AUTHOR.FAMILY_NAME,EBOOKS.BOOK_GENRES.GENRE,EBOOKS.RATINGS.RATING, EBOOKS.USERS.NAME 
                    FROM 
                    EBOOKS.EBOOKS, 
                    EBOOKS.BOOK_AUTHOR,
                    EBOOKS.EBOOKS_AUTHORS,
                    EBOOKS.BOOK_GENRES,
                    EBOOKS.RATINGS,
                    EBOOKS.EBOOKS_RATINGS_USERS,
                    EBOOKS.USERS
                    WHERE 
                    EBOOKS.EBOOKS.ISBN = EBOOKS.EBOOKS_AUTHORS.ID_ISBN AND
                    EBOOKS.EBOOKS_AUTHORS.ID_SSN = EBOOKS.BOOK_AUTHOR.SSN AND                              
                    EBOOKS.EBOOKS.ID_GENRE = EBOOKS.BOOK_GENRES.ID AND
                    EBOOKS.EBOOKS.ISBN = EBOOKS.EBOOKS_RATINGS_USERS.ID_ISBN AND
                    EBOOKS.EBOOKS_RATINGS_USERS.ID_RATING = EBOOKS.RATINGS.ID AND
                    EBOOKS.EBOOKS_RATINGS_USERS.ID_SSN = EBOOKS.USERS.SSN
                    ORDER BY RATING DESC
                </sql:query>                        
                <h1>List the books from Electronic Books Store by Rating</h1>                         
                <table border="1" width="100%">
                    <tr>                             
                        <th width="14%" class="thc">ISBN</th>   
                        <th width="14%" class="thc">TITLE</th>  
                        <th width="14%" class="thc">AUTHOR</th>
                        <th width="14%" class="thc">GENRE</th>
                        <th width="14%" class="thc">RATING</th>
                        <th width="14%" class="thc">USER</th>
                    </tr>                        
                    <c:forEach var="row" varStatus="loop" items="${result.rows}">
                        <tr>
                            <td width="14%" class="tdc"><c:out value="${row.isbn}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.denumire}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.first_name}"/>&nbsp<c:out value="${row.family_name}"/> </td>
                            <td width="14%" class="tdc"><c:out value="${row.genre}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.rating}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.name}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <c:redirect url="./index.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>
