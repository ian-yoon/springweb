<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
#pad {
padding: 20px;
}
a {
text-decoration: none;
}
</style>

<div id="pad">
<div style="text-align:left;">
<a href="/project01/"><span style="font-weight:bold; font-size:25px; color:teal;">MSP</span></a>
</div>

<div style="text-align:right;">
<c:choose>
	<c:when test="${sessionScope.userid == null}">
		<a href="/project01/member/login.do">Sign In &nbsp;</a>
	</c:when>
	<c:otherwise>
		${sessionScope.name} &nbsp;
		<a href="/project01/member/logout.do">Sign Out &nbsp;</a>
	</c:otherwise>
</c:choose>

<a href="/project01/shop/cart/list.do">My List &nbsp;</a>

<c:if test="${sessionScope.userid == 'admin'}">
	<button type="button" id="btnAdd">Register</button>
</c:if>
</div>

<hr>

</div>