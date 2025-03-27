package com.dao;


import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.enitity.User;

public class UserDao {

	private SessionFactory factory;
	private Session session = null;
	private Transaction tx = null;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveuser(User user) {
		boolean f = false;

		try {
			session = factory.openSession();
			tx = session.beginTransaction();

			session.save(user);
			tx.commit();
			f = true;

		} catch (Exception e) {
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}

		}
		return f;

	}

	public User login(String email, String password) {
	    User u = null;

	    session = factory.openSession();

	    Query<User> q = session.createQuery("from User where email=:em and password=:ps", User.class);
	    
	    q.setParameter("em", email);
	    q.setParameter("ps", password);
	     
	    u = q.uniqueResult();
	    
	    return u;
	}

	
	
	
	
}


