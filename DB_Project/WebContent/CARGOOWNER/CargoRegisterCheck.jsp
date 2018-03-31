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
			
			String cargoOwnerId=null; // 아래서 찾아짐.
			String planetId=request.getParameter("planetId");
			String name=request.getParameter("name");
			String weight=request.getParameter("weight");
			String category=request.getParameter("category");
			
			
			ResultSet tempRs2 = stmt.executeQuery("Select count(*) From Planet where planetId =" + "'" + planetId + "'");
			tempRs2.next();
			int planetIdInPlanet = tempRs2.getInt("count(*)");

			
		
			if(planetId.equals("") || name.equals("") || weight.equals("")|| category.equals(""))
			{
				out.println("<script>alert('빈칸이 존재합니다 모두 입력하세요.'); history.go(-1);</script>");
			} 
			else if(planetIdInPlanet < 1)
			{
				out.println("<script>alert('행성 테이블에 존재하지 않는 행성ID입니다.'); history.go(-1);</script>");
			}
			else
			{	
				ResultSet tempRs4 = stmt.executeQuery("Select CargoOwnerId From CargoOwner where userId =" + "'" + userId + "'");
				tempRs4.next();
				cargoOwnerId = tempRs4.getString("cargoOwnerId");
				
				System.out.println(cargoOwnerId);
				
				
				stmt.executeUpdate("INSERT INTO Cargo VALUES("
						+ "sqCargoId.nextval,"
						+ "'" + cargoOwnerId + "',"
						+ "'" + planetId + "',"
						+ null +","
						+ "'" + name + "',"
						+ "'" + category + "',"
						+ "'" + weight + "'"
						+")");
				
				stmt.executeUpdate("commit work");
				
				out.print("<script>alert('화물이 정상적으로 등록되었습니다.'); location.href='CargoRegister.jsp';</script>");
			}
			stmt.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}				
		%>
	</body>
</html>