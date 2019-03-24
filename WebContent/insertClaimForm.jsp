<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>INSERT Operation</title>
    </head>
    <body>
        <c:if test="${ empty param.pdate}">
            <c:redirect url="claimForm.jsp" >
                <c:param name="errMsg" value="Please Enter Date of claim!" />
                 <c:param name="pid" value="${param.pid}"/>
                <c:param name="serial_no" value="${param.serial}"/>
            </c:redirect>
        </c:if>
      <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
                           
		
        <sql:query dataSource="${dbsource}" var="count">
            Select * FROM product_claim
            WHERE username='${sessionScope['loginUser']}' and pid=${param.pid} and claim_date='${param.pdate}'
        </sql:query>
        <c:if test="${count.rowCount>0}">
             <c:redirect url="claimForm.jsp" >
                <c:param name="errMsg" value="Claim of same product already exists please check status under My Claims!" />
                <c:param name="pid" value="${param.pid}"/>
                <c:param name="serial_no" value="${param.serial}"/>
            </c:redirect>        
        </c:if> 
        
         <sql:query dataSource="${dbsource}" var="count">
            Select * FROM product_claim
            WHERE username='${sessionScope['loginUser']}' and pid=${param.pid} and serial_no='${param.serial}'
        </sql:query>
        <c:if test="${count.rowCount==3}">
             <c:redirect url="claimForm.jsp" >
                <c:param name="errMsg" value="Error You have been reached to max 3 numbers of Claim!" />
                <c:param name="pid" value="${param.pid}"/>
                <c:param name="serial_no" value="${param.serial}"/>
            </c:redirect>        
        </c:if> 
        
<%--         <sql:query dataSource="${dbsource}" var="result">
            select purchase_date  from registered_product
			where serialno = '${param.serial}';
        </sql:query>
		<%
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/project_part1", DbConfig.username, DbConfig.password);
			PreparedStatement ps = con.prepareStatement("select purchase_date  from registered_product where serialno = ? ");
			ps.setString(1, request.getParameter("serial"));
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				java.sql.Date purchaseDate = rs.getDate(1);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(purchaseDate);
				calendar.add(Calendar.YEAR, 5);
				java.util.Date pc = calendar.getTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				;
				if (pc.before(sdf.parse(request.getParameter("pdate")))) {
					String pid = request.getParameter("pid");
					String serial_no = request.getParameter("serial");
					String url = "claimForm.jsp?errMsg=Your claim date exceeds the protection plan!&pid=" + pid +"&serial_no=" + serial_no;
/* 					response.sendRedirect(url);
 */					RequestDispatcher dd = request.getRequestDispatcher(url);

					dd.forward(request, response);
				}
			}
		%>
  --%>
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO product_claim(pid, serial_no,claim_date,details,claim_status,username) VALUES (?,?,?,?,?,?);
            <sql:param value="${param.pid}" />
            <sql:param value="${param.serial}" />
            <sql:param value="${param.pdate}" />
            <sql:param value="${param.claim_details}" />
            <sql:param value="0" />
            <sql:param value="${sessionScope['loginUser']}" />
        </sql:update>
        <c:if test="${result>=1}">
            <c:redirect url="listClaims.jsp" >
                <c:param name="susMsg" value="Congratulations ! Claim submitted
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>