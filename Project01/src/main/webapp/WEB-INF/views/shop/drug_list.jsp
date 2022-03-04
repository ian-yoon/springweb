<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSP</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "/project01/shop/drug/write.do";
		});
	});
	function search_list(page) {
		location.href = "/project01/shop/drug/search_list.do?cur_page=" + page
				+ "&search_option=${search_option}&keyword=${keyword}";
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
.hi {
	background-color: #cfcfcf;
}
tbody tr:nth-child(even) {
	background-color: #e6e6e6;
}
</style>
</head>

<body>

	<%@ include file="../include/menu.jsp"%>

	<br>
	
	<div style="text-align:center">
		<form name="form1" method="post"
			action="/project01/shop/drug/search_list.do">
			<select name="search_option">
				<option value="name"
					<c:out value="${search_option == 'name' ? 'selected' : '' }" />>Product
					Name</option>
				<option value="indication"
					<c:out value="${search_option == 'indication' ? 'selected' : '' }" />>Indication</option>
			</select> <input name="keyword" value="${keyword}"> <input
				type="submit" value="SEARCH">
		</form>
	</div>

	<input type="hidden" name="count" value="${count}">
	
	<br>

		<table width="1000px">
		<thead class="hi">
			<tr>
				<th>NAME</th>
				<th>INDICATIONS</th>
				<th>DOSAGE</th>
				<th>PRICE</th>
				<th>&nbsp;&nbsp;&nbsp;</th>
			</tr>
		</thead>
			<c:forEach var="row" items="${list}">
				<tr>
					<td><a href="/project01/shop/drug/detail/${row.drug_code}">${row.drug_name}</a></td>
					<td>${row.indication}</td>
					<td>${row.dose}</td>
					<td><fmt:formatNumber value="${row.price}" pattern="#,###.##" /></td>
					<td><form name="form1" method="post"
							action="/project01/shop/cart/insert.do">
							<input type="hidden" name="drug_code" value="${row.drug_code}">
							<select name="amount">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>&nbsp; <input type="submit" value="My List">
						</form></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center"><c:if
						test="${page_info.curBlock > 1}">
						<a href="javascript:list('1')">FRONT</a>
					</c:if>
					<c:if test="${page_info.curBlock > 1}">
						<a href="javascript:list('${map.page_info.prevPage}')">PREV</a>
					</c:if>
					<c:forEach var="num" begin="${page_info.blockBegin}"
						end="${page_info.blockEnd}">
						<c:choose>
							<c:when test="${num == page_info.curPage}">
								<span style="color: teal">${num}</span>&nbsp;
						</c:when>
							<c:otherwise>
								<a href=javascript:list('${num}')>${num}</a>&nbsp;
						</c:otherwise>
						</c:choose>
					</c:forEach> 
					<c:if test="{page_info.curBlock <= page_info.totBlock}">
						<a href="javascript:list('${page_info.nextPage}')">NEXT</a>
					</c:if>
					<c:if test="${page_info.curPage <= page_info.totPage}">
						<a href="javascript:list('${page_info.totPage}')">END</a>
					</c:if></td>
			</tr>
		</table>

</body>
</html>
