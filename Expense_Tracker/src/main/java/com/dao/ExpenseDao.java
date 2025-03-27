package com.dao;

import java.lang.classfile.instruction.ReturnInstruction;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.enitity.Expense;
import com.enitity.User;

public class ExpenseDao {

	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;

	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;

	}

	public boolean saveExpense(Expense ex) {
		boolean f = false;
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			session.save(ex);
			tx.commit();
			f = true;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		return f;
	}

	public List<Expense> getAllExpenseByUser(User user) {
		List<Expense> list = new ArrayList<>();
		try (Session session = factory.openSession()) {
			Query<Expense> q = session.createQuery("FROM Expense WHERE user.id = :userId", Expense.class); // Use
																											// user.id
			q.setParameter("userId", user.getId()); // Pass user id
			list = q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Expense getExpenseById(int id) {

		Expense ex = null;
		try {
			session = factory.openSession();
			Query q = session.createQuery("from Expense where id=:id");

			q.setParameter("id", id);
			ex = (Expense) q.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ex;

	}

	public boolean updateExpense(Expense ex) {
		boolean f = false;
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			session.saveOrUpdate(ex);

			tx.commit();
			f = true;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteExpense(int id) {
		
		boolean f=false;
		
		try {
			session =factory.openSession();
			tx = session.beginTransaction();
			
			Expense ex=session.get(Expense.class,id);
			
			session.delete(ex);
			
			tx.commit();
			f= true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
