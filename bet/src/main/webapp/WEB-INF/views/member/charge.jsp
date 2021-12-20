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
<script>
function charge() {
    	document.getElementById('f').submit();
}

function numberMaxLength(e){
       if(e.value.length > e.maxLength){
           e.value = e.value.slice(0, e.maxLength);
       }
   }
</script>
<body>
	<h3>마이페이지 | 충전신청</h3>
		<h5 style="text-align: center">
		<font color="red" id="msg">${msg }</font>
		</h5>
		<h5 style="text-align: center">((계좌 RP(서버 내 계좌 기능 없음): Earl_Fitzgerald / Mohamed Salman에게 송금해주시면 됩니다.))</h5>
	<form id='f' action=chargeProc method="post">
		<table style="margin-bottom: 140px; margin-top: 80px;">
			<tr>
				<td>보유머니</td>
				<td><input type=number name='money' value="${userDTO.getMoney()}" class="form-control" readonly="readonly"/></td>
			</tr>
				<tr>
				<td>충전금액</td>
				<td><input type=number name='chargeMoney1' placeholder='충전 금액 입력' class="form-control" maxlength="8" oninput="numberMaxLength(this);"/></td>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4><input type=button
					value='충전' onclick="charge()" class="btn btn-warning" style="width: 120px;" /> <input type=reset value='취소'
					class="btn btn-success" onclick="location.href='mypage'" style="width: 120px;" /></td>
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
