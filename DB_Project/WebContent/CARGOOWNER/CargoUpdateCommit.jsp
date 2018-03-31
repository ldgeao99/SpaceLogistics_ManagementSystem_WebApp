<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetSearchResult Page</title>
	</head>
	<body> 
		<%

			String planetId=request.getParameter("planetId");
			String spaceshipId=request.getParameter("spaceshipId");
			String name=request.getParameter("name");
			String weight=request.getParameter("weight");
			String category=request.getParameter("category");
			
			String cargoOwnerId = request.getParameter("cargoOwnerId");// 히든정보
			
			
			try
			{
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Ldgeao0242");
				Statement stmt = con.createStatement();
				
				ResultSet tempRs, tempRs2; 
				int count, count2;
				
				tempRs = stmt.executeQuery("Select count(*) From Planet where planetId=" + "'" + planetId + "'");
				tempRs.next();
				count = tempRs.getInt("count(*)");
				
				tempRs2 = stmt.executeQuery("Select count(*) From Spaceship where spaceshipId=" + "'" + spaceshipId + "'");
				tempRs2.next();
				count2 = tempRs2.getInt("count(*)");

				if(count < 1)
				{
					out.println("<script>alert('존재하지 않는 행성ID입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
				}
				else if(count2 < 1)
				{
					out.println("<script>alert('존재하지 않는 우주선ID입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
				}
				else
				{
					
					stmt.executeUpdate( "update Cargo set" 
							+ " planetId='" + planetId + "'," 
							+ "spaceshipId='" + spaceshipId + "',"
							+ "name='" + name + "',"
							+ "category='" + category + "'"
							+ " where cargoOwnerId='" + cargoOwnerId + "'");
					stmt.executeUpdate("commit work");
					out.print("<script>alert('수정이 완료되었습니다.'); document.location.href='CargoUpdate.jsp';</script>");
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