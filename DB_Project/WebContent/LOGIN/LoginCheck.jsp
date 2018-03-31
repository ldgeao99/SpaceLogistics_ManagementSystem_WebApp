<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%@page import = "java.sql.*"%>

<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>LoginCheck Page</title> 
	</head> 
	<body> 
		<% 
		String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

		String user_id=request.getParameter("user_id");
		String user_pw=request.getParameter("user_pw");
		boolean isExist = false;
		
		String id = null;
		String pw = null;
		String authority = null;
		
		if( user_id.equals("") || user_pw.equals(""))
		{
			out.println("<script>alert('아이디와 비밀번호를 모두 입력하세요.'); history.go(-1);</script>"); //경고 메시지 띄우고 이전 페이지로 돌아감.
		}
		else
		{
			try
			{
				Connection con = DriverManager.getConnection(DB_URL, "system", "Ldgeao0242");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from Users");
				
				while(rs.next())
				{
					id = rs.getString("userId");//테이블 어트리뷰트
					pw = rs.getString("userPw");
					authority = rs.getString("authority");
					
					if(id.equals(user_id) && pw.equals(user_pw))
					{
						session.setAttribute("user_id",id);
						isExist = true;
						break;
					}
				}
				
				rs.close();
				stmt.close();
				con.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			if(isExist)
			{
				session.removeAttribute("ID"); 
				session.setAttribute("ID", user_id);
				
				if(authority == null)
				{
					response.sendRedirect("../POSITIONS/NullUser.jsp");
				}
				else
				{
					if(authority.equals("admin")){
						response.sendRedirect("../POSITIONS/Admin.jsp");
					}
					else if(authority.equals("crew")){
						response.sendRedirect("../POSITIONS/Crew.jsp");
					}
					else if(authority.equals("cargoOwner")){
						response.sendRedirect("../POSITIONS/CargoOwner.jsp");
					}
				}		
			}
			
			if(!isExist)
			{
				out.print("<script LANGUAGE='JavaScript'>");
				out.print("alert('아이디와 비밀번호를 확인하십시오.'); history.go(-1);");
				out.print("</script>");
			}
		}
		
		%> 
	</body> 
</html>