<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSP - product edit</title>
<script>
	function drug_update() {
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
		document.form1.action = "/project01/shop/drug/update.do";
		document.form1.submit();
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
</style>

</head>

<body>


	<%@ include file="../include/menu.jsp"%>

		<form id="form1" name="form1" method="post">
			<table>
				<tr>
					<td id="hello"><span style="font-weight:bold">NAME</span></td>
					<td><input name="drug_name" value="${dto.drug_name}"></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">INDICATION</span></td>
					<td><textarea rows="5" cols="60" name="indication"
							id="indication">${dto.indication}</textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">DOSAGE</span></td>
					<td><textarea rows="3" cols="60" name="dose" id="dose">${dto.dose}</textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">PRICE</span></td>
					<td><input name="price" value="${dto.price}"></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">SIDE EFFECT</span></td>
					<td><textarea rows="5" cols="60" name="side_effect"
							id="side_effect">${dto.side_effect}</textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">ALLERGY</span></td>
					<td><textarea rows="5" cols="60" name="allergy" id="allergy">${dto.allergy}</textarea></td>
				</tr>
				<tr>
					<td id="hello"><span style="font-weight:bold">PREGNANCY</span></td>
					<td><textarea rows="5" cols="60" name="pregnancy"
							id="pregnancy">${dto.pregnancy}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="hidden"
						name="drug_code" value="${dto.drug_code}"> <input
						type="button" value="REGISTER" onclick="drug_update()"> <input
						type="button" value="CANCEL"
						onclick="location.href='/project01/shop/drug/list.do'"></td>
				</tr>
			</table>
		</form>

</body>
</html>