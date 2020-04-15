package com.product.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.product.dao.IProductDao;
import com.product.model.Order;
import com.product.model.Product;

@Repository
public class ProductDaoImpl implements IProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Boolean deleteProduct(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Product prdct = (Product) session.get(Product.class, id);
			if (prdct != null) {
				session.delete(prdct);
				tx.commit();
				return true;
			}

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Integer addProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		Integer result = null;
		try {
			tx = session.beginTransaction();
			result = (Integer) session.save(product);
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
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<Product> productList = new ArrayList<Product>();
		try {
			tx = session.beginTransaction();
			productList = session.createQuery("from Product").list();
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
		return productList;

	}

	@Override
	public Product updateProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(product);
			tx.commit();

		} catch (Exception ex) {
			if (tx != null)
				tx.rollback();
			throw ex;
		} finally {
			session.close();
		}
		return product;
	}

	@Override
	public Product getProduct(int id) {
		// TODO Auto-generated method stub
		// JDBC driver name and database URL
		   String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		   String DB_URL = "jdbc:mysql://localhost:3306/prdctmgr";
		   String USER = "root";
		   String PASS = "root";
		   Connection conn = null;
		   Statement stmt = null;
		   Product product = new Product();
		try {
			 Class.forName(JDBC_DRIVER);
			 conn = DriverManager.getConnection(DB_URL, USER, PASS);
			 stmt = conn.createStatement();
			 String sql = "SELECT productId, name, description, category, cost from product where productId="+id;
		     ResultSet rs = stmt.executeQuery(sql);
		     while(rs.next()){
		         //Retrieve by column name
		         product.setProductId(rs.getInt("productId"));
		         product.setName(rs.getString("name"));
		         product.setDescription(rs.getString("description"));
		         product.setCategory(rs.getString("category"));
		         product.setCost(rs.getString("cost"));
		      }
		      rs.close();

		} catch (Exception ex) {
			 ex.printStackTrace();
		} finally {
			try{
		         if(stmt!=null)
		            conn.close();
		      }catch(SQLException se){
		      }
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		}
		return product;
	}
	
	@Override
	public Integer addOrder(Order order) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		Integer result = null;
		try {
			tx = session.beginTransaction();
			result = (Integer) session.save(order);
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

}
