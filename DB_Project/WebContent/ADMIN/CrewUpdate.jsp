<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>CrewUpdate</title>
	</head>
		<center> 
			<form action="../LOGIN/Logout.jsp" method="post">
				<table>
					<tr>
						<td><input type="button" value="뒤로가기" onclick="GoBack()"/></td>
			 			<td><input type="submit" value="로그아웃"></td>
			 		</tr>
			 	</table> 
			</form> 
		</center> 
	<body> 
	<div style="border: 0px solid red; float: left; width: 50%;">
	<center>
	<h2>조회결과</h2>  
	<%
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("Select * From Crew");
		
		String crewId = null;
		String userId = null;
		String spaceshipId = null;
		String position = null;
		String role = null;
	%>
		<table border = "1">
			<tr>
				<td>선원ID</td>
				<td>사용자ID</td>
				<td>우주선ID</td>
				<td>직위</td>
				<td>역할</td>					
			</tr>
		
	<%
		while(rs.next())
		{
			crewId = rs.getString("crewId");//테이블 어트리뷰트
			userId = rs.getString("userId");
			spaceshipId = rs.getString("spaceshipId");
			position = rs.getString("position");
			role = rs.getString("role");

			out.print("<tr>");
			out.print("<td>"+ crewId +"</td>");
			out.print("<td>"+ userId +"</td>");
			out.print("<td>"+ spaceshipId +"</td>");
			out.print("<td>"+ position +"</td>");
			out.print("<td>"+ role +"</td>");
			out.print("</tr>");
		}
	%>
		</table>
		<br>
		</center>
	</div>	
	<%
		stmt.close();
		con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	
	
	<div style="border: 0px solid red; float: right; width: 50%;">	
		<center>
			<h2>선원 수정</h2>  
			<form action="CrewUpdateInput.jsp" method="post">
				<table>
					<tr>
						<td>사용자ID</td>
						<td><input type="text" name="userId" /></td>
					</tr>
					<tr>
					<td></td>
					<td align="right">
					<input type="submit" name="submit" value="조회하기"/>
					</td>
					</tr>
				</table>
			</form>
		</center>
		</div>
	</body>
</html>

<script type="text/javascript">
	function GoBack(){
		location.href="../POSITIONS/Admin.jsp";
	}
	function Logout(){
		location.href="../LOGIN/Login.jsp";
	}
</script>