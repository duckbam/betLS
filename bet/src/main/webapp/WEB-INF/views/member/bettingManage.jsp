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
</style>
<body>
<h3>관리페이지 | 배팅내역 관리</h3>
	<c:set var="bettingCount" value="${0}" />
	<c:if test="${ bettingDB.isEmpty() == false}">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">아이디</th>
					<th scope="col">배팅금액</th>
					<th scope="col">배당</th>
					<th scope="col">적중금액</th>
					<th scope="col">결과</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${bettingDB }">
					<c:set var="bettingCount" value="${bettingCount+1 }" />
					<tr>
						<td><a href="bettingManageInfo?info=${dto.getNum()}"
							style="color: black; text-decoration-line: none;">${dto.getNum()}</a></td>
						<td>${dto.getId()}</td>
						<td>${dto.getBetMoney()}</td>
						<td>${dto.getGame_result()}</td>
						<td>${dto.getResult()}</td>
						<td>${dto.getResults()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	total: ${bettingCount}
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
