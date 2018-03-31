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
				try
				{
					String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
					
					String id=request.getParameter("userId");
					
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From Crew where userId =" + "'" + id + "'");
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					
					//예외처리
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
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
						//여기서 걸러주면 됨.
						userId = rs.getString("userId");
						if(userId.equals(id))
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
					}
				%>
					</table>
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
		location.href="CrewSearch.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>