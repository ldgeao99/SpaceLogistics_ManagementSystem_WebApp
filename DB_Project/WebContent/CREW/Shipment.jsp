<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetSearchResult Page</title>
	</head>
	<body> 
		<center>
				<table>
					<tr>
						<td><input type='button' value='뒤로가기' onclick='GoBack()'></td>
						<td><input type='button' value='로그아웃' onclick='Logout()'></td>
					</tr>
				</table>
		</center>
		<div style="border: 0px solid red; float: left; width: 49%;">
		<center>
				
				<%
					try
					{
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Ldgeao0242");
						Statement stmt = con.createStatement();
						
						//자신의 아이디를 얻는다.
						String id = (String)session.getAttribute("ID");
						
						//자기가 속한 spaceshipId를 얻는다.
						ResultSet rst = stmt.executeQuery("Select spaceshipId From Crew where userId =" + "'" + id + "'");
						rst.next();
						String mySpaceshipId = rst.getString("spaceshipId");
						
						System.out.println("mySpaceshipId : "+mySpaceshipId);
						
						//자기가 속한 우주선의 목적지 행성을 얻는다.
						ResultSet rst2 = stmt.executeQuery("Select planetId From Spaceship where spaceshipId =" + "'" + mySpaceshipId + "'");
						rst2.next();
						String mySpaceshipDesti = rst2.getString("planetId");
						
						System.out.println("mySpaceshipDesti : "+mySpaceshipDesti);

						//자기가 속한 우주선의 현재 선적가능 무게를 구한다.
						ResultSet rst3 = stmt.executeQuery("Select maxVolume From spaceship where spaceshipId =" + "'" + mySpaceshipId + "'");
						rst3.next();
						String mySpaceshipEnableVolume = rst3.getString("maxVolume");
						
						
						ResultSet rs2 = stmt.executeQuery("Select * From Cargo");
						
						String cargoId = null;
						String cargoOwnerId = null;
						String planetId = null;
						String spaceshipId = null;
						String name = null;
						String weight = null;
						String category = null;
						
						
					%>
						<br><br><br><br><br>
						<h2>조회결과</h2>
						<table border = "1">
							<tr>
								<td>화물ID</td>
								<td>화주ID</td>
								<td>목적지행성ID</td>
								<td>선적우주선ID</td>
								<td>화물명</td>
								<td>무게</td>
								<td>분류</td>				
							</tr>
						
					<%
						while(rs2.next())
						{
							//여기서 걸러주면 됨.
							planetId = rs2.getString("planetId");
							spaceshipId = rs2.getString("spaceshipId");
							if(planetId.equals(mySpaceshipDesti)&& (spaceshipId == null))
							{
								cargoId = rs2.getString("cargoId");//테이블 어트리뷰트
								cargoOwnerId = rs2.getString("cargoOwnerId");
								planetId = rs2.getString("planetId");
								spaceshipId = rs2.getString("spaceshipId");
								name = rs2.getString("name");
								weight = rs2.getString("weight");
								category = rs2.getString("category");
								out.print("<tr>");
								out.print("<td>"+ cargoId +"</td>");
								out.print("<td>"+ cargoOwnerId +"</td>");
								out.print("<td>"+ planetId +"</td>");
								out.print("<td>"+ spaceshipId +"</td>");
								out.print("<td>"+ name +"</td>");
								out.print("<td>"+ weight +"</td>");
								out.print("<td>"+ category +"</td>");
								out.print("</tr>");
							}			
						}
					%>
						</table>
				</center>
			</div>
			
			<div style="border: 0px solid red; float: right; width: 49%;">
				<center>
					<br><br><br><br><br>
					<h2>선적하기</h2> 
					<form action="ShipmentCheck.jsp" method="post">
						<table>
							<tr>
								<td>화물이름</td>
								<td><input type="text" name="wantToShipmentCargoName" /></td>
							</tr>
							<tr>
								<td></td>
								<td align="right">
								<input type="submit" name="submit" value="선적하기" />
								</td>
								<td><input type="hidden" name="mySpaceshipEnableVolume" value=<%=mySpaceshipEnableVolume%>> </td>
							</tr>
						</table>
					</form>
				</center>
			</div>
	<%
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