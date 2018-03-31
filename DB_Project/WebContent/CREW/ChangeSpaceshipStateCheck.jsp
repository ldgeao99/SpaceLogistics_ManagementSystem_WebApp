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
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Ldgeao0242");
			Statement stmt = con.createStatement();
			
			String userId = (String)session.getAttribute("ID"); // 세션으로부터 얻은 사용자 아이디.
			
			String wantToChangeSpaceshipName=request.getParameter("wantToChangeSpaceshipName");
			String wantToChangeState=request.getParameter("wantToChangeState");


			ResultSet rst = stmt.executeQuery("Select spaceshipId From Crew where userId =" + "'" + userId + "'");
			rst.next();
			String mySpaceshipId = rst.getString("spaceshipId");
			
			ResultSet rst2 = stmt.executeQuery("Select count(*) From Spaceship where name =" + "'" + wantToChangeSpaceshipName + "'" + "and " + "spaceshipId = " +"'"+ mySpaceshipId+ "'");
			rst2.next();
			int countNameInSpaceship = rst2.getInt("count(*)");
			
		
			if(wantToChangeSpaceshipName.equals(""))
			{
				out.println("<script>alert('상태를 변경시킬 우주선 이름을 입력해 주세요.'); history.go(-1);</script>");
			} 
			else if(countNameInSpaceship < 1)
			{
				out.println("<script>alert('존재하지 않는 우주선 이름입니다.'); history.go(-1);</script>");
			}
			else
			{	
				
				/*
				
				
				ResultSet tempRs4 = stmt.executeQuery("Select CargoOwnerId From CargoOwner where userId =" + "'" + userId + "'");
				tempRs4.next();
				cargoOwnerId = tempRs4.getString("cargoOwnerId");
				
				System.out.println(cargoOwnerId);
				*/
				
				
				
				stmt.executeUpdate( "update Spaceship set" 
						+ " state='" + wantToChangeState + "'" 
						+ " where spaceshipId='" + mySpaceshipId + "'");
				stmt.executeUpdate("commit work");
				
				stmt.executeUpdate("commit work");
				
				out.print("<script>alert('우주선 상태가 정상적으로 수정되었습니다.'); location.href='ChangeSpaceshipState.jsp';</script>");
			}
			stmt.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}				
		%>
	</body>
</html>