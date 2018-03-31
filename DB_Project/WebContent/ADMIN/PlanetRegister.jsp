<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetRegister Page</title>
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
		ResultSet rs = stmt.executeQuery("Select * From Planet");
		String id = null;
		String name = null;
		String coordinate = null;
		String type = null;
		String distance = null;
		String population = null;
		String discountRate = null;
		String premiumRate = null;
	%>
		<table border = "1">
			<tr>
				<td>행성ID</td>
				<td>이름</td>
				<td>좌표</td>
				<td>타입</td>
				<td>거리</td>
				<td>인구</td>
				<td>할인률</td>
				<td>할증률</td>				
			</tr>
		
	<%
		while(rs.next())
		{
			id = rs.getString("planetId");//테이블 어트리뷰트
			name = rs.getString("name");
			coordinate = rs.getString("coordinate");
			type = rs.getString("type");
			distance = rs.getString("distance");
			population = rs.getString("population");
			discountRate = rs.getString("discountRate");
			premiumRate = rs.getString("premiumRate");
			out.print("<tr>");
			out.print("<td>"+ id +"</td>");
			out.print("<td>"+ name +"</td>");
			out.print("<td>"+ coordinate +"</td>");
			out.print("<td>"+ type +"</td>");
			out.print("<td>"+ distance +"</td>");
			out.print("<td>"+ population +"</td>");
			out.print("<td>"+ discountRate +"</td>");
			out.print("<td>"+ premiumRate +"</td>");
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
		<h2>행성 등록</h2>  
		<form action="PlanetRegisterCheck.jsp" method="post">
			<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="planetName" /></td>
			</tr>
			<tr>
				<td>좌표</td>
				<td><input type="text" name="coordinate" /></td>
			</tr>
			<tr>
				<td>타입</td>
				<td>
				<select name="type">
				<option value="A"selected>A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<option value="D">D</option>	
				<option value="E">E</option>
				<option value="F">F</option>
				</select>
				형
				</td>
			</tr>		
			<tr>
				<td>거리</td>
				<td><input type="text" name="distance" /></td>
			</tr>
			<tr>
				<td>인구</td>
				<td><input type="text" name="population" /></td>
			</tr>
			<tr>
				<td>할인률</td>
				<td><input type="text" name="discountRate" /></td>
			</tr>
			<tr>
				<td>할증률</td>
				<td><input type="text" name="premiumRate" /></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">
				<input type="submit" name="submit" value="등록하기" />
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