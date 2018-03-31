<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetSearchResult Page</title>
	</head>
	<body> 
		<center>
			<%
	
				String inputedCargoOwnerId = request.getParameter("cargoOwnerId");
				
				try
				{
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					String saerchName=request.getParameter("saerchName");
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From Cargo where name =" + "'" + saerchName + "' and cargoOwnerId='"+inputedCargoOwnerId+"'" );
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					
					ResultSet tempRs6 = stmt.executeQuery("Select spaceshipId From Cargo where name =" + "'" + saerchName + "'");
					tempRs6.next();
					String searchSpaceshipId = tempRs6.getString("spaceshipId");
					
					ResultSet tempRs7 = stmt.executeQuery("Select state From Spaceship where spaceshipId =" + "'" + searchSpaceshipId + "'");
					tempRs7.next();
					String state = tempRs7.getString("state");
					
					
					if(saerchName.equals(""))
						out.println("<script>alert('우주선 이름을 입력하세요.'); history.go(-1);</script>");
					
					else if(count < 1)
						out.println("<script>alert('존재하지 않는 화물 이름입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
						
					else if(state.equals("inflight"))
					{
						out.println("<script>alert('이미 운송중인 화물이라 수정할 수 없습니다.'); history.go(-1);</script>");
					}
					else if(state.equals("arrived"))
					{
						out.println("<script>alert('이미 운송을 마친 화물이라 수정할 수 없습니다.'); history.go(-1);</script>");						
					}
					
					out.println("<input type='button' value='뒤로가기' onclick='GoBack()'>");
					out.println("<input type='button' value='로그아웃' onclick='Logout()'>");
					
					ResultSet rs = stmt.executeQuery("Select * From Cargo");
					
					String cargoId = null;
					String cargoOwnerId = null;
					String planetId = null;
					String spaceshipId = null;
					String name = null;
					String weight = null;
					String category = null;
					
					
				%>

				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.	
						if(rs.getString("name").equals(saerchName))
						{
							cargoId = rs.getString("cargoId");//테이블 어트리뷰트
							planetId = rs.getString("planetId");
							cargoOwnerId = rs.getString("cargoOwnerId");
							spaceshipId = rs.getString("spaceshipId");
							name = rs.getString("name");
							weight = rs.getString("weight");
							category = rs.getString("category");
						}			
					}
				%>
					
			<h2>화물 수정</h2>  
			<form action="CargoUpdateCommit.jsp" method="post">
				<table>
				<tr>
					<td>목적지행성ID</td>
					<td><input type="text" name="planetId" value=<%=planetId%>></td>
				</tr>
				<tr>
					<td>선적우주선ID</td>
					<td><input type="text" name="spaceshipId" value=<%=spaceshipId%>></td>
				</tr>	
				<tr>
					<td>화물명</td>
					<td><input type="text" name="name" value=<%=name%>></td>
				</tr>
				<tr>
					<td>무게</td>
					<td><input type="text" name="weight" value=<%=weight%>></td>
				</tr>
				<tr>
					<td>분류</td>
					<td><input type="text" name="category" value=<%=category%>></td>
				</tr>
				<tr>
					<td></td>
					<td align="right">
					<input type="submit" name="submit" value="수정하기" />
					</td>
				</tr>
				<tr>
					<input type="hidden" name="cargoOwnerId" value=<%=cargoOwnerId%>>
				</tr>
			</table>
		</form>
					
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
		location.href="CargoUpdate.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>