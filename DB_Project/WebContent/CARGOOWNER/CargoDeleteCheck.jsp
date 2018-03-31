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
			
			String deleteName=request.getParameter("deleteName");
			
			String id = (String)session.getAttribute("ID");
			
			ResultSet tempRs5 = stmt.executeQuery("Select cargoOwnerId From CargoOwner where userId =" + "'" + id + "'");
			tempRs5.next();
			String currentCargoOwnerId= tempRs5.getString("cargoOwnerId");

			
			System.out.println("currentCargoOwnerId : " + currentCargoOwnerId);

			
			

			
			ResultSet tempRs2 = stmt.executeQuery("Select count(*) From Cargo where name =" + "'" + deleteName + "' and cargoOwnerId = '" +  currentCargoOwnerId + "'");
			tempRs2.next();
			int existDeleteName = tempRs2.getInt("count(*)");
			
			ResultSet tempRs6 = stmt.executeQuery("Select spaceshipId From Cargo where name =" + "'" + deleteName + "'");
			tempRs6.next();
			String spaceshipId = tempRs6.getString("spaceshipId");
			
			ResultSet tempRs7 = stmt.executeQuery("Select state From Spaceship where spaceshipId =" + "'" + spaceshipId + "'");
			tempRs7.next();
			String state = tempRs7.getString("state");
			
			System.out.println("삭제하려는 상품이 실린 우주선상태 :" + state);
			

			if(deleteName.equals(""))
			{
				out.println("<script>alert('빈칸이 존재합니다 모두 입력하세요.'); history.go(-1);</script>");
			} 
			else if(existDeleteName < 1)
			{
				out.println("<script>alert('존재하지 않는 화물입니다.'); history.go(-1);</script>");
			}
			else if(state.equals("inflight"))
			{
				out.println("<script>alert('이미 운송중인 화물이라 삭제할 수 없습니다.'); history.go(-1);</script>");
			}
			else if(state.equals("arrived"))
			{
				out.println("<script>alert('이미 운송을 마친 화물이라 삭제할 수 없습니다.'); history.go(-1);</script>");
			}
			else
			{
				stmt.executeQuery("Delete From Cargo where name =" + "'" + deleteName + "'");
				out.print("<script>alert('삭제가 완료되었습니다.'); document.location.href='CargoDelete.jsp';</script>");
				stmt.executeUpdate("commit work");
			}
			stmt.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}				
		%>
	</body>
</html>