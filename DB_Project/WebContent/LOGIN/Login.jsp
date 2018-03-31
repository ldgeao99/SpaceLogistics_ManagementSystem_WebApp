<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Login Page</title>
	</head>

	<body> 
		<center>
		<div>
			<br><br><br><br><br><br><br><br><br><br><br>
			<h2>LOGIN</h2> 
			<form action="LoginCheck.jsp" method="post">
				<table>
					<tr>
						<td align="right">아이디 :</td><td> <input type="text" name="user_id" size=15></tr>
			 			<td align="right">비밀번호 :</td><td> <input type="password" name="user_pw" size=15></tr>
			 			<td><input type="button" value="회원가입" onclick="SignUp()"></td> 
			 			<td align="right"><input type="submit" value="로그인"></td>
			 		</tr>
			 	</table> 
			</form> 
		</div>	 
		</center> 
	</body>
</html>

<script type="text/javascript">
	function SignUp(){
		location.href="SignUp.jsp";
	}
</script>