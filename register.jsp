<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="registration" method="post">
		<label for="name">Name : </label> <input id="name" type="text"
			name="name"><br> <br> <label for="gender">Gender
			: </label> <input id="male" type="radio" name="gender" value="male">
		<label for="male">Male</label> <input id="female" type="radio"
			name="gender" value="female"> <label for="female">Female</label><br>
		<br> <label>Hobbies : </label> <input id="chess" type="checkbox"
			name="hobbies" value="chess"> <label for="chess">Chess</label>
		<input id="volleyball" type="checkbox" name="hobbies"
			value="volleyball"> <label for="volleyball">Volleyball</label>
		<input id="cricket" type="checkbox" name="hobbies" value="cricket">
		<label for="cricket">Cricket</label> <br> <br> <label
			for="date">DOB : </label> <input id="date" type="date" name="dob">
		<br> <br> <label for="address">Address : </label>
		<textarea rows="3" cols="30" name="address" id="address"></textarea>
		<br> <br> <label for="desig">Designation</label> <select
			id="desig" name="designation">
			<option value="">Select Designation</option>
			<option value="HR">HR</option>
			<option value="SR">SR</option>
			<option value="DR">DR</option>
		</select><br> <br>
		<button type="submit">Submit</button>
	</form>
</body>
</html>