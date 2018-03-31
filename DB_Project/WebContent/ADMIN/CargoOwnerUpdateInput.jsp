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
	
				String id=request.getParameter("userId");
									
				try
				{
					Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
					Statement stmt = con.createStatement();
					
					ResultSet tempRs = stmt.executeQuery("Select count(*) From CargoOwner where userId =" + "'" + id + "'");
					tempRs.next();
					int count = tempRs.getInt("count(*)");
					
					if(id.equals(""))
					{
						out.println("<script>alert('사용자ID를 입력하세요.'); history.go(-1);</script>");
					}
					
					else if(count < 1)
					{
						out.println("<script>alert('화주에 존재하지 않는 사용자 ID입니다.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
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

				<%
					while(rs.next())
					{
						//여기서 걸러주면 됨.	
						if(rs.getString("userid").equals(id))
						{
							cargoOwnerId = rs.getString("cargoOwnerId");//테이블 어트리뷰트
							planetId = rs.getString("planetId");
							corpName = rs.getString("corpName");
							grade = rs.getString("grade");
							credit = rs.getString("credit");
						}			
					}
				%>
					
			<h2>우주선 수정</h2>  
			<form action="CargoOwnerUpdateCommit.jsp" method="post">
				<table>
				<tr>
					<td>소속행성ID</td>
					<td><input type="text" name="planetId" value=<%=planetId%>></td>
				</tr>
				<tr>
					<td>회사이름</td>
					<td><input type="text" name="corpName" value=<%=corpName%>></td>
				</tr>
				<tr>
					<td>고객등급</td>
					<td><input type="text" name="grade" value=<%=grade%>></td>
				</tr>	
				<tr>
					<td>예치금</td>
					<td><input type="text" name="credit" value=<%=credit%>></td>
				</tr>
				<tr>
					<td></td>
					<td align="right">
					<input type="submit" name="submit" value="수정하기" />
					</td>
				</tr>
				<tr>
					<input type="hidden" name="originalId" value=<%=id%>>
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
		location.href="CargoOwnerUpdate.jsp";
	}
	function Logout(){
		location.href="Login.jsp";
	}
</script>