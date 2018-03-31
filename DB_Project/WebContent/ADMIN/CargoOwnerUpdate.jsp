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
	
	<div style="border: 0px solid red; float: left; width: 49%;">
	<center>
	<h2>조회결과</h2>  
	<%
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("Select * From CargoOwner");
		
		String cargoOwnerId = null;
		String userId = null;
		String planetId = null;
		String corpName = null;
		String grade = null;
		String credit = null;
	%>
		<table border = "1">
			<tr>
				<td>화주ID</td>
				<td>사용자ID</td>
				<td>행성ID</td>
				<td>회사이름</td>
				<td>고객등급</td>
				<td>예치금</td>			
			</tr>
		
	<%
		while(rs.next())
		{
			cargoOwnerId = rs.getString("cargoOwnerId");//테이블 어트리뷰트
			userId = rs.getString("userId");
			planetId = rs.getString("planetId");
			corpName = rs.getString("corpName");
			grade = rs.getString("grade");
			credit = rs.getString("credit");
			out.print("<tr>");
			out.print("<td>"+ cargoOwnerId +"</td>");
			out.print("<td>"+ userId +"</td>");
			out.print("<td>"+ planetId +"</td>");
			out.print("<td>"+ corpName +"</td>");
			out.print("<td>"+ grade +"</td>");
			out.print("<td>"+ credit +"</td>");
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
	
	
	<div style="border: 0px solid red; float: right; width: 49%;">	
	<center>
		<h2>화주 수정</h2> 
		<form action="CargoOwnerUpdateInput.jsp" method="post">
			<table>	
			<tr>
				<td>사용자ID</td>
				<td><input type="text" name="userId" /></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">
				<input type="submit" name="submit" value="조회하기" />
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