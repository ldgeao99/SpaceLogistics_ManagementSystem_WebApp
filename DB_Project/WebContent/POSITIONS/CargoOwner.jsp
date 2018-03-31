<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>CargoOwner Page</title>
	</head> 
	<body> 
		<center>
			<td><input type="submit" value="로그아웃" onclick="Logout()"></td>
			<br><br><br><br><br><br><br><br><br><br><br>
			<h2>(<%=(String)session.getAttribute("ID")%>)님 반갑습니다.</h2>  
			
			<form action="../LOGIN/Logout.jsp" method="post">
				<table>
					<tr>
						<td>화물</td>
			 			<td><input type="button" value="등록" onclick="CargoRegister()"></td>
			 			<td><input type="button" value="검색" onclick="CargoSearch()"></td>
			 			<td><input type="button" value="수정" onclick="CargoUpdate()"></td>
			 			<td><input type="button" value="삭제" onclick="CargoDelete()"></td>
			 		</tr>
			 	</table> 
			</form> 
		</center> 
	</body>
</html>


<script type="text/javascript">
	function Logout(){
		location.href="../LOGIN/Logout.jsp";
	}
	function CargoRegister(){
		location.href="../CARGOOWNER/CargoRegister.jsp";
	}
	function CargoSearch(){
		location.href="../CARGOOWNER/CargoSearch.jsp";
	}
	function CargoUpdate(){
		location.href="../CARGOOWNER/CargoUpdate.jsp";
	}
	function CargoDelete(){
		location.href="../CARGOOWNER/CargoDelete.jsp";
	}
</script>
