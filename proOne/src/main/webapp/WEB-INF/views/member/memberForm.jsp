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
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/member.css"/>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
function fn_overlapped(){
    var _id=$("#_member_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용가능한 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_member_id').prop("disabled", true);
       	    $('#id').val(_id);
          }else{
        	  alert("이미 사용중인 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>
<title>회원 가입창</title>



</head>


<body>
	<div id="joinWrapper">
		<form method="post"   action="${contextPath}/member/addMember.do">
		<table>
		   <tr>
		      <td><p>아이디</p></td>
		   </tr>
		   <tr>
		   	  <td><input type="text" name="_member_id"  id="_member_id"  size="20" /></td>
			<input type="hidden" name="id"  id="id" />
					  
			<td><input class="overlapped_btn" type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" /></td>
		   </tr>
		   <tr>
		      <td><p>비밀번호</p></td>
		    </tr>
		    <tr>
		       <td><input type="password" name="pwd"/></td>
		    </tr>
		    <tr>
		       <td><p>이름</p></td>
		    </tr>
		    <tr>
		    	<td><input type="text" name="name"/></td>
		    </tr>
		    <tr>
		       <td><p>성별</p></td>
		    </tr>
		    <tr>
		    	<td>
		    	<input class="radio" type="radio" name="gender" value="남"/><span>남</span>
		    	<input class="radio" type="radio" name="gender" value="여"/><span>여</span>
		    	</td>
		    </tr>
		    <tr>
		       <td><p>이메일</td>
		    </tr>
		    <tr>
		    	<td><input type="text" name="email"/></td>
		    </tr>
		    <tr>
		       <td class="td1"><input type="submit" value="Join Us"/></td>
		    </tr>
		</table>
		</form>
	</div>
</body>
</html>
