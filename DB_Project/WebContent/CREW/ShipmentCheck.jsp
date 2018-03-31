<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetSearchResult Page</title>
	</head>
	<body> 
		<%
		try
		{
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Ldgeao0242");
			Statement stmt = con.createStatement();
			
			String wantToShipmentCargoName = request.getParameter("wantToShipmentCargoName");
			String mySpaceshipEnableVolume = request.getParameter("mySpaceshipEnableVolume");
			
			System.out.println("최대선적량 : " + mySpaceshipEnableVolume);
			
			if(wantToShipmentCargoName.equals(""))
				out.println("<script>alert('선적할 화물의 이름을 입력해 주세요.'); history.go(-1);</script>");
			else
			{
				//자신의 아이디를 얻는다.
				String id = (String)session.getAttribute("ID");
				
				//자기가 속한 spaceshipId를 얻는다.
				ResultSet rst = stmt.executeQuery("Select spaceshipId From Crew where userId =" + "'" + id + "'");
				rst.next();
				String mySpaceshipId = rst.getString("spaceshipId");
				
				ResultSet rst1 = stmt.executeQuery("Select weight From Cargo where name =" + "'" + wantToShipmentCargoName + "'");
				rst1.next();
				String weightCargo = rst1.getString("weight");
				
				double weightCargoDouble = Double.parseDouble(weightCargo);
				double oldMaxVolume = Double.parseDouble(mySpaceshipEnableVolume);
				
				double newMaxVolume = (double)oldMaxVolume - weightCargoDouble;
				
				if(newMaxVolume < 0)
					out.println("<script>alert('선적 무게를 초과하여 선적할 수 없습니다.'); history.go(-1);</script>");
				else
				{
					System.out.println("선적 후 선적가용 무게 : " + newMaxVolume);
					
					stmt.executeUpdate( "update Cargo set " 
							+ "spaceshipId='" + mySpaceshipId + "' "
							+ " where name ='" + wantToShipmentCargoName + "'");
					
					stmt.executeUpdate( "update Spaceship set " 
							+ "maxVolume=" + newMaxVolume
							+ " where spaceshipId ='" + mySpaceshipId + "'");
					stmt.executeUpdate("commit work");
					out.print("<script>alert('선적이 완료되었습니다.'); document.location.href='Shipment.jsp';</script>");
				}
			}
			
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
		location.href="../POSITIONS/Crew.jsp";
	}
	function Logout(){
		location.href="../LOGIN/Logout.jsp";
	}
</script>