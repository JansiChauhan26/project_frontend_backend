<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.entity.Hobby"%>
<%@page import="com.entity.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));

	EmployeeDao dao = new EmployeeDao();

	Employee emp = dao.getEmployee(id);

	List<String> hob = new ArrayList<>();
	for (Hobby h : emp.getHobbies()) {
		hob.add(h.getName());
	}
	%>
	<form action="saveUpdate?id=<%=emp.getId()%>" method="post">
		<label for="name">Name : </label> <input value="<%=emp.getName()%>"
			id="name" type="text" name="name"><br> <br> <label
			for="gender">Gender: </label> <input id="male" type="radio"
			name="gender" value="male"
			<%=emp.getGender().equals("male") ? "checked" : ""%>><label
			for="male">Male</label> <input id="female" type="radio" name="gender"
			value="female" <%=emp.getGender().equals("female") ? "checked" : ""%>>
		<label for="female">Female</label><br> <br> 
		<label>Hobbies
			: </label> <input id="chess" type="checkbox" name="hobbies" value="chess"
			<%=hob.contains("chess") ? "checked" : ""%>> <label
			for="chess">Chess</label> <input id="volleyball" type="checkbox"
			name="hobbies" value="volleyball"
			<%=hob.contains("volleyball") ? "checked" : ""%>> <label
			for="volleyball">Volleyball</label> <input id="cricket"
			type="checkbox" name="hobbies" value="cricket"
			<%=hob.contains("cricket") ? "checked" : ""%>> <label
			for="cricket">Cricket</label> <br> <br> <label for="date">DOB
			: </label> <input value="<%=emp.getDate()%>" id="date" type="date" name="dob">
		<br> <br> <label for="address">Address : </label>
		<textarea rows="3" cols="30" name="address" id="address"><%=emp.getAddress()%></textarea>

		<br> <br> <label for="desig">Designation</label> <select
			id="desig" name="designation">
			<option value="">Select Designation</option>
			<option value="HR"
				<%=emp.getDesignation().equals("HR") ? "selected" : ""%>>HR</option>
			<option value="SR"
				<%=emp.getDesignation().equals("SR") ? "selected" : ""%>>SR</option>
			<option value="DR"
				<%=emp.getDesignation().equals("DR") ? "selected" : ""%>>DR</option>
		</select><br> <br>
		<button type="submit">Update</button>
	</form>
</body>
</html>