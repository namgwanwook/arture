<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	<script src="${contextPath }/resources/js/main.js"></script>
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
.image_box{
	margin: 0 auto;
	width: 100%;
	height: 960px;
	background: black;
	float:left;
}
.image_box img {
	width:100%;
}

</style>
<body>
	<h1>TEST. 메인 페이지.</h1>
	
	<div class="image_box" style="overflow:auto">
		<!-- galleryNO랑 applyNO랑 같으면 출력? 보다 -->
		<!-- 이미지 src에 경로\최근 첫 번째(0) 갤러리NO폴더명\폴더안의 첫 번째 이미지 -->
		<img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(0).galleryNO }&imageFileName=${galleryList.get(0).imageFileName }">
	</div>
	
	<div class="image_box" style="overflow:auto">
		<img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(1).galleryNO }&imageFileName=${galleryList.get(1).imageFileName }">
	</div>
	
	<div class="image_box" style="overflow:auto">
		
		<img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(2).galleryNO }&imageFileName=${galleryList.get(2).imageFileName }">
	</div>
	
	<div class="table">
		<div class="left-box">
			
		</div>
		
		
		<div class="right-box">
			 공지사항
			<table align="center" border="1" width="80%">
				<tr height="10" align="center" bgcolor="lightgreen">
					<td width="60%">제목</td>
					<td width="15%">작성일</td>
				</tr>
				
				<!-- 공지사항에 글 없을시 공지사항이 없음 텍스트 출력 --> <!-- c tag 안에 주석달면 오류오류!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
				<c:choose>
					<c:when test="${noticeList == NULL || noticeList.size() == 0 }">
						<tr height="10">
							<td colspan="2">
								<p align="center">
									<b><span style="font-size:9pt;">등록된 공지사항이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
				
					<c:when test="${noticeList != null && noticeList.size()>0 }">
						
							<tr align="center">
								<td align='left' width="60%">
									<span style="padding-right: 30px" ></span>
									<a class='cls1' href="#">${noticeList.get(0).title}</a>
								</td>
								<td width="15%">${noticeList.get(0).writeDate }</td>
							</tr>
							
							<tr align="center">
								<td align='left' width="60%">
									<span style="padding-right: 30px" ></span>
									<a class='cls1' href="#">${noticeList.get(1).title}</a>
								</td>
								<td width="15%">${noticeList.get(1).writeDate }</td>
							</tr>
					</c:when>
					
				</c:choose>
			
			</table><!-- 공지사항 테이블 -->
		</div><!-- 공지사항 박스 -->
	</div><!-- div -->
	<button><a href="${contextPath }/applyForm/applyForm.do">신청하기</a></button>

	
</body>
</html>