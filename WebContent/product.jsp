<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<%	
	Connection connection = null; 
	try {
		String connectionURL = "jdbc:mysql://localhost:8889/inf124?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		/* if(!connection.isClosed())
			out.println("Successfully connected to " + "MySQL server using TCP/IP..."); */
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
		<jsp:include page="myShoppingCart.jsp"/>
		<h1>Our Products</h1>
		<%
			Statement stmt = connection.createStatement();  
			ResultSet rs = stmt.executeQuery("SELECT * FROM products");  
		
			while (rs.next()) {
				out.println("<div class=\"product\">");
				// out.println("<a href=\"/product-detail.php?id=" + rs.getInt(0) + "\">");
				// out.println(rs.getString(2));
				out.println("<img src=\"" + rs.getString(2) + "\" alt=\"" + rs.getString(2) + "\">");
				out.println("</a>");
				out.println("<h3 class=\"product-title\">" + rs.getString(3) + "</h3>");
				out.println("<p class=\"product-description\">" + rs.getString(4) + "</p>");
				
				// out.println("<a href=\"index.jsp\">Contact Us</a>");
				out.println("</div>");
			}
			
			connection.close();
				
		%>
	</div>
</body>

</html>