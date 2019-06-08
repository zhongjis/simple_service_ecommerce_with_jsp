<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="com.ecommerce.db.DatabaseConnector" %> 
<!DOCTYPE html>


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
			Connection connection = DatabaseConnector.getConnection();
			if(connection != null){
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
					out.println("<a href=\"v1/api/products/" + rs.getString(1) + "\">More Detail</a>");
					// out.println("<a href=\"index.jsp\">Contact Us</a>");
					out.println("</div>");
				}
			}
				
		%>
	</div>
</body>

</html>