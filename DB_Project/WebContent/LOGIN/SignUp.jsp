<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Sign up Page</title>
	</head> 
	<body> 
		<center> 
			<br><br><br><br><br><br><br><br><br><br><br>
			<h2>SIGN UP</h2> 
			<form action="SignUpCheck.jsp" method="post">
				<table>
					<tr>
						<td>아이디 :</td><td> <input type="text" name="userId" size=15></tr>
			 			<td>비밀번호 :</td><td> <input type="password" name="password" size=15></tr>
			 			<td>이름 :</td><td> <input type="text" name="name" size=15></tr>
			 			<td>전화번호 :</td><td> <input type="text" name="telephone" size=15></tr>
			 			<td><input type="button" value="취소" onclick="GoBack()"></td> <td align="right"><input type="submit" value="가입하기"></td>
			 		</tr>
			 	</table> 
			</form> 
		</center> 
	</body>
</html>

<script type="text/javascript">
	function GoBack(){
		history.go(-1)();
	}
</script>