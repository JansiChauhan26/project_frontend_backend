package com.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmployeeDao;
import com.entity.Employee;
import com.entity.Hobby;

@WebServlet("/registration")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String[] hobbies = req.getParameterValues("hobbies");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String designation = req.getParameter("designation");

		Employee emp = new Employee();

		emp.setName(name);
		emp.setGender(gender);
		emp.setDate(Date.valueOf(dob));
		emp.setAddress(address);
		emp.setDesignation(designation);
		List<Hobby> hoby = new ArrayList<Hobby>();

		for (String h : hobbies) {
			Hobby h1 = new Hobby();
			h1.setName(h);
			hoby.add(h1);
		}
		emp.setHobbies(hoby);

		EmployeeDao dao = new EmployeeDao();
		dao.createEmployee(emp);

		resp.sendRedirect("index.jsp");

//		if (dao.saveEmployee(emp)) {
//			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
//			rd.forward(req, resp);
//		} else {
//			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
//			rd.forward(req, resp);
//		}
	}
}
