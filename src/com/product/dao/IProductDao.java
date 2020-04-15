package com.product.dao;

import java.util.List;

import com.product.model.Order;
import com.product.model.Product;

public interface IProductDao {

	Integer addProduct(Product product);

	List<Product> getAllProducts();

	Product updateProduct(Product product);

	Boolean deleteProduct(int id);

	Product getProduct(int id);

	Integer addOrder(Order order);

}
