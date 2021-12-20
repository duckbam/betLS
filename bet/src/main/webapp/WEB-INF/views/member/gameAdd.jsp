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
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}
</script>
<body>
	<h3>관리페이지 | 경기추가</h3>
		<h5 style="text-align: center">
		<font color="red" id="msg">${msg }</font>
		</h5>
	<form action=gameAddProc method="post" style="margin-top: 30px; margin-bottom: 30px;">
		<table>
			<tr>
				<td><label for="basic-url">번호</label></td>
				<td>
				<select name="num" class="form-control">
				<option value="one">1</option>
				<option value="two">2</option>
				<option value="three">3</option>
				<option value="four">4</option>
				<option value="five">5</option>
				<option value="six">6</option>
				<option value="seven">7</option>
				<option value="eight">8</option>
				<option value="nine">9</option>
				<option value="ten">10</option>
				<option value="tenone">11</option>
				<option value="tentwo">12</option>
				<option value="tenthree">13</option>
				<option value="tenfour">14</option>
				<option value="tenfive">15</option>
				<option value="tensix">16</option>
				<option value="tenseven">17</option>
				<option value="teneight">18</option>
				<option value="tennine">19</option>
				<option value="twoten">20</option>
				</select>
				
				</td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td><label for="basic-url">종목</label></td>
				<td><input type=text name='event' id='event' class="form-control"/></td>
				<td colspan="2"></td>
			</tr>
			
			<tr>
				<td>팀</td>
				<td><input type=text name='team' id="team" class="form-control"/></td>
				<td colspan="2"></td>
			</tr>
			
			<tr>
				<td>승리 배당</td>
				<td><input type=text name='win1' id="win1"
					class="form-control" maxlength="8"
					oninput="numberMaxLength(this);"/></td>
				<td colspan="2"></td>
			</tr>
			
			<tr>
				<td>무승부 배당</td>
				<td><input type=text name='draw1' id="draw1"
					class="form-control" maxlength="8"
					oninput="numberMaxLength(this);"/></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>패배 배당</td>
				<td><input type=text name='lose1' id="lose1"
					class="form-control" maxlength="8"
					oninput="numberMaxLength(this);"/></td>
				<td colspan="2"></td>
			</tr>
		 	<tr>
				<td>경기일시</td>
				<td><input type=text name='time' id="time" class="form-control"/></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4><input type=submit
					value='추가' class="btn btn-warning" style="width: 120px;" /> <input type=button value='취소'
					class="btn btn-success" onclick="location.href='gameManage'"style="width: 120px;" /></td>
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
