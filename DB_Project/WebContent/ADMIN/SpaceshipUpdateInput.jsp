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
	
				String spaceshipName=request.getParameter("name");
					
				System.out.println(spaceshipName);
				
				try
				{
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From Spaceship where name =" + "'" + spaceshipName + "'");
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					if(spaceshipName.equals(""))
					{
						out.println("<script>alert('우주선 이름을 입력하세요.'); history.go(-1);</script>");
					}
					
					else if(count < 1)
					{
						out.println("<script>alert('존재하지 않는 우주선 이름입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
						System.out.println("쿼리결과 : " + count);
					}
					
					out.println("<input type='button' value='뒤로가기' onclick='GoBack()'>");
					out.println("<input type='button' value='로그아웃' onclick='Logout()'>");
					
					ResultSet rs = stmt.executeQuery("Select * From Spaceship");
					String spaceshipId = null;
					String planetId = null; // 목적지 행성
					String name = null;
					String grade = null;
					String maxVolume = null;
					String speed = null;
					String fare = null;
					String state = null;
					
					
				%>

				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.	
						if(rs.getString("name").equals(spaceshipName))
						{
							System.out.println(name);
							spaceshipId = rs.getString("spaceshipId");//테이블 어트리뷰트
							planetId = rs.getString("planetId");
							name = rs.getString("name");
							grade = rs.getString("grade");
							maxVolume = rs.getString("maxVolume");
							speed = rs.getString("speed");
							fare = rs.getString("fare");
							state = rs.getString("state");
						}			
					}
				%>
					
			<h2>우주선 수정</h2>  
			<form action="SpaceshipUpdateCommit.jsp" method="post">
				<table>
				<tr>
					<td>목적지행성ID</td>
					<td><input type="text" name="planetId" value=<%=planetId%>></td>
				</tr>
				<tr>
					<td>우주선 이름</td>
					<td><input type="text" name="name" value=<%=name%>></td>
				</tr>	
				<tr>
					<td>등급</td>
					<td><input type="text" name="grade" value=<%=grade%>></td>
				</tr>
				<tr>
					<td>최대수송량</td>
					<td><input type="text" name="maxVolume" value=<%=maxVolume%>></td>
				</tr>
				<tr>
					<td>속도</td>
					<td><input type="text" name="speed" value=<%=speed%>></td>
				</tr>
				<tr>        
					<td>운임</td>
					<td><input type="text" name="fare" value=<%=fare%>></td>
				</tr>
				<tr>        
					<td>상태</td>
					<td><input type="text" name="state" value=<%=state%>></td>
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
		location.href="SpaceshipUpdate.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>