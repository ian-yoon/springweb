<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSP - sign in</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnLogin").click(function() {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("Enter the ID.");
				$("#userid").focus();
				return;
			}
			if (passwd == "") {
				alert("Enter the password.");
				$("#passwd").focus();
				return;
			}
			document.form1.action = "/project01/member/login_check.do";
			document.form1.submit();
		});
	});
</script>
<style>
table {
margin-left: auto;
margin-right: auto;
}
th, td {
	padding: 5px;
}
</style>
</head>
<body>

	<%@ include file="../include/menu.jsp"%>

<br>

	<div style="text-align: center;">

		<form name="form1" method="post">
			<table width="400px">
				<tr>
					<td><span style="font-weight:bold">ID</span></td>
					<td><input id="userid" name="userid"></td>
					<td rowspan="2" align="center">
						<button type="button" id="btnLogin">Sign In</button> <c:if
							test="${message == 'error'}">
							<div style="color: teal;">Check your ID or PASSWORD</div>
						</c:if> <c:if test="${message == 'logout'}">
							<div style="color: teal;">Sign Out</div>
						</c:if> <c:if test="${param.message == 'nologin'}">
							<div style="color: red;">You Can Access After Signing In</div>
						</c:if>
					</td>
				</tr>
				<tr>
					<td><span style="font-weight:bold">PASSWORD</span></td>
					<td><input type="password" id="passwd" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<button type="button"
							onclick="location.href='/project01/member/join.do'">Join
							Us</button>
					</td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>