<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import = "java.sql.*"%>

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>CrewRegister Page</title>
	</head>

	<body> 
	
	<%
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	try
	{
		Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("Select * From Users");
		
		String userId = null;
		String password = null;
		String name = null;
		String telephone = null;
	
		
		userId = request.getParameter("userId");
		password = request.getParameter("password");
		name = request.getParameter("name");
		telephone = request.getParameter("telephone");
		
		
		ResultSet tempRs = stmt.executeQuery("Select count(*) From Users where userId =" + "'" + userId + "'");
		tempRs.next();
		int count = tempRs.getInt("count(*)");
		
		//if() 아이디가 존재한다면 수정하라고 하고 뒤로 다시 가기
		if(userId.equals("") || password.equals("") || name.equals("") || telephone.equals(""))
		{
			out.println("<script>alert('빈칸이 존재합니다 모두 입력하세요.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
		}
		else if(count > 0)
		{	
			out.println("<script>alert('이미 존재하는 아이디 입니다. 수정해주세요.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
			System.out.println("쿼리결과 : " + count);
		}
		else
		{
			stmt.executeUpdate("INSERT INTO Users VALUES("
					+ "'" + userId + "',"
					+ "'" + password + "',"
					+ " null,"
					+ "'" + name + "',"
					+ "'" + telephone + "'"
					+")");
			stmt.executeUpdate("commit work");		
			out.print("<script>alert('계정이 정상적으로 등록되었습니다.'); location.href='Login.jsp';</script>");
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
		location.href="../POSITIONS/Admin.jsp";
	}
	function Logout(){
		location.href="../LOGIN/Login.jsp";
	}
</script>