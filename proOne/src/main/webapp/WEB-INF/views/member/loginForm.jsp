<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<head>
<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet"> -->
<link rel="stylesheet" href="${contextPath}/resources/css/member.css"/>
  <meta charset="UTF-8">
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>
</head>

<body>
<div id="loginWrapper">
	<form name="frmLogin" method="post"  action="${contextPath}/member/login.do" autocomplete="off">
	   <table align="center" >
	      <tr align="center">
		      <td>
			  	<input class="input1" type="text" name="id" value="" size="20" placeholder="ID">
			  </td>	
	      </tr>
	      <tr align="center">
		      <td>
			  	<input class="input1" type="password" name="pwd" value="" size="20" placeholder="password">
			  </td>
	      </tr>
	      <tr align="center">
	         <td class="td1">
	            <input type="submit" value="Log In" > 
	         </td>
	      </tr>      
	   </table>
	</form>
</div>
</body>
</html>
