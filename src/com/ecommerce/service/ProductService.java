package com.ecommerce.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.db.DatabaseConnector;
import com.ecommerce.db.DatabaseUtils;
import com.ecommerce.model.Product;

public class ProductService {

	public static Product getProductById(int id) {
        Connection connection = DatabaseConnector.getConnection();
        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, "SELECT * FROM products WHERE id = " + id);
        
        if (resultSet != null) {
            try {
                while (resultSet.next()) {
                	Product p = new Product();
                	
                	p.setId(resultSet.getInt("id"));
                	p.setName(resultSet.getString("name"));
                	p.setBrief_description(resultSet.getString("brief_description"));
                	p.setDetail_description(resultSet.getString("detail_description"));
                	p.setImg_dir(resultSet.getString("img_dir"));
                	return p;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {

                    // We will always close the connection once we are done interacting with the Database.
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
	}
	
	public static boolean addProductToCart(Product p) {
		String sql = "INSERT INTO orders (name)" +"VALUES (?)";
        Connection connection = DatabaseConnector.getConnection();
        return DatabaseUtils.performDBUpdate(connection, sql, p.getName());
	}
	
	public static boolean updateCart(Product p) {
		System.out.println("update cart  " );

		return true;
	}
}
