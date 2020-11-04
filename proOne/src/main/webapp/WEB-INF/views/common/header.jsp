<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body>
	<table border="0" width="100%">
		<tr>
			<td>
				<a href="${contextPath }/main/main.do">
					<img size="10px" src="${contextPath}/resources/image/duke.png"/>
				</a>
			</td>
			<td>
				<h1><font size=30>스프링실습 홈페이지!!!</font></h1>
			</td>
			<td>
				<!-- <a href="#"><h3>로그인</h3></a> -->
				<c:choose>
					<c:when test="${isLogOn == true && member != null }">
						<h3>환영합니다!! ${member.name }님!</h3>
						<a href="${contextPath }//mypage/myPageMain.do?id=${member.id}"><h3>마이페이지</h3></a>
						<a href="${contextPath }/member/logout.do"><h3>로그아웃</h3></a>
						<c:if test="${member.id == 'admin'}">
							<a href="${contextPath }/admin/notice/noticeList.do"><h3>admin</h3></a>
						</c:if>
					</c:when>
					
					<c:otherwise>
						
						<a href="${contextPath }/member/loginForm.do"><h3>로그인</h3></a>
						<a href="${contextPath }/member/memberForm.do"><h3>회원가입</h3></a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</body>
</html>