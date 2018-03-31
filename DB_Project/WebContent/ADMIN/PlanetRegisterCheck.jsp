<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%@page import = "java.sql.*"%>

<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetRegisterCheck Page</title> 
	</head> 
	<body>
		<%
			String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		
			String name=request.getParameter("planetName");
			String coordinate=request.getParameter("coordinate");
			String distance=request.getParameter("distance");
			String population=request.getParameter("population");
			String discountRate=request.getParameter("discountRate");
			String premiumRate=request.getParameter("premiumRate");
			String type=request.getParameter("type");
			
			if(name.equals("") || coordinate.equals("") || distance.equals("") || population.equals("") || discountRate.equals("") || premiumRate.equals(""))
			{
				out.println("<script>alert('빈칸이 존재합니다 모두 입력하세요.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
			}
			else
			{
				try
				{
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					double inputDistance = Double.parseDouble(distance);
					double inputPopulation = Double.parseDouble(population);
					double inputDiscountRate = Double.parseDouble(discountRate);
					double inputPremiumRate = Double.parseDouble(premiumRate);
					
					stmt.executeUpdate("INSERT INTO Planet VALUES("
							+ "sqPlanetId.nextval,"
							+ "'" + name + "',"
							+ "'" + coordinate + "',"
							+ "'" + type + "',"
							+ inputDistance + ","
							+ inputPopulation + ","
							+ inputDiscountRate + ","
							+ inputPremiumRate
							+")");
					
					out.print("<script>alert('행성이 정상적으로 등록되었습니다.'); location.href='PlanetRegister.jsp';</script>");
					stmt.close();
					con.close();
					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		%>
	</body>
</html>