<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<%	
	try {
		String connectionURL = "jdbc:mysql://localhost:8889/inf124?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		if(!connection.isClosed())
			out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		connection.close();
	}catch(Exception ex){
		out.println("Unable to connect to database"+ex);
	}
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Product</title>
	<jsp:include page="header.jsp"/>
	<link rel="stylesheet" href="styles/product.css">
	<link rel="stylesheet" href="styles/general.css">
</head>
<body>
	<div id="products">
		<h1>Our Products</h1>
		<!-- dynamic product listing code here -->
	</div>
</body>
</html>