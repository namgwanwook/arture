<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/admin.css"/>
  <meta charset="UTF-8">
  <title>공지사항 리스트창</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">

function fn_remove_article(url, noticeNO){
	var answer=confirm("삭제하시겠습니까?");
	   if(answer==true){
	      var form = document.createElement("form");
	      var notice = document.createElement("input");
	      
	      notice.name="noticeNO";
	      notice.value= noticeNO;
	      
	      form.appendChild(notice);
	      document.body.appendChild(form); 
	      
	      form.method="post";
	      form.action=url;
	      form.submit();
	   }
}

</script>
<body>
<h1 class="label">공지사항 LIST 페이지 입니다</h1>
<table align="center" border="1"  width="100%"  >
		<tr class="list_title">
			<td width="10%">글번호</td>
			<td width="55%">제목</td>
			<td width="15%">작성일</td>
			<td width="10%">삭제</td>
		</tr>
		<c:choose>
			<c:when test="${noticeList == NULL || noticeList.size() == 0 }">
				<tr height="10">
					<td colspan="5">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${noticeList !=null && noticeList.size()>0}">
				<c:forEach var="notice" items="${noticeList }">
					<tr align="center">
						<td width="10%">${notice.no}</td>
						<td align='left' width="55%"><span
							style="padding-right: 30px"></span> <a class='cls1'
							href="${contextPath}/admin/notice/noticeView.do?noticeNO=${notice.no }">${notice.title }</a>
						</td>
						<td width="15%">${notice.writeDate }</td>
						<td width="10%"><input type=button value="삭제" onclick="fn_remove_article('${contextPath}/admin/notice/removeNotice.do', ${notice.no})"></td>				
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
<p class="cls2"><a  class="cls1"  href="${contextPath}/admin/notice/noticeForm.do">글쓰기</a></p>
</body>
</html>