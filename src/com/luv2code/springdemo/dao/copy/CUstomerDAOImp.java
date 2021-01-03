package com.luv2code.springdemo.dao.copy;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CUstomerDAOImp implements CustomerDAO {
	
	//Need inject session factory
	@Autowired
	private SessionFactory sessionFactory;//from hibernate
	@Override
	public List<Customer> getCUstomers() {
		// TODO Auto-generated method stub
		//get the current hibernate session
		Session currentSession= sessionFactory.getCurrentSession();
		//create a query
		Query<Customer> theQuery=currentSession.createQuery("from Customer "+
		"order by lastName",Customer.class);
		//execute query and get result list
		List<Customer> customers=theQuery.getResultList();
		//return the results
		return customers;
	}
	@Override
	public void saveCustomer(Customer theCustomer) {
		Session currentSession= sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theCustomer);//save if never added, update otherwise
		
		
	}
	@Override
	public Customer getCUstomer(int theId) {
		//get the current hibernate session
				Session currentSession= sessionFactory.getCurrentSession();
				//create a query
				return currentSession.get(Customer.class, theId);//get the obj
				//return the results
	}

}
