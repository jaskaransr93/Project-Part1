<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 
         <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from product where product_name=?;
            <sql:param value="${param.product_name}" />
        </sql:query>
        <form action="updateProductdb.jsp" method="post">
            <table>
                <caption>Update Product</caption>
                <tr>
                    <th>Product Name</th>
                    <th>color</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                    
                       	<td><c:out value="${row.product_name}" /></td>
                       	<input type="hidden" value="${param.product_name}" name="product_name"/>
                        <td><input type="text" value="${row.color}" name="color"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="index.jsp">Go Home</a>
        </form>
    </body>
</html>