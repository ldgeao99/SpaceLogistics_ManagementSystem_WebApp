<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>CargoOwnerRegister</title>
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
	
	<center>
	<h2>조회결과</h2>  
	<%
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("Select * From Users");
		
		String userId = null;
		String userPw = null;
		String authority = null;
		String name = null;
		String telephone = null;
		
	%>
		<table border = "1">
			<tr>
				<td>사용자ID</td>
				<td>사용자PW</td>
				<td>권한</td>
				<td>이름</td>
				<td>전화</td>			
			</tr>
		
	<%
		while(rs.next())
		{
			userId = rs.getString("userId");//테이블 어트리뷰트
			userPw = rs.getString("userPw");
			authority = rs.getString("authority");
			name = rs.getString("name");
			telephone = rs.getString("telephone");
			out.print("<tr>");
			out.print("<td>"+ userId +"</td>");
			out.print("<td>"+ userPw +"</td>");
			out.print("<td>"+ authority +"</td>");
			out.print("<td>"+ name +"</td>");
			out.print("<td>"+ telephone +"</td>");
			out.print("</tr>");
		}
	%>
		</table>
		<br>
		</center>

	<%
		stmt.close();
		con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
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