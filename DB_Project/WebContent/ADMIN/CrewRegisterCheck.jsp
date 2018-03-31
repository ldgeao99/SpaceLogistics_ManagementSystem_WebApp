<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%@page import = "java.sql.*"%>

<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetRegisterCheck Page</title> 
	</head> 
	<body>
		<%
		try
		{
			String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		
			String userId=request.getParameter("userId");
			String spaceshipId=request.getParameter("spaceshipId");
			String position=request.getParameter("position");
			String role=request.getParameter("role");

			Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
			Statement stmt = con.createStatement();
			
			ResultSet tempRs1 = stmt.executeQuery("Select count(*) From Crew where userId =" + "'" + userId + "'");
			tempRs1.next();
			int userIdInCrew = tempRs1.getInt("count(*)");
			
			ResultSet tempRs2 = stmt.executeQuery("Select count(*) From Users where userId =" + "'" + userId + "'");
			tempRs2.next();
			int userIdInUsers = tempRs2.getInt("count(*)");

			ResultSet tempRs3 = stmt.executeQuery("Select count(*) From Spaceship where spaceshipId =" + "'" + spaceshipId + "'");
			tempRs3.next();
			int spaceshipIdInSpaceship = tempRs3.getInt("count(*)");
			
		
			if(userId.equals("") || spaceshipId.equals("") || position.equals("") || role.equals(""))
			{
				out.println("<script>alert('빈칸이 존재합니다 모두 입력하세요.'); history.go(-1);</script>");
			} 
			else if(userIdInCrew > 0)
			{
				out.println("<script>alert('선원으로 이미 존재하는 사용자ID입니다.'); history.go(-1);</script>");
			}
			else if(userIdInUsers < 1)
			{
				out.println("<script>alert('사용자 테이블에 존재하지 않는 사용자 아이디 입니다.'); history.go(-1);</script>");
			}
			else if(spaceshipIdInSpaceship < 1)
			{
				out.println("<script>alert('우주선 테이블에 존재하지 않는 우주선 아이디 입니다.'); history.go(-1);</script>");
			}
			else
			{	
				stmt.executeUpdate("INSERT INTO Crew VALUES("
						+ "sqCrewId.nextval,"
						+ "'" + userId + "',"
						+ "'" + spaceshipId + "',"
						+ "'" + position + "',"
						+ "'" + role + "'"
						+")");
				
				stmt.executeUpdate( "update Users set" 
						+ " authority='crew' "			
						+ " where userId='" + userId + "'");
				
				stmt.executeUpdate("commit work");
				
				out.print("<script>alert('선원이 정상적으로 등록되었습니다.'); location.href='CrewRegister.jsp';</script>");
			}

			stmt.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}				
		%>
	</body>
</html>