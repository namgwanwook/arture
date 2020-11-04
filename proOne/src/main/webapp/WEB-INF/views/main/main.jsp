<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main 페이지</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<style>
button{
	display:block;
	width:150px;
	height:50px;
	background-color:red;
	border-radius:50px;
	border:0;
	margin:0 auto;
}
</style>
<body>
	<h1>TEST. 메인 페이지.</h1>
	
	<div class="image1">
		<h1>첫 번째 이미지 자리</h1>
	</div>
	
	<div class="image2">
		<h1>두 번째 이미지 자리</h1>
	</div>
	
	<div class="image3">
		<h1>세 번째 이미지 자리</h1>
	</div>
	
	<div class="table">
		<div class="left-box"></div>
		<div class="right-box"></div>
	</div>
	<button><a href="${contextPath }/applyForm/applyForm.do">신청하기</a></button>

	
</body>
</html>