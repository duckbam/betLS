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
<script>
function normalDelete() {
    if (!confirm("배팅내역을 삭제하시겠습니까?")) {
    } else {
    	alert("배팅내역이 삭제되었습니다.");
    	location.href='bettingDelete?info=${bettingInfo.getNum()}'
    }
}
</script>
<body>
<form action="bettingModify" method="post">
	<table class="table" style="margin-bottom: 67px;">
		<thead>
			<tr>
				<th scope="col">정보</th>
				<th scope="col">내용</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${bettingInfo.getOne() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getOne()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTwo() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTwo()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getThree() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getThree()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getFour() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getFour()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getFive() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getFive()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getSix() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getSix()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getSeven() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getSeven()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getEight() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getEight()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getNine() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getNine()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTen() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTen()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTenone() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTenone()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTentwo() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTentwo()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTenthree() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTenthree()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTenfour() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTenfour()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTenfive() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTenfive()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTensix() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTensix()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTenseven() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTenseven()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTeneight() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTeneight()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTennine() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTennine()}</td>
				</tr>
			</c:if>
			<c:if test="${bettingInfo.getTwoten() == 'X' == false }">
				<tr>
					<th scope="row">경기</th>
					<td>${bettingInfo.getTwoten()}</td>
				</tr>
			</c:if>
			<tr>
				<th scope="row">아이디</th>
				<td>${bettingInfo.getId()}</td>
			</tr>
			<tr>
				<th scope="row">배팅금액</th>
				<td>${bettingInfo.getBetMoney()} USD</td>
			</tr>
			<tr>
				<th scope="row">배당</th>
				<td>${bettingInfo.getGame_result()}배</td>
			</tr>
			<tr>
				<th scope="row">적중금액</th>
				<td>${bettingInfo.getResult()} USD</td>
			</tr>
			<tr>
				<th scope="row">결과</th>
				<td><input type=text name='results'
					value='${bettingInfo.getResults()}' class="form-control"/ style="width: 100px;"></td>
			</tr>
			<tr>
				<th scope="row">번호</th>
				<td><input type=text name='num'
					value='${bettingInfo.getNum()}' readonly="readonly" class="form-control"/ style="width: 100px;"></td>
			</tr>

		</tbody>
	</table>
	<button type="button" class="btn btn-success"
		onclick="location.href='bettingManage'">목록</button>
	<button type="submit" class="btn btn-success">결과수정</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='adminModify?id=${bettingInfo.getId()}'">회원수정</button>
	<button type="button" class="btn btn-success" onclick="normalDelete()">삭제</button>
	</form>

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
