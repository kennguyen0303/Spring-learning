package com.luv2code.springdemo.dao.copy;

import java.util.List;

import com.luv2code.springdemo.entity.Customer;

public interface CustomerDAO {

	public List<Customer> getCUstomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCUstomer(int theId);
}
