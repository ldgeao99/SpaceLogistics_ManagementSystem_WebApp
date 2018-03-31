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
			 			<td><input type="button" value="선적하기" onclick="Shipment()"></td>
			 			<td><input type="button" value="선적취소" onclick="NonShipment()"></td>
			 			<td><input type="button" value="동일목적지화물 보기" onclick="SameDestiSearchResult()"></td>	
			 		</tr>
			 		<tr>
			 			<td>물품</td>
			 			<td><input type="button" value="물품신청" onclick="CargoDelete()"></td>
			 			<td></td>
			 			<td></td>
			 		</tr>
			 		<tr>
			 			<td>선박</td>
			 			<td><input type="button" value="상태변경" onclick="ChangeSpaceshipState()"></td>
			 			<td></td>
			 			<td></td>
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
	function Shipment(){
		location.href="../CREW/Shipment.jsp";
	}
	function NonShipment(){
		location.href="../CREW/NonShipment.jsp";
	}
	function SameDestiSearchResult(){
		location.href="../CREW/SameDestiSearchResult.jsp";
	}
	function ChangeSpaceshipState(){
		location.href="../CREW/ChangeSpaceshipState.jsp";
	}
</script>
