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
					else
					{		
						ResultSet rs = stmt.executeQuery("Delete From Spaceship where name =" + "'" + spaceshipName + "'");
						out.print("<script>alert('삭제가 완료되었습니다.'); document.location.href='SpaceshipDelete.jsp';</script>");

					}
				%>
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
		location.href="SpaceshipDelete.jsp";
	}
	function Logout(){
		location.href="../LOGIN/Login.jsp";
	}
</script>