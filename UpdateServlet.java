package com.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmployeeDao;
import com.entity.Employee;
import com.entity.Hobby;


@WebServlet("/saveUpdate")
public class UpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String[] hobbies = req.getParameterValues("hobbies");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String designation = req.getParameter("designation");

		Employee emp = new Employee();

		emp.setId(id);
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
		dao.updateEmp(emp);
		resp.sendRedirect("index.jsp");
	}
}
