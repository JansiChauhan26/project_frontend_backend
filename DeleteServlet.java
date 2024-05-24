package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmployeeDao;
import com.entity.Employee;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

		EmployeeDao dao = new EmployeeDao();

		Employee emp = dao.getEmployee(id);

		if (emp != null) {
			dao.deleteEmp(emp);
			resp.sendRedirect("index.jsp");
		} else {
			resp.sendRedirect("index.jsp");
		}
	}
}
