<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="${root}index?formpath=home"><img
				src="resources/img/betlslogo.png"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:choose>
					<c:when test="${id.isEmpty() == false }">
					<li class="nav-item"><a class="nav-link" href="${root}index?formpath=gameList"><img
							src="resources/img/sports.png"></a></li>
					</c:when>
					<c:otherwise>
					<li class="nav-item"><a class="nav-link" href="${root}index?formpath=login"><img
							src="resources/img/sports.png"></a></li>
					</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" href="https://discord.gg/5MDqfE8ARZ"><img
							src="resources/img/customer.png"></a></li>
				</ul>
				<form class="d-flex">
					<c:choose>
						<c:when test="${id.isEmpty() == false && type == 'admin'}">
							<a class="nav-link" href="#" style="color:black">관리자님</a>
							<button type="button" class="btn btn-warning" onclick="location.href='adminpage'">관리페이지</button>
							<button type="button" class="btn btn-success" onclick="location.href='logout'">로그아웃</button>
						</c:when>
						<c:when test="${id.isEmpty() == false && type == 'user'}">
							<a class="nav-link" href="#" style="color:black">[회원] ${id}님</a>
							<button type="button" class="btn btn-warning" onclick="location.href='mypage'">마이페이지</button>
							<button type="button" class="btn btn-success" onclick="location.href='logout'">로그아웃</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-warning" onclick="location.href='${root}index?formpath=login'">로그인</button>
							<button type="button" class="btn btn-success" onclick="location.href='${root}index?formpath=join'">회원가입</button>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
		</div>
	</nav>
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
