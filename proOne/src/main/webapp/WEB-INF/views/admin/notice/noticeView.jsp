<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부사항</title>
<style>
	#tr_btn_modify{
       display:none;
     }
</style>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" >
function backToList(obj){
	obj.action="${contextPath}/admin/notice/noticeList.do";
	obj.submit();
  }
function fn_enable(){
	document.getElementById("tr_btn_modify").style.display="block";
	document.getElementById("tr_btn").style.display="none";
	document.getElementById("i_title").disabled=false;
	document.getElementById("i_content").disabled=false;
}
function fn_modify_article(obj){
	obj.action="${contextPath}/admin/notice/modNotice.do";
	obj.submit();
}

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
	<form name="frmArticle" method="post"  >
		<table  border=0  align="center">
  			<tr>
   				<td width=150 align="center" bgcolor=#FF9933>
      			글번호
   				</td>
   				<td >
    				<input type="text"  value="${notice.no }"  disabled />
    				<input type="hidden" name="no" value="${notice.no}"  />
   				</td>
  			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">
     			 제목 
   				</td>
   				<td>
    				<input type=text value="${notice.title }"  name="title"  id="i_title" disabled />
   				</td>   
  			</tr>
  			<tr>
    			<td width="150" align="center" bgcolor="#FF9933">
     			 내용
   				</td>
   				<td>
    				<textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${notice.content }</textarea>
    				
   				</td>  
  			</tr>
 

  			<tr>
	   			<td width="150" align="center" bgcolor="#FF9933">
	      		등록일자
			   	</td>
			   	<td>
			   		<input type=text name="writeDate" value="${notice.writeDate}" disabled />
			   		<input type="hidden" name="writeDate" value="${notice.writeDate}"  />
			   	</td>   
  			</tr>
  			<tr id="tr_btn_modify"  align="center">
  				<td colspan="2"   >
  					<input type=button value="수정반영하기" onClick="fn_modify_article(frmArticle)">
		           	<input type=button value="취소"  onClick="backToList(frmArticle)">
			   	</td>   
		  	</tr>
    
		  	<tr  id="tr_btn">
		   		<td colspan="2" align="center">
			      	<input type=button value="수정하기" onClick="fn_enable()">
			      	<input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/admin/notice/removeNotice.do', ${notice.no})">
			    	<input type=button value="목록"  onClick="backToList(this.form)">
		   		</td>
		  	</tr>
		</table>
	</form>
</body>
</html>