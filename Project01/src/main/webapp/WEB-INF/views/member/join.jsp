<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSP - join us</title>
<style>
table {
margin-left: auto;
margin-right: auto;
}
th, td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<div style="text-align: center;">

		<form name="form1" method="post" action="/project01/member/insert.do">
			<table width="400px">
				<tr>
					<td><span style="font-weight:bold">ID</span></td>
					<td><input name="userid"></td>
				</tr>
				<tr>
					<td><span style="font-weight:bold">PASSWORD</span></td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td><span style="font-weight:bold">NAME</span></td>
					<td><input name="name"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="JOIN"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>