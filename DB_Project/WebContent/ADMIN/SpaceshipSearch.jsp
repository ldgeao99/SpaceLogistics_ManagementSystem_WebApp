<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Admin Page</title>
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
		ResultSet rs = stmt.executeQuery("Select * From Spaceship");
		
		String spaceshipId = null;
		String planetId = null; // 목적지 행성
		String name = null;
		String grade = null;
		String maxVolume = null;
		String speed = null;
		String fare = null;
		String state = null;
	%>
		<table border = "1">
			<tr>
				<td>우주선ID</td>
				<td>목적지행성ID</td>
				<td>이름</td>
				<td>등급</td>
				<td>최대수송량</td>
				<td>속도</td>
				<td>운임</td>
				<td>상태</td>				
			</tr>
		
	<%
		while(rs.next())
		{
			spaceshipId = rs.getString("spaceshipId");//테이블 어트리뷰트
			planetId = rs.getString("planetId");
			name = rs.getString("name");
			grade = rs.getString("grade");
			maxVolume = rs.getString("maxVolume");
			speed = rs.getString("speed");
			fare = rs.getString("fare");
			state = rs.getString("state");
			out.print("<tr>");
			out.print("<td>"+ spaceshipId +"</td>");
			out.print("<td>"+ planetId +"</td>");
			out.print("<td>"+ name +"</td>");
			out.print("<td>"+ grade +"</td>");
			out.print("<td>"+ maxVolume +"</td>");
			out.print("<td>"+ speed +"</td>");
			out.print("<td>"+ fare +"</td>");
			out.print("<td>"+ state +"</td>");
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
			<h2>우주선 검색</h2>  
			<form action="SpaceshipSearchResult.jsp" method="post">
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
					<td></td>
					<td align="right">
					<input type="submit" name="submit" value="검색하기"/>
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