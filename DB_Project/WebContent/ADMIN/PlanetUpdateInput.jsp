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

				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.	
						if(rs.getString("name").equals(planetName))
						{
							System.out.println(name);
							id = rs.getString("planetId");//테이블 어트리뷰트
							name = rs.getString("name");
							coordinate = rs.getString("coordinate");
							type = rs.getString("type");
							distance = rs.getString("distance");
							population = rs.getString("population");
							discountRate = rs.getString("discountRate");
							premiumRate = rs.getString("premiumRate");
						}			
					}
				%>
					
			<h2>행성 수정</h2>  
			<form action="PlanetUpdateCommit.jsp" method="post">
				<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=<%=name%>></td>
				</tr>
				<tr>
					<td>좌표</td>
					<td><input type="text" name="coordinate" value=<%=coordinate%>></td>
				</tr>
				<tr>
					<td>타입</td>
					<td>
					<select name="type">
						<%
							if(type.equals("A"))
								out.print("<option value='A'selected>A</option>");
							else
								out.print("<option value='A'>A</option>");
			
							if(type.equals("B"))
								out.print("<option value='B'selected>B</option>");
							else
								out.print("<option value='B'>B</option>");
						
							if(type.equals("C"))
								out.print("<option value='C'selected>C</option>");
							else
								out.print("<option value='C'>C</option>");
						
							if(type.equals("D"))
								out.print("<option value='D'selected>D</option>");
							else
								out.print("<option value='D'>D</option>");
						
							if(type.equals("E"))
								out.print("<option value='E'selected>E</option>");
							else
								out.print("<option value='E'>E</option>");
						
							if(type.equals("F"))
								out.print("<option value='F'selected>F</option>");
							else
								out.print("<option value='F'>F</option>");
						%>
					</select>
					형
					</td>
				</tr>		
				<tr>
					<td>거리</td>
					<td><input type="text" name="distance" value=<%=distance%>></td>
				</tr>
				<tr>
					<td>인구</td>
					<td><input type="text" name="population" value=<%=population%>></td>
				</tr>
				<tr>
					<td>할인률</td>
					<td><input type="text" name="discountRate" value=<%=discountRate%>></td>
				</tr>
				<tr>        
					<td>할증률</td>
					<td><input type="text" name="premiumRate" value=<%=premiumRate%>></td>
				</tr>
				<tr>
					<td></td>
					<td align="right">
					<input type="submit" name="submit" value="수정하기" />
					</td>
				</tr>
				<tr>
					<input type="hidden" name="originalName" value=<%=name%>>
				</tr>
			</table>
		</form>
					
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
		location.href="PlanetUpdate.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>