<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnDelete").click(function() {
			if (confirm("Delete all products in your My List?")) {
				location.href = "/project01/shop/cart/deleteAll.do";
			}
		});
	});
</script>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}
th, td {
	padding: 10px;
}
.hi {
	background-color: #cfcfcf;
}
tbody tr:nth-child(even) {
	background-color: #e6e6e6;
}
</style>
<title>MSP - my list</title>

</head>
<body>

	<%@ include file="../include/menu.jsp"%>

	<br>

	<div style="text-align: center">
		<h2>My List</h2>
	</div>

	<c:choose>
		<c:when test="${map.count == 0}">
			<div style="text-align: center;">My List is empty.</div>
		</c:when>
		<c:otherwise>
			<form id="form1" name="form1" method="post" action="update.do">
				<table width="800px">
					<tr>
						<td colspan="4" align="right">
							<button type="button" id="btnDelete">DELETE ALL</button>
						</td>
					</tr>
					<tr>
						<th>NAME</th>
						<th>PRICE</th>
						<th>AMOUNT</th>
						<th>TOTAL</th>
					</tr>
					<c:forEach var="row" items="${map.list}">
						<tr>
							<td>${row.drug_name}</td>
							<td>${row.price}</td>
							<td><input type="number" style="width: 50px;" min="0"
								max="100" name="amount" value="${row.amount}"> <input
								type="hidden" name="cart_id" value="${row.cart_id}">
								<button id="btnUpdate">REVISE</button>
								<button
									onclick="location.href='delete.do?cart_id=${row.cart_id}'">DELETE</button>
							</td>
							<td><fmt:formatNumber value="${row.money}"
									pattern="#,###.##" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4" rowspan="2" align="right"><b>INSURANCE
								PAYMENT</b>&nbsp; <fmt:formatNumber value="${map.insurance}"
								pattern="#,###,###.##" /><br> <b>CONTRIBUTION</b>&nbsp; <fmt:formatNumber
								value="${map.contribution}" pattern="#,###,###.##" /><br>
							<hr> <b>TOTAL</b>&nbsp; <fmt:formatNumber value="${map.sum}"
								pattern="#,###,###.##" /></td>
					</tr>
				</table>
				<br>
				<div style="text-align: center;">
					<button type="button" onclick="location.href='/project01/pdf/list.do'">Export In PDF</button>
				</div>
			</form>

		</c:otherwise>
	</c:choose>

</body>
</html>