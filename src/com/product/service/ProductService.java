package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.dao.IProductDao;
import com.product.model.Order;
import com.product.model.Product;
@Service
public class ProductService {
	
	@Autowired
	private IProductDao iProductDAO;
	
	public Boolean addProduct(Product product) {
		Integer result = iProductDAO.addProduct(product);
		if (result != 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<Product> viewProducts() {

		return iProductDAO.getAllProducts();
	}
	
	public Boolean updateProduct(Product product) {
		Product prdct = iProductDAO.updateProduct(product);
		if (prdct != null) {
			return true;
		} else {
			return false;
		}
	}

	public Boolean deleteProduct(int id) {
		// TODO Auto-generated method stub
		return iProductDAO.deleteProduct(id);
	}

	public Product getProduct(int id) {
		// TODO Auto-generated method stub
		return iProductDAO.getProduct(id);
	}

	public Boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		Integer result = iProductDAO.addOrder(order);
		if (result != 0) {
			return true;
		} else {
			return false;
		}
	}
	
}
