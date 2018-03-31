<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>PlanetSearchResult Page</title>
	</head>
	<body> 
	
	
		<center>
			<%
				String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
				String planetName=request.getParameter("name");
					
				System.out.println(planetName);
				
				try
				{
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From Planet where name =" + "'" + planetName + "'");
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					if(planetName.equals(""))
					{
						out.println("<script>alert('행성 이름을 입력하세요.'); history.go(-1);</script>");
					}
					
					else if(count < 1)
					{
						out.println("<script>alert('존재하지 않는 행성 이름입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
						System.out.println("쿼리결과 : " + count);
					}
					
					out.println("<input type='button' value='뒤로가기' onclick='GoBack()'>");
					out.println("<input type='button' value='로그아웃' onclick='Logout()'>");
					
					ResultSet rs = stmt.executeQuery("Select * From Planet");
					String id = null;
					String name = null;
					String coordinate = null;
					String type = null;
					String distance = null;
					String population = null;
					String discountRate = null;
					String premiumRate = null;
					
					
				%>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<table border = "1">
						<tr>
							<td>행성ID</td>
							<td>이름</td>
							<td>좌표</td>
							<td>타입</td>
							<td>거리</td>
							<td>인구</td>
							<td>할인률</td>
							<td>할증률</td>				
						</tr>
					
				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.
						name = rs.getString("name");
						if(name.equals(planetName))
						{
							System.out.println(name);
							id = rs.getString("planetId");//테이블 어트리뷰트
							coordinate = rs.getString("coordinate");
							type = rs.getString("type");
							distance = rs.getString("distance");
							population = rs.getString("population");
							discountRate = rs.getString("discountRate");
							premiumRate = rs.getString("premiumRate");
							out.print("<tr>");
							out.print("<td>"+ id +"</td>");
							out.print("<td>"+ name +"</td>");
							out.print("<td>"+ coordinate +"</td>");
							out.print("<td>"+ type +"</td>");
							out.print("<td>"+ distance +"</td>");
							out.print("<td>"+ population +"</td>");
							out.print("<td>"+ discountRate +"</td>");
							out.print("<td>"+ premiumRate +"</td>");
							out.print("</tr>");
						}			
					}
				%>
					</table>
			</center>
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
		location.href="PlanetSearch.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>