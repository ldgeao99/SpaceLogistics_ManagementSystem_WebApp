<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>JSP Page</title> 
	</head> 
	
	<body> 
		<% 
			session.removeAttribute("ID"); 
			session.invalidate();
		%> 
		
		<script LANGUAGE='JavaScript'>
				alert('로그아웃되었습니다.'); 
				location.href="Login.jsp";
		</script>	
	</body> 	
</html>
