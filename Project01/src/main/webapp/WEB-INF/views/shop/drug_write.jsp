<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSP - register new product</title>

<script>
	function drug_write() {
		var drug_name = document.form1.drug_name.value;
		var indication = document.form1.indication.value;
		var dose = document.form1.dose.value;
		var price = document.form1.price.value;
		var side_effect = document.form1.side_effect.value;
		var allergy = document.form1.allergy.value;
		var pregnancy = document.form1.pregnancy.value;
		if (drug_name == "") {
			alert("You must enter the name of the product.");
			document.form1.drug_name.focus();
			return;
		}
		if (indication == "") {
			alert("You must enter the indications related to the product.");
			document.form1.indication.focus();
			return;
		}
		if (dose == "") {
			alert("You must enter the dosage of the product.");
			document.form1.dose.focus();
			return;
		}
		if (price == "") {
			alert("You must enter the price of the product.");
			document.form1.price.focus();
			return;
		}
		document.form1.action = "/project01/shop/drug/insert.do";
		document.form1.submit();
	}
</script>
<style>
table {
margin-left: auto;
margin-right: auto;
}
th, td {
padding:10px;
}
#hello {
	background-color: #cfcfcf;
}
</style>
</head>

<body>

	<%@ include file="../include/menu.jsp"%>

<br>

		<form name="form1" method="post">
			<table>
				<tr>
					<td id="hello"><span style="font-weight:bold">NAME</span></td>
					<td><input name="drug_name"></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">INDICATION</span></td>
					<td><textarea rows="5" cols="80" name="indication"></textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">DOSAGE</span></td>
					<td><textarea rows="3" cols="80" name="dose"></textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">PRICE</span></td>
					<td><input name="price"></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">SIDE EFFECT</span></td>
					<td><textarea rows="5" cols="80" name="side_effect"></textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">ALLERGY</span></td>
					<td><textarea rows="5" cols="80" name="allergy"></textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">PREGNANCY</span></td>
					<td><textarea rows="5" cols="80" name="pregnancy"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="REGISTER" onclick="drug_write()"> <input
						type="button" value="CANCEL"
						onclick="location.href='/project01/shop/drug/list.do'"></td>
				</tr>
			</table>
		</form>
</body>
</html>