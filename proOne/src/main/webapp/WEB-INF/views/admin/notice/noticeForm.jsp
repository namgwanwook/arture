<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath }/resources/css/reset.css">
<link rel="stylesheet" href="${contextPath }/resources/css/admin.css">
<meta charset="UTF-8">
<title>공지사항 작성창</title>
</head>
<script>
function backToList(obj){
	obj.action="${contextPath}/admin/notice/noticeList.do";
	obj.submit();
  }

function check(){
	var check = document.noticeForm;
	var title = check.title.value;
	if(title == "" || title==null){
		alert("제목을 써주세요!!");
		return;
	}else{
		check.action = "${contextPath}/admin/notice/addNewNotice.do";
		check.submit();
	}
  }
  
</script>
<body>
	<h1 style="text-align:center">글쓰기</h1>
	<form name="noticeForm" method="post" >
    	<table border="0" align="center">
    		
		    <tr>
		    	<td align="right">제목 : </td>
		    	<td><input type="text" size="65" maxlength="500" name="title" /></td>
			</tr>
			<tr>
			 	<td align="right" valign="top"><br>내용 : </td>
				<td><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea> </td>
	     	</tr>
	     	
		    <tr>
		    	<td align="right"> </td>
		      	<td>
		       		<input type="button" value="글쓰기" onClick="check()"/>
		       		<input type=button value="취소" onClick="backToList(this.form)" />
		      	</td>
	     	</tr>
    </table>
  </form>
</body>
</html>