<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- style.css로 링크 연결 -->
	<link rel="stylesheet" href="${contextPath }/resources/css/gallery.css">
	</head>
<body>
	<header>
	헤더영역
	</header>
	<section>
		<!-- 갤러리 반복문 실행 -->
		<c:forEach var="galleryList" items="${galleryList }">
		
		<!-- 좋아요 리스트 증감 변수 -->
		<c:set var="a" value="${ a + 1}"/>
		
			<a href="${contextPath }/gallery/detail.do?num=${galleryList.galleryNO}">
				<div class="row">
				  <div class="col-sm-6 col-md-4" style="width: 350px">
				    <div class="thumbnail">
				      <div class="caption"> 
				      <img src="${contextPath }/resources/image/${galleryList.imageFileName}" height="240px" width="290px" healt="이미지1">
				        <p>제목:${galleryList.title }</p>
				        <p>아이디: ${galleryList.id }</p>
				        <p>카테고리: ${galleryList.category }</p>
				        <p>해시태크: ${galleryList.hashtag }</p>
				        <!-- 좋아요 값 출력 -->
					    <p>좋아요:${like.get(a-1)}</p>
				      </div>
				    </div>
				  </div>
				</div>	
			</a>	 
		</c:forEach>
	</section>	
	<footer>
		푸터영역
	</footer>
</body>
</html>