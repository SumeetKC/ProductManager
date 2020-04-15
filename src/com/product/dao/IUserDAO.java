package com.product.dao;

import java.util.List;

import com.product.model.Order;
import com.product.model.User;

public interface IUserDAO {

	public User isUserValid(User user);

	public User ValidateUser(User user);

	public User saveForgotPassword(User user);

	public Integer addUser(User userToAdd);

	public List<User> getAllUsers();

	public List<Order> viewOrders(int id);  
}
