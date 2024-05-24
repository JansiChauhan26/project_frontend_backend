<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.entity.Hobby"%>
<%@page import="com.entity.Employee"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="register.jsp"><button>Add Employee</button></a>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Hobbies</th>
			<th>DOB</th>
			<th>Designation</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
		<%
		EmployeeDao dao = new EmployeeDao();
		List<Employee> employees = dao.getAllEmployee();
		for (Employee emp : employees) {
		%>
		<tr>
			<td><%=emp.getId()%></td>
			<td><%=emp.getName()%></td>
			<td><%=emp.getGender()%></td>
			<td><ul>
					<%
					for (Hobby hoby : emp.getHobbies()) {
					%>
					<li><%=hoby.getName()%></li>
					<%
					}
					%>
				</ul></td>
			<td><%=emp.getDate()%></td>
			<td><%=emp.getDesignation()%></td>
			<td><%=emp.getAddress()%></td>

			<td><a href="update.jsp?id=<%=emp.getId()%>"><button>Update</button></a>
				<a href="delete?id=<%=emp.getId()%>"><button>Delete</button></a></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>