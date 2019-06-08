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
    <title>My Shopping Cart</title>
    <link rel="stylesheet" href="styles/product.css">
    <link rel="stylesheet" href="styles/general.css">
</head>

<body>

    <h1>[My Shopping Cart]</h1>
    
    	<%
			Statement stmt = connection.createStatement();  
			ResultSet rs = stmt.executeQuery("SELECT * FROM orders");  
			
			while (rs.next()) {
				continue;
			}
			
			connection.close();
		%>
</body>

</html>