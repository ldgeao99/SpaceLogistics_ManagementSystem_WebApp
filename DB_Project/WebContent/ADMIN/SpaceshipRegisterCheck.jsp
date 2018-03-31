<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>


<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		
	String planetId=request.getParameter("planetId");
	String name=request.getParameter("name");
	String grade=request.getParameter("grade");
	String maxVolume=request.getParameter("maxVolume");
	String speed=request.getParameter("speed");
	String fare=request.getParameter("fare");
	String state=request.getParameter("state");

	if(planetId.equals("") || name.equals("") || grade.equals("") || maxVolume.equals("") || speed.equals("")|| fare.equals("")|| state.equals(""))
	{
		out.println("<script>alert('빈칸이 존재합니다 모두 입력하세요.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
	}
	else
	{
		try
		{
			Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
			Statement stmt = con.createStatement();
					
			double inputMaxVolume = Double.parseDouble(maxVolume);
			double inputSpeed = Double.parseDouble(speed);
			double inputFare = Double.parseDouble(fare);
					
			stmt.executeUpdate("INSERT INTO Spaceship VALUES("
					+ "sqSpaceshipId.nextval,"
					+ "'" + planetId + "',"
					+ "'" + name + "',"
					+ "'" + grade + "',"
					+ maxVolume + ","
					+ speed + ","
					+ fare + ","
					+ "'" + state+ "'"
					+")");
					
			out.print("<script>alert('행성이 정상적으로 등록되었습니다.'); location.href='SpaceshipRegister.jsp';</script>");
			stmt.close();		
			con.close();
					
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
