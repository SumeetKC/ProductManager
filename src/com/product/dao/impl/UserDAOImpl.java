package com.product.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.product.dao.IUserDAO;
import com.product.model.Order;
import com.product.model.User;

@Repository
public class UserDAOImpl implements IUserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User isUserValid(User user) {

		Session session = sessionFactory.openSession();
		Transaction tx = null;
		User usr = new User();
		try {
			tx = session.beginTransaction();
			usr = (User) session.get(User.class, user.getUserId());
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
	
		return usr;
	}

	@Override
	public Integer addUser(User userToAdd) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		Integer result = null;
		try {
			tx = session.beginTransaction();
			result = (Integer)session.save(userToAdd);
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<User> userList = new ArrayList<User>();
		try {
			tx = session.beginTransaction();
			userList = session.createQuery("from User").list();
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
		return userList;
	}

	@Override
	public User ValidateUser(User userId) {

		Session session = sessionFactory.openSession();
		Transaction tx = null;
		User user = new User();
		try {
			tx = session.beginTransaction();
			user = (User)session.get(User.class, userId.getUserId());
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
		return user;

	}

	@Override
	public User saveForgotPassword(User userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		User user = new User();
		try {
			tx = session.beginTransaction();
			user = (User)session.get(User.class, userId.getUserId());
			user.setPassword(userId.getPassword());
			session.saveOrUpdate(user);
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			
			throw ex;
		} finally {
			session.close();
		}
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> viewOrders(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Order> orders = null;
		try {
			tx = session.beginTransaction();
			orders = session.createQuery("from Order where userId="+id).list();
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			
			throw ex;
		} finally {
			session.close();
		}
		return orders;
	}
	

}
