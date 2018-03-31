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
				try
				{
					String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
					String id=request.getParameter("userId");
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From CargoOwner where userId =" + "'" + id + "'");
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					if(id.equals(""))
					{
						out.println("<script>alert('화주 이름을 입력하세요.'); history.go(-1);</script>");
					}
					
					else if(count < 1)
					{
						out.println("<script>alert('존재하지 않는 화주 이름입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
						System.out.println("쿼리결과 : " + count);
					}
					
					out.println("<input type='button' value='뒤로가기' onclick='GoBack()'>");
					out.println("<input type='button' value='로그아웃' onclick='Logout()'>");
					
					ResultSet rs = stmt.executeQuery("Select * From CargoOwner");
					String cargoOwnerId = null;
					String userId = null;
					String planetId = null;
					String corpName = null;
					String grade = null;
					String credit = null;
					
					
				%>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<table border = "1">
						<tr>
							<td>화주ID</td>
							<td>사용자ID</td>
							<td>행성ID</td>
							<td>회사이름</td>
							<td>고객등급</td>
							<td>예치금</td>				
						</tr>
					
				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.
						userId = rs.getString("userId");
						if(userId.equals(id))
						{
							cargoOwnerId = rs.getString("cargoOwnerId");//테이블 어트리뷰트
							userId = rs.getString("userId");
							planetId = rs.getString("planetId");
							corpName = rs.getString("corpName");
							grade = rs.getString("grade");
							credit = rs.getString("credit");
							out.print("<tr>");
							out.print("<td>"+ cargoOwnerId +"</td>");
							out.print("<td>"+ userId +"</td>");
							out.print("<td>"+ planetId +"</td>");
							out.print("<td>"+ corpName +"</td>");
							out.print("<td>"+ grade +"</td>");
							out.print("<td>"+ credit +"</td>");
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
		location.href="CargoOwnerSearch.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>