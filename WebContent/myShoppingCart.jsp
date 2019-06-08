<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="com.ecommerce.db.DatabaseConnector" %> 

<!DOCTYPE html>


<html>

<head>
    <meta charset="UTF-8">
    <title>My Shopping Cart</title>
    <link rel="stylesheet" href="styles/product.css">
    <link rel="stylesheet" href="styles/general.css">
</head>

<body>

    <h1>[My Shopping Cart]</h1>
    
	<%
		Connection connection = DatabaseConnector.getConnection();
		if(connection != null){
			Statement stmt = connection.createStatement();  
			ResultSet rs = stmt.executeQuery("SELECT * FROM orders");  
			
			while (rs.next()) {
				out.println("<h4 class=\"product-title\">" + rs.getString(2) + "</h3>");
			}
		}
	%>

    <form action="../INF124_PA4/v1/api/products" method = "POST">
        The product name that you want to purchase:
        <input id = "name" name="name" ></input>
        <br/>
        <input type="submit" value="Add to Cart">
    </form>

</body>

</html>