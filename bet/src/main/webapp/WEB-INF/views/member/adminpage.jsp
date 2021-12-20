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
body {
	overflow-x: hidden;
}

#wrapper {
	padding-left: 0;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

#wrapper.toggled {
	padding-left: 250px;
}

#sidebar-wrapper {
	z-index: 1000;
	position: fixed;
	left: 250px;
	width: 0;
	height: 100%;
	margin-left: -250px;
	overflow-y: auto;
	background: #000;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

#wrapper.toggled #sidebar-wrapper {
	width: 250px;
}

#page-content-wrapper {
	width: 100%;
	position: absolute;
	padding: 15px;
}

#wrapper.toggled #page-content-wrapper {
	position: absolute;
	margin-right: -250px;
}

/* Sidebar Styles */
.sidebar-nav {
	position: absolute;
	top: 0;
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 20px;
	line-height: 40px;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999999;
}

.sidebar-nav li a:hover {
	text-decoration: none;
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
	height: 65px;
	font-size: 18px;
	line-height: 60px;
}

.sidebar-nav>.sidebar-brand a {
	color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
	color: #fff;
	background: none;
}

@media ( min-width :768px) {
	#wrapper {
		padding-left: 0;
	}
	#wrapper.toggled {
		padding-left: 250px;
	}
	#sidebar-wrapper {
		width: 0;
	}
	#wrapper.toggled #sidebar-wrapper {
		width: 250px;
	}
	#page-content-wrapper {
		padding: 20px;
		position: relative;
	}
	#wrapper.toggled #page-content-wrapper {
		position: relative;
		margin-right: 0;
	}
}
</style>
<body>
	<div id="wrapper" class="toggled">

		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="normalMypage">관리페이지</a></li>
				<li><a href="memberManage">회원관리</a></li>
				<li><a href="chargeManage">충전관리</a></li>
				<li><a href="exchangeManage">환전관리</a></li>
				<li><a href="bettingManage">배팅관리</a></li>
				<li><a href="gameManage">경기관리</a></li>
			</ul>
		</div>
	<div id="page-content-wrapper">
			<c:choose>
			<c:when test="${page == 'memberManage'}">
				<%@ include file="memberManage.jsp" %>
			</c:when>
			<c:when test="${page == 'memberInfo'}">
				<%@ include file="memberInfo.jsp" %>
			</c:when>
			<c:when test="${page == 'chargeInfo'}">
				<%@ include file="chargeInfo.jsp" %>
			</c:when>
			<c:when test="${page == 'exchangeInfo'}">
				<%@ include file="exchangeInfo.jsp" %>
			</c:when>
			<c:when test="${page == 'adminModify'}">
				<%@ include file="adminModify.jsp" %>
			</c:when>
			<c:when test="${page == 'chargeManage'}">
				<%@ include file="chargeManage.jsp" %>
			</c:when>
			<c:when test="${page == 'exchangeManage'}">
				<%@ include file="exchangeManage.jsp" %>
			</c:when>
			<c:when test="${page == 'gameManage'}">
				<%@ include file="gameManage.jsp" %>
			</c:when>
			<c:when test="${page == 'gameAdd'}">
				<%@ include file="gameAdd.jsp" %>
			</c:when>
			<c:when test="${page == 'gameInfo'}">
				<%@ include file="gameInfo.jsp" %>
			</c:when>
			<c:when test="${page == 'gameModify'}">
				<%@ include file="gameModify.jsp" %>
			</c:when>
			<c:when test="${page == 'bettingManage'}">
				<%@ include file="bettingManage.jsp" %>
			</c:when>
			<c:when test="${page == 'bettingManageInfo'}">
				<%@ include file="bettingManageInfo.jsp" %>
			</c:when>
		
			<c:otherwise>
				<h3 style="margin-bottom: 96px;">관리자님 | 관리페이지</h3>
				<p>관리페이지에서 회원/충환전/경기 관리를 할 수 있습니다.</p>
				<p>자세한 사항은 좌측 탭 카테고리를 참고하여 관리페이지 서비스를 이용해주시기 바랍니다.</p>
				<p style="margin-bottom: 150px;">언제나 [betLS]를 이용해주셔서 감사합니다.</p>
			</c:otherwise>
			</c:choose>
		<div class="container-fluid">
			</div>
		</div>

	</div>

	<!-- Footer -->
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
