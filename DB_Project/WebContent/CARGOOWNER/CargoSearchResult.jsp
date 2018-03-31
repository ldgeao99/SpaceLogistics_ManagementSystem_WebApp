<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>CargoRegister</title>
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
	String id = (String) session.getAttribute("ID");
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
		Statement stmt = con.createStatement();
		
		String userId = (String)session.getAttribute("ID");
		ResultSet tempRs4 = stmt.executeQuery("Select CargoOwnerId From CargoOwner where userId =" + "'" + userId + "'");
		tempRs4.next();
		String selectCargoOwnerId = tempRs4.getString("cargoOwnerId");
		
		ResultSet rs = stmt.executeQuery("Select * From Cargo where CargoOwnerId= '" +selectCargoOwnerId +"'");
		
		
		String saerchName=request.getParameter("saerchName");
		
		String cargoId = null;
		String cargoOwnerId = null;
		String planetId = null;
		String spaceshipId = null;
		String name = null;
		String weight = null;
		String category = null;
		
		
		if(saerchName.equals(""))
			out.println("<script>alert('화물 이름을 입력하세요.'); history.go(-1);</script>");
		
	%>
		<br><br><br><br><br><br><br>
		<table border = "1">
			<tr>
				<td>화물ID</td>
				<td>화주ID</td>
				<td>목적지행성ID</td>
				<td>선적우주선ID</td>
				<td>화물명</td>
				<td>무게</td>
				<td>분류</td>			
			</tr>
		
	<%
		while(rs.next())
		{
			if(rs.getString("name").equals(saerchName)){
				cargoId = rs.getString("cargoId");//테이블 어트리뷰트
				cargoOwnerId = rs.getString("cargoOwnerId");
				planetId = rs.getString("planetId");
				spaceshipId = rs.getString("spaceshipId");
				name = rs.getString("name");
				weight = rs.getString("weight");
				category = rs.getString("category");
				out.print("<tr>");
				out.print("<td>"+ cargoId +"</td>");
				out.print("<td>"+ cargoOwnerId +"</td>");
				out.print("<td>"+ planetId +"</td>");
				out.print("<td>"+ spaceshipId +"</td>");
				out.print("<td>"+ name +"</td>");
				out.print("<td>"+ weight +"</td>");
				out.print("<td>"+ category +"</td>");
				out.print("</tr>");	
			}
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
		location.href="../CARGOOWNER/CargoSearch.jsp";
	}
	function Logout(){
		location.href="../LOGIN/Login.jsp";
	}
</script>