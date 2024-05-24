package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.entity.Employee;


public class EmployeeDao {
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jansi");
	private EntityManager em = emf.createEntityManager();
	private EntityTransaction et = em.getTransaction();

	public void createEmployee(Employee e) {
		et.begin();
		em.persist(e);
		et.commit();
	}

	public List<Employee> getAllEmployee() {
		Query q = em.createQuery("SELECT e FROM Employee e");
		List<Employee> emp = q.getResultList();

		if (emp.isEmpty()) {
			return new ArrayList<Employee>();
		}
		return emp;
	}

	public Employee getEmployee(int id) {
		return em.find(Employee.class, id);
	}

	public void deleteEmp(Employee e) {
		et.begin();
		em.remove(e);
		et.commit();
	}

	public void updateEmp(Employee e) {
		et.begin();
		em.merge(e);
		et.commit();
	}
}
