<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,
	input[type="number"] {
	border: none;
	background: silver;
	height: 50px;
	font-size: 16px;
	padding: 15px;
	width: 60%;
	border-radius: 25px;
	margin-left: 20%;
}

h2, h1 {
	margin-left: 20%;
}

hr {
	width: 60%;
}
</style>
</head>
<body>
	<br>

	<%
	String id = request.getParameter("id");
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("select * from donor where id=?");
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
	%>

	<div class="container">
		<form action="updateDonorAction.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			<h2>Name</h2>
			<input type="text" value="<%=rs.getString(2)%>" name="name">
			<hr>
			<h2>Father Name</h2>
			<input type="text" value="<%=rs.getString(3)%>" name="Father">
			<hr>
			<h2>Mother Name</h2>
			<input type="text" value="<%=rs.getString(4)%>" name="mother">
			<hr>
			<h2>Mobile no.</h2>
			<input type="text" value="<%=rs.getString(5)%>" name="mobilenumber">
			<hr>
			<h2>Email</h2>
			<input type="text" value="<%=rs.getString(6)%>" name="email">
			<hr>
			<h2>Address</h2>
			<input type="text" value="<%=rs.getString(9)%>" name="address">
			<br>
			<center>
				<button type="submit" class="button">Save</button>
			</center>
		</form>
	</div>

	<%
	}
	rs.close();
	ps.close();
	con.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

	<br>
	<br>
	<br>
	<br>

</body>
<footer>
	<h3>
		<center>All Right Reserved @RV Tech :: 2024</center>
	</h3>
</footer>
</html>
