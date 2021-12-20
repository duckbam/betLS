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
	margin-left: auto;
	margin-right: auto;
}
</style>

<script>
</script>
<body>
	<form action=gameComplete method="post"
		style="margin-top: 30px; margin-bottom: 30px;">
		<table>
			<c:if test="${one == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='one' value='${one}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${two == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='two' value='${two}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${three == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='three' value='${three}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${four == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='four' value='${four}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${five == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='five' value='${five}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${six == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='six' value='${six}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${seven == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='seven' value='${seven}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${eight == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='eight' value='${eight}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${nine == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='nine' value='${nine}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${ten == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='ten' value='${ten}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tenone == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tenone' value='${tenone}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tentwo == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tentwo' value='${tentwo}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tenthree == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tenthree' value='${tenthree}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tenfour == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tenfour' value='${tenfour}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tenfive == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tenfive' value='${tenfive}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tensix == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tensix' value='${tensix}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${teneight == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='teneight' value='${teneight}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${tennine == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='tennine' value='${tennine}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<c:if test="${twoten == '100' == false }">
				<tr>
					<td><label for="basic-url">경기</label></td>
					<td><input type=text name='twoten' value='${twoten}'
						readonly="readonly" class="form-control" /></td>
					<td colspan="2"></td>
				</tr>
			</c:if>
			<tr>
				<td><label for="basic-url">배당</label></td>
				<td><input type=text name='game_result' value='${game_result}'
					readonly="readonly" class="form-control" /></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td><label for="basic-url">배팅금액</label></td>
				<td><input type=text name='betMoney' value='${betMoney}'
					readonly="readonly" class="form-control" /></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td><label for="basic-url">적중금액</label></td>
				<td><input type=text name='result' value='${result}'
					readonly="readonly" class="form-control" /></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4><input type=submit
					value='배팅확정' class="btn btn-warning" style="width: 120px;" /> <input
					type=button value='취소' class="btn btn-success"
					onclick="location.href='index?formpath=gameList'" style="width: 120px;" /></td>
			</tr>
		</table>
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
