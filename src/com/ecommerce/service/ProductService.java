package com.ecommerce.service;

import com.ecommerce.model.Product;
import com.ecommerce.db.*;
import java.sql.*;

public class ProductService {

	public static Product getProductById(int id) {
		System.out.println("GetProductById" + id);
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
