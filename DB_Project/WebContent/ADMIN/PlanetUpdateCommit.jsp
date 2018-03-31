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
			String name=request.getParameter("name");
			String coordinate=request.getParameter("coordinate");
			String type=request.getParameter("type");
			String distance=request.getParameter("distance");
			String population=request.getParameter("population");
			String discountRate=request.getParameter("discountRate");
			String premiumRate=request.getParameter("premiumRate");	
			String originalName=request.getParameter("originalName");
			
			
			
			try
			{
				Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
				Statement stmt = con.createStatement();
				
				if(!name.equals(originalName))
				{
					ResultSet tempRs; 
					int count;
					
					tempRs = stmt.executeQuery("Select count(*) From Planet where name=" + "'" + name + "'");
					tempRs.next();
					count = tempRs.getInt("count(*)");
					
					if(count > 0)
						out.println("<script>alert('이미 존재하는 행성 이름입니다. 다른 이름을 입력해주세요.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
				}
						
				System.out.println("name : " + name + " originalName : " + originalName);				
				stmt.executeUpdate( "update planet set" 
						+ " name='" + name + "'," 
						+ "coordinate='" + coordinate + "',"
						+ "type='" + type + "',"
						+ "distance='" + distance + "',"
						+ "population='" + population + "',"	
						+ "discountRate='" + discountRate + "',"
						+ "premiumRate='" + premiumRate + "'"
						+ " where name='" + originalName + "'");
				stmt.executeUpdate("commit work");
				out.print("<script>alert('수정이 완료되었습니다.'); document.location.href='PlanetUpdate.jsp';</script>");
				
			
				//response.sendRedirect("PlanetUpdate.jsp");
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</body>
</html>