<%-- 
    Document   : index
    Created on : 19 Apr, 2021, 4:55:19 PM
    Author     : shelc
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  

<!DOCTYPE html>

<html>

    <head>
        <link rel="stylesheet" href="calc.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP </title>

    </head>

    <body>
      
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blanchedalmond">
                <div>
                    <a href="https://www.javaguides.net" class="navbar-brand"> Book Inventory App </a>
                </div>

            </nav>
        </header>
        <br>
        <div class="card4">

            <br>
            <div class="card1">
                <br>
                <form action="BookServlet" method="POST">
                    <h1>Book List !</h1>
                    <sql:setDataSource
                        var="APP"
                        driver="org.apache.derby.jdbc.ClientDriver"
                        url="jdbc:derby://localhost:1527/sun-appserv-samples"
                        user="app" password="app"
                        />

                    <sql:query var="listUsers"   dataSource="${APP}">
                        SELECT * FROM booknewauth
                    </sql:query>

                    <div align="center">
                        <table border="1" cellpadding="5">
                            <caption><h2>List of Books</h2></caption>
                            <tr>
                                <th>Book Serial Number</th>
                                <th>Book Name</th>
                                <th>Book Author</th>
                                <th>Book Price</th>
                                <th> Edit </th>
                                <th> Enter ID</th>
                            </tr>
                            <c:forEach var="user" items="${listUsers.rows}">
                                <tr>
                                    <td><c:out value="${user.id}" /></td>
                                    <td><c:out value="${user.book}" /></td>
                                    <td><c:out value="${user.author}" /></td>
                                    <td><c:out value="${user.price}" /></td>

                                    <td> <a href="edit?id=<c:out value='${book.serialNumber}' />">Edit Details</a></td>
                                    <td>  <form action="RemoveServlet" method="POST">

                                            Id:-<input type="text" name="id" value="" size="5" /><br>

                                            <input type="submit" value="Delete" name="delete" /><br>
                                            <br>
                                        </form>
                                    </td>

                                </tr>
                            </c:forEach>

                            <br>
                        </table>
                    </div>
                    <br>
                </form>
            </div>
            <br>
            <br>
            <div class="card1">
                <br>
                <h2>Add New Book!</h2>

                <form action="BookServlet" method="POST">

                    Book name:-<input type="text" name="book" value="" size="30" /><br>

                    Book Author-<input type="text" name="author" value="" size="30" /><br>

                    Price-<input type="text" name="price" value="" size="30" /><br>

                    <input type="submit" value="Add Book" name="add" /><br>
                    <br>
                </form>
            </div>
            <br>
            <div class="card1">
                <h2>List all Books</h2>
                <form action="ListServlet" method="POST">

                    <input type="submit" value="display Books" name="display" /><br>
                    <br>
                </form>
            </div>
            <br>
            <div class="card1">
                <h2>Delete Book</h2>
                <form action="RemoveServlet" method="POST">

                    Enter Book Id:-<input type="text" name="id" value="" size="20" /><br>

                    <input type="submit" value="Delete" name="delete" /><br>
                    <br>
                </form>
            </div>
                        <br>
            <div class="card1">
                <h2>Search Book</h2>
                <form action="SearchServlet" method="POST">

                    Enter Book Id:-<input type="text" name="id" value="" size="20" /><br>

                    <input type="submit" value="Search" name="delete" /><br>
                    <br>
                </form>
            </div>
            <br>
        </div>

    </body>
</html>
