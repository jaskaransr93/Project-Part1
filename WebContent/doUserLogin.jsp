<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>JINSERT Product</title>
    </head>
    <body>
        <c:if test="${ empty param.username or empty param.upassword}">
            <c:redirect url="userLoginForm.jsp" >
                <c:param name="errMsg" value="Please Enter Username and Password!" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
        <sql:query dataSource="${dbsource}" var="count">
            Select * FROM user
            WHERE username='${param.username}'
            and upassword='${param.upassword}'
        </sql:query>
        <c:if test="${count.rowCount>0}">
        
         <c:set scope="session"
                   var="loginUser"
                   value="${param.username}"/>
             <c:redirect url="dashboardUser.jsp" />
        </c:if>
        <c:if test="${count.rowCount<=0}">
             <c:redirect url="userLoginForm.jsp" >
                <c:param name="errMsg" value="Invalid Username and Password!" />
            </c:redirect>        
        </c:if>
 
    </body>
</html>