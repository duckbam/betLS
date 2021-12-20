<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<style>
table {
    margin-left:auto; 
    margin-right:auto;
}
</style>

<body>
<h3>관리페이지 | 경기관리</h3>
	<button type="button" class="btn btn-success" onclick="location.href='gameAdd'">경기추가</button>
	
	<c:set var="soccerCount" value="${0}" />
	<c:if test="${ soccerDB.isEmpty() == false}">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">종목</th>
					<th scope="col">홈팀vs원정팀</th>
					<th scope="col">승</th>
					<th scope="col">무</th>
					<th scope="col">패</th>
					<th scope="col">경기일시</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${soccerDB }">
					<c:set var="soccerCount" value="${soccerCount+1 }" />
					<tr>
						<td><a href="gameInfo?info=${dto.getNum()}" style="color: black; text-decoration-line: none;">${dto.getNum() }</a></td>
						<td>${dto.getEvent()}</td>
						<td>${dto.getTeam()}</td>
						<td>${dto.getWin()}</td>
						<td>${dto.getDraw()}</td>
						<td>${dto.getLose()}</td>
						<td>${dto.getTime()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	total: ${soccerCount}

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
