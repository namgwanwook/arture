<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="f_sitemap">
		<li><a href="${contextPath }/main/main.do">MAIN</a></li>
		<li><a href="${contextPath }/gallery/gallery.do">GALLERY</a></li>
		<li><a href="${contextPath }/applyForm/applyForm.do">CONTACT US</a></li>
	</ul>
	<p class="f_copy">COPYRIGHT © 2020 ARTURE. ALL RIGHTS RESERVED.</p>
</body>
</html>