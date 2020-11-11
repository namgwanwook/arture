<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	<h1>사이드 메뉴</h1>

	<h1>
		<a href="${contextPath}/admin/notice/noticeList.do" class="no-underline">공지사항 관리</a><br> 
		<a href="${contextPath}/admin/member/memberList.do" class="no-underline">회원 관리</a><br> 
		<a href="${contextPath}/admin/applycheck/applyList.do" class="no-underline">작품 신청 관리</a><br>
		<a href="${contextPath}/admin/gallery/galleryList.do" class="no-underline">승인된 작품 관리</a><br>
	</h1>


	<%-- <h1>
		<a href="${contextPath}/member/listMembers.do"  class="no-underline">회원관리</a><br>
		<a href="${contextPath}/board/listArticles.do"  class="no-underline">게시판관리</a><br>
		<a href="#"  class="no-underline">상품관리</a><br>
	</h1> --%>
	
</body>
</html>