<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>JINSERT Product</title>
    </head>
    <body>
        <c:if test="${ empty param.p_id or empty param.pdate or empty param.serial}">
            <c:redirect url="registerProductForm.jsp" >
                <c:param name="errMsg" value="Product name, purshase date and serial no reqiured!" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
        <sql:query dataSource="${dbsource}" var="count">
            Select * FROM registered_product
            WHERE username='${sessionScope['loginUser']}' and pid=${param.p_id}
        </sql:query>
        <c:if test="${count.rowCount>0}">
             <c:redirect url="registerProductForm.jsp" >
                <c:param name="errMsg" value="Error Product already registered!" />
            </c:redirect>        
        </c:if>
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO registered_product(serialno, pid,username,purchase_date) VALUES (?,?,?,?);
            <sql:param value="${param.serial}" />
            <sql:param value="${param.p_id}" />
            <sql:param value="${sessionScope['loginUser']}" />
            <sql:param value="${param.pdate}" />
        </sql:update>
        <c:if test="${result>=1}">
            <c:redirect url="ListRegisteredProducts.jsp" >
                <c:param name="susMsg" value="Congratulations ! Product Registered 
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>