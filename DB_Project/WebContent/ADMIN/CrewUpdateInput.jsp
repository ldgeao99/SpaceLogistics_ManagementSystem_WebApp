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
				String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
				String id=request.getParameter("userId");
									
				try
				{
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From Crew where userId =" + "'" + id + "'");
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					if(id.equals(""))
					{
						out.println("<script>alert('사용자ID를 입력하세요.'); history.go(-1);</script>");
					}
					
					else if(count < 1)
					{
						out.println("<script>alert('존재하지 않는 사용자ID입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
					}
					
					out.println("<input type='button' value='뒤로가기' onclick='GoBack()'>");
					out.println("<input type='button' value='로그아웃' onclick='Logout()'>");
					
					ResultSet rs = stmt.executeQuery("Select * From Crew");
					
					String crewId = null;
					String userId = null;
					String spaceshipId = null;
					String position = null;
					String role = null;
					
				%>

				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.	
						if(rs.getString("userId").equals(id))
						{
							crewId = rs.getString("crewId");//테이블 어트리뷰트
							userId = rs.getString("userId");
							spaceshipId = rs.getString("spaceshipId");
							position = rs.getString("position");
							role = rs.getString("role");
						}			
					}
				%>
					
			<h2>선원 수정</h2>  
			<form action="CrewUpdateCommit.jsp" method="post">
				<table>
				<tr>
					<td>목적지행성ID</td>
					<td><input type="text" name="spaceshipId" value=<%=spaceshipId%>></td>
				</tr>
				<tr>
					<td>우주선 이름</td>
					<td><input type="text" name="position" value=<%=position%>></td>
				</tr>	
				<tr>
					<td>등급</td>
					<td><input type="text" name="role" value=<%=role%>></td>
				</tr>
				<tr>
					<td></td>
					<td align="right">
					<input type="submit" name="submit" value="수정하기" />
					</td>
				</tr>
				<tr>
					<input type="hidden" name="userId" value=<%=userId%>>
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
		location.href="CrewUpdate.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>