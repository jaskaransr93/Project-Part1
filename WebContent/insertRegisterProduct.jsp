<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>JINSERT Product</title>
    </head>
    <body>
        <c:if test="${ empty param.username or empty param.pname}">
            <c:redirect url="registerProductForm.jsp" >
                <c:param name="errMsg" value="Please Enter Username and Product Name!" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
        <sql:query dataSource="${dbsource}" var="count">
            Select * FROM user
            WHERE username='${param.username}'
        </sql:query>
        <c:if test="${count.rowCount<=0}">
             <c:redirect url="registerProductForm.jsp" >
                <c:param name="errMsg" value="Username not exists!" />
            </c:redirect>        
        </c:if>
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO registered_product(serialno, product_name,username,purchase_date) VALUES (?,?,?,?);
            <sql:param value="${param.serial}" />
            <sql:param value="${param.pname}" />
            <sql:param value="${param.username}" />
            <sql:param value="${param.pdate}" />
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="registerProductForm.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>