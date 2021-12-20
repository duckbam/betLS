<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>betLS</title>
<body>
<div align="center">
	<table style="width: 100%">
		<tr>
			<td><%@ include file="common/top.jsp" %></td>
		</tr>
			<td><c:import url="/${formpath }" /> </td>
		<tr>
			<td><%@ include file="common/footer.jsp" %></td>
		</tr>
	</table>
	</div>
</body>
</html>
