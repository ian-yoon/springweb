<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSP - product detail</title>
<script>
	function drug_delete() {
		if (confirm("Delete this product?")) {
			document.form1.action = "/project01/shop/drug/delete.do";
			document.form1.submit();
		}
	}
</script>
<style>
table {
margin-left: auto;
margin-right: auto;
}
th, td {
	padding: 10px;
}
#hello {
	background-color: #cfcfcf;
}
tbody tr:nth-child(even) {
	background-color: #e6e6e6;
}
</style>
</head>
<body>

	<%@ include file="../include/menu.jsp"%>

		<table width="1000px">
			<colgroup>
				<col width=20% />
				<col width=60% />
				<col width=20% />
			</colgroup>
			<tr>
				<td id="hello"><span style="font-weight:bold">NAME</span></td>
				<td>${dto.drug_name}</td>
				<td><c:choose>
						<c:when test="${sessionScope.userid == 'admin'}">
							<input type="hidden" name="drug_code" value="${dto.drug_code}">
							<a href="/project01/shop/drug/edit/${dto.drug_code}"><button
									type="button">Revise</button></a>
							<button type="button" onclick="drug_delete()">Delete</button>
						</c:when>
					</c:choose></td>
			</tr>
			<tr>
				<td id="hello"><span style="font-weight:bold">INDICATION</span></td>
				<td>${dto.indication}</td>
				<td></td>
			</tr>
			<tr>
				<td id="hello"><span style="font-weight:bold">DOSAGE</span></td>
				<td>${dto.dose}</td>
				<td></td>
			</tr>
			<tr>
				<td id="hello"><span style="font-weight:bold">PRICE</span></td>
				<td>${dto.price}</td>
				<td>
					<form name="form1" method="post"
						action="/project01/shop/cart/insert.do">
						<input type="hidden" name="drug_code" value="${dto.drug_code}">
						<select name="amount">
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> <input type="submit" value="My List">
					</form>
				</td>
			</tr>
			<tr>
				<td id="hello"><span style="font-weight:bold">SIDE EFFECT</span></td>
				<td>${dto.side_effect}</td>
				<td></td>
			</tr>
			<tr>
				<td id="hello"><span style="font-weight:bold">ALLERGY</span></td>
				<td>${dto.allergy}</td>
				<td></td>
			</tr>
			<tr>
				<td id="hello"><span style="font-weight:bold">PREGNANCY</span></td>
				<td>${dto.pregnancy}</td>
				<td></td>
			</tr>
		</table>

</body>
</html>