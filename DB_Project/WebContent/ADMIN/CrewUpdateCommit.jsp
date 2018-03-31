<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetSearchResult Page</title>
	</head>
	<body> 
		<%
			String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		
			String spaceshipId=request.getParameter("spaceshipId");
			String position=request.getParameter("position");
			String role=request.getParameter("role");
			
			String userId=request.getParameter("userId"); // 히든정보
			
			System.out.println(userId);
			
			try
			{
				Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
				Statement stmt = con.createStatement();
				
				ResultSet tempRs; 
				int count;
				
				tempRs = stmt.executeQuery("Select count(*) From Spaceship where SpaceshipId=" + "'" + spaceshipId + "'");
				tempRs.next();
				count = tempRs.getInt("count(*)");
				System.out.println(count);
				if(count < 1)
				{
					
					out.println("<script>alert('존재하지 않는 우주선ID입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
				}
				else
				{
					
					stmt.executeUpdate( "update Crew set" 
							+ " spaceshipId='" + spaceshipId + "'," 
							+ "position='" + position + "',"
							+ "role='" + role + "'"
							+ " where userId='" + userId + "'");
					stmt.executeUpdate("commit work");
					out.print("<script>alert('수정이 완료되었습니다.'); document.location.href='CrewUpdate.jsp';</script>");
				}
				
				//response.sendRedirect("PlanetUpdate.jsp");
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</body>
</html>