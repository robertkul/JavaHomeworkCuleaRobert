<%-- 
    Document   : eBooksStoreAdminEBooks
    Created on : Nov 19, 2016, 7:36:42 PM
    Author     : gheor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eBooksStore Management </title>
        <link rel="stylesheet" type="text/css" href=".\\css\\ebookstore.css">
    </head>

    <%-- test if actual user is authenticated and authorized --%>
    <c:choose>
        <c:when test="${validUser == true}">   
            <!-- include menu -->
            <%@ include file="./utils/eBooksStoreMenu.jsp" %>
            <%-- Master view --%>
            <form action="${pageContext.request.contextPath}/eBooksStoreAdminEBooks" method="POST">
                <sql:setDataSource 
                    var="snapshot" 
                    driver="org.apache.derby.jdbc.ClientDriver40"
                    url="jdbc:derby://localhost:1527/ebooksstore;create=true;"
                    user="test"  
                    password="test"/>
                <sql:query dataSource="${snapshot}" var="result">
                    SELECT EBOOKS.EBOOKS.ISBN, EBOOKS.EBOOKS.DENUMIRE,EBOOKS.BOOK_TYPES.TYPE, EBOOKS.BOOK_PAPER_QUALITIES.QUALITY, EBOOKS.EBOOKS.PAGES, EBOOKS.BOOK_GENRES.GENRE, EBOOKS.EBOOKS.PRET 
                    FROM EBOOKS.EBOOKS,                       
                    EBOOKS.BOOK_TYPES,
                    EBOOKS.BOOK_PAPER_QUALITIES,
                    EBOOKS.BOOK_GENRES
                    WHERE EBOOKS.EBOOKS.ID_TYPE = EBOOKS.BOOK_TYPES.ID AND                      
                    EBOOKS.EBOOKS.ID_QUALITY = EBOOKS.BOOK_PAPER_QUALITIES.ID AND
                    EBOOKS.EBOOKS.ID_GENRE = EBOOKS.BOOK_GENRES.ID                        
                </sql:query>                        
                <h1>Manage the books from Electronic Books Store</h1>                         
                <table border="1" width="100%">
                    <tr>
                        <th width="4%" class="thc"> select </th>   
                        <th width="14%" class="thc">ISBN</th>   
                        <th width="14%" class="thc">TITLE</th>                            
                        <th width="14%" class="thc">TYPE</th>
                        <th width="14%" class="thc">QUALITY</th>
                        <th width="14%" class="thc">PAGES</th>
                        <th width="14%" class="thc">GENRE</th>
                        <th width="14%" class="thc">PRICE</th>
                    </tr>                        
                    <c:forEach var="row" varStatus="loop" items="${result.rows}">
                        <tr>
                            <td width="4%" class="tdc"><input type="checkbox" name="admin_ebooks_checkbox" value="${row.isbn}"></td>
                            <td width="14%" class="tdc"><c:out value="${row.isbn}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.denumire}"/></td>                      
                            <td width="14%" class="tdc"><c:out value="${row.type}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.quality}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.pages}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.genre}"/></td>
                            <td width="14%" class="tdc"><c:out value="${row.pret}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <%-- Details --%>
                <sql:query dataSource="${snapshot}" var="resulttypes">
                    SELECT * FROM EBOOKS.BOOK_TYPES ORDER BY TYPE ASC 
                </sql:query>
                <sql:query dataSource="${snapshot}" var="resultqualities">
                    SELECT * FROM EBOOKS.BOOK_PAPER_QUALITIES ORDER BY QUALITY ASC 
                </sql:query>
                <sql:query dataSource="${snapshot}" var="resultgenres">
                    SELECT * FROM EBOOKS.BOOK_GENRES ORDER BY GENRE ASC 
                </sql:query>
                <table class="tablecenterdwithborder">
                    <tr>
                        <td>    
                            <table>
                                <tr>
                                    <td> ISBN: </td>
                                    <td> <input type="text" name="admin_ebooks_isbn"></input></td>
                                </tr>                                        
                                <tr>
                                    <td> TITLE: </td>
                                    <td> <input type="text" name="admin_ebooks_title"></input></td>
                                </tr>                                
                                <tr>
                                    <td> TYPE: </td>
                                    <td>
                                        <select name="admin_ebooks_type" required="true">
                                            <c:forEach var="rowtype" items="${resulttypes.rows}">    
                                                <option name="admin_ebooks_types" value="${rowtype.id}">${rowtype.type}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>  
                                <tr>
                                    <td> QUALITY: </td>
                                    <td>
                                        <select name="admin_ebooks_quality" required="true">
                                            <c:forEach var="rowquality" items="${resultqualities.rows}">    
                                                <option name="admin_ebooks_qualities" value="${rowquality.id}">${rowquality.quality}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr> 
                                <tr>
                                    <td> PAGES: </td>
                                    <td> <input type="text" name="admin_ebooks_pages"></input></td>
                                </tr>
                                <tr>
                                    <td> GENRE: </td>
                                    <td>
                                        <select name="admin_ebooks_genre" required="true">
                                            <c:forEach var="rowgenre" items="${resultgenres.rows}">    
                                                <option name="admin_ebooks_genres" value="${rowgenre.id}">${rowgenre.genre}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr> 
                                <tr>
                                    <td> PRICE: </td>
                                    <td> <input type="text" name="admin_ebooks_price"></input></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%-- buttons --%>
                            <table>
                                <tr>
                                    <td class="tdc"><input type="submit" class="ebooksstorebutton" name="admin_ebooks_insert" value="Insert"></td> 
                                    <td class="tdc"><input type="submit" class="ebooksstorebutton" name="admin_ebooks_update" value="Update"></td>
                                    <td class="tdc"><input type="submit" class="ebooksstorebutton" name="admin_ebooks_delete" value="Delete"></td> 
                                    <td class="tdc"><input type="submit" class="ebooksstorebutton" name="admin_ebooks_cancel" value="Cancel"></td>
                                </tr>  
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
        </c:when>
        <c:otherwise>
            <c:redirect url="./index.jsp"></c:redirect>
        </c:otherwise>
    </c:choose>

</html>

