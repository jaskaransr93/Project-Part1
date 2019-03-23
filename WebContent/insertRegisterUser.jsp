<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>JINSERT Operation</title>
    </head>
    <body>
        <c:if test="${ empty param.username or empty param.upassword or empty param.email }">
            <c:redirect url="registerUserForm.jsp" >
                <c:param name="errMsg" value="Please Enter Username and Password!" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
        <sql:query dataSource="${dbsource}" var="count">
            Select * FROM user
            WHERE username='${param.username}'
        </sql:query>
        <c:if test="${count.rowCount>0}">
             <c:redirect url="registerUserForm.jsp" >
                <c:param name="errMsg" value="Username already exists!" />
            </c:redirect>        
        </c:if>
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO user(username, upassword,cellno,email,uname,address ) VALUES (?,?,?,?,?,?);
            <sql:param value="${param.username}" />
            <sql:param value="${param.upassword}" />
            <sql:param value="${param.cell}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.uname}" />
            <sql:param value="${param.address}" />
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="registerUserForm.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>