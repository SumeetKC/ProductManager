package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.dao.IUserDAO;
import com.product.model.Order;
import com.product.model.User;

@Service
public class UserService {

	@Autowired
	private IUserDAO iUserDAO;

	public User isUserValid(User user) {
		return iUserDAO.isUserValid(user);
	}

	public Boolean addUser(User userToAdd) {
		Integer result = iUserDAO.addUser(userToAdd);
		if (result != 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<User> getAllUsers() {

		return iUserDAO.getAllUsers();
	}

	public User validateUser(User user) {
		return iUserDAO.ValidateUser(user);
		
	}

	public User saveForgotPassword(User user) {
		User result = iUserDAO.saveForgotPassword(user);
		return result;
	}

	public List<Order> viewOrders(int id) {
		// TODO Auto-generated method stub
		return iUserDAO.viewOrders(id);
	}


}
