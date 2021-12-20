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
<c:if test="${empty sessionScope.id}">
	<script>
		alert('로그인 후 이용하실 수 있습니다.')
		location.href = 'index?formpath=home'
	</script>
</c:if>
	<form action="gameChecks" method="post">
		<div id="wrapper" class="toggled">
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="index?formpath=soccer">스포츠게임</a></li>
					<li style="color: white;">보유머니: ${userDB.getMoney()} USD</li>
					<li>
						<nav class="navbar navbar-light">
								<input class="form-control mr-sm-2" name="betMoney" type="number"
									placeholder="배팅 금액" style="width: 190px;">
								<button class="btn btn-success my-2 my-sm-0"
									type="submit">배팅</button>
						</nav>
					</li>
					<li style="color: red;">${msg}</li>
				</ul>
			</div>
			<div id="page-content-wrapper">
				<div class="container-fluid">
					<c:set var="soccerCount" value="${0}" />
					<c:if test="${ soccerDB.isEmpty() == false}">
						<table class="table table-dark table-striped">
							<thead>
								<tr>
									<th scope="col">종목</th>
									<th scope="col">홈팀vs원정팀</th>
									<th scope="col">배당률 선택</th>
									<th scope="col">경기일시</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${soccerDB }">
									<c:set var="soccerCount" value="${soccerCount+1 }" />
									<tr>
										<td>${dto.getEvent()}</td>
										<td>${dto.getTeam()}</td>
										<td><div class="btn-group" role="group">
										    <input type="radio" name="${dto.getNum()}" class="btn-check" value="${dto.getTeam()} 승(${dto.getWin()})" 
										    id="${dto.getTeam()} 승(${dto.getWin()})">
										    <label class="btn btn-outline-primary" for="${dto.getTeam()} 승(${dto.getWin()})">승 ${dto.getWin()}</label>
										
										    <input type="radio" name="${dto.getNum()}" class="btn-check" value="${dto.getTeam()} 무(${dto.getDraw()})" 
										    id="${dto.getTeam()} 무(${dto.getDraw()})">
										    <label class="btn btn-outline-success" for="${dto.getTeam()} 무(${dto.getDraw()})">무 ${dto.getDraw()}</label>
										
										    <input type="radio" name="${dto.getNum()}" class="btn-check" value="${dto.getTeam()} 패(${dto.getLose()})" 
										    id="${dto.getTeam()} 패(${dto.getLose()})">
										    <label class="btn btn-outline-danger" for="${dto.getTeam()} 패(${dto.getLose()})">패 ${dto.getLose()}</label>
										</div>
										<td>${dto.getTime()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					total: ${soccerCount}
				</div>
			</div>

		</div>
	</form>

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
