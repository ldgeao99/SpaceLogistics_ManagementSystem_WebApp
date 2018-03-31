<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Admin Page</title>
	</head> 
	<body> 
		
	
		<center> 
			<td><input type="button" value="로그아웃" onclick="Logout()"></td>
			<br><br><br><br><br><br><br><br><br><br><br>
			<h2>(<%=(String)session.getAttribute("ID")%>)님 반갑습니다.</h2>  
			<form action="../LOGIN/Logout.jsp" method="post">
				<table>
					<tr>
						<td>행성</td>
						<td><input type="button" value="등록" onclick="PlanetRegister()"></td>
						<td><input type="button" value="검색" onclick="PlanetSearch()"></td>
						<td><input type="button" value="수정" onclick="PlanetUpdate()"></td>
						<td><input type="button" value="삭제" onclick="PlanetDelete()"></td>						
					</tr>

					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					
					<tr>
						<td>우주선</td>
						<td><input type="button" value="등록" onclick="SpaceshipRegister()"></td>
						<td><input type="button" value="검색" onclick="SpaceshipSearch()"></td>
						<td><input type="button" value="수정" onclick="SpaceshipUpdate()"></td>
						<td><input type="button" value="삭제" onclick="SpaceshipDelete()"></td>						
					</tr>
					
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					
					<tr>
						<td>선원</td>
						<td><input type="button" value="등록" onclick="CrewRegister()"></td>
						<td><input type="button" value="검색" onclick="CrewSearch()"></td>
						<td><input type="button" value="수정" onclick="CrewUpdate()"></td>
						<td><input type="button" value="삭제" onclick="CrewDelete()"></td>						
					</tr>
					
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					
					<tr>
						<td>화주</td>
						<td><input type="button" value="등록" onclick="CargoOwnerRegister()"></td>
						<td><input type="button" value="검색" onclick="CargoOwnerSearch()"></td>
						<td><input type="button" value="수정" onclick="CargoOwnerUpdate()"></td>
						<td><input type="button" value="삭제" onclick="CargoOwnerDelete()"></td>						
					</tr>
					
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					
					<tr>
						<td>사용자</td>
						<td><input type="button" value="보기" onclick="UsersSearch()"></td>					
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
	function PlanetRegister(){
		location.href="../ADMIN/PlanetRegister.jsp";
	}
	function PlanetSearch(){
		location.href="../ADMIN/PlanetSearch.jsp";
	}
	function PlanetUpdate(){
		location.href="../ADMIN/PlanetUpdate.jsp";
	}
	function PlanetDelete(){
		location.href="../ADMIN/PlanetDelete.jsp";
	}
	function SpaceshipRegister(){
		location.href="../ADMIN/SpaceshipRegister.jsp";
	}
	function SpaceshipSearch(){
		location.href="../ADMIN/SpaceshipSearch.jsp";
	}
	function SpaceshipUpdate(){
		location.href="../ADMIN/SpaceshipUpdate.jsp";
	}
	function SpaceshipDelete(){
		location.href="../ADMIN/SpaceshipDelete.jsp";
	}
	function CrewRegister(){
		location.href="../ADMIN/CrewRegister.jsp";
	}
	function CrewSearch(){
		location.href="../ADMIN/CrewSearch.jsp";
	}
	function CrewUpdate(){
		location.href="../ADMIN/CrewUpdate.jsp";
	}
	function CrewDelete(){
		location.href="../ADMIN/CrewDelete.jsp";
	}
	function CargoOwnerRegister(){
		location.href="../ADMIN/CargoOwnerRegister.jsp";
	}
	function CargoOwnerSearch(){
		location.href="../ADMIN/CargoOwnerSearch.jsp";
	}
	function CargoOwnerUpdate(){
		location.href="../ADMIN/CargoOwnerUpdate.jsp";
	}
	function CargoOwnerDelete(){
		location.href="../ADMIN/CargoOwnerDelete.jsp";
	}
	function UsersSearch(){
		location.href="../ADMIN/UsersSearch.jsp";
	}
</script>