<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#myinfo{
	text-align: left;
    margin-left: 30px;
	}
	#preview{
	border-radius: 120px;
    float: left;
	}
	#m_preview{
	border-radius: 120px;
    float: left;
	}
	p{
	text-align: center;
	}
	        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: pink;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        tr{
        width: 100%;
        }
        td{
        width: 100%;
        }
        table{
        width: 80%;
        }
        #imagenamespace{
        width:1px;
        }
        
</style>
<title>Insert title here</title>

<script type="text/javascript">
function fn_remove(url,id,galleryNO){
	var answer=confirm("삭제하시겠습니까?");
	if(answer==true){
		var form = document.createElement("form");
		var i_id = document.createElement("input");
		var i_galleryNO = document.createElement("input");
		
		i_id.name="id";
		i_id.value=id;
		
		i_galleryNO.name="galleryNO";
		i_galleryNO.value=galleryNO;
		
		form.appendChild(i_id);
		form.appendChild(i_galleryNO);
		
		document.body.appendChild(form); 
	    form.method="post";
	    form.action=url;
	    form.submit();
	}
}

function openModal(){
	var myModal = document.getElementById('myModal');
	myModal.style.display = "block";
}

function closeModal(){
	var myModal = document.getElementById('myModal');
	myModal.style.display = "none";
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	var image = document.getElementById('m_preview')
        	image.setAttribute('src',e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function Goduke() {
    	var image = document.getElementById('m_preview');
    	image.setAttribute('src','${contextPath}/resources/image/duke.png');
    	
    	var goduke = document.getElementById('goduke');
    	
    	goduke.setAttribute('value','duke.png');
}

</script>
</head>
<body>

<h1>나의 정보</h1>
<div id="myinfo">
		    <img src="${contextPath}/thumbnails.do?fileName=${memberInfo.profileImage}&id=${memberInfo.id}&originalFileName=${memberInfo.profileImage}" id="preview"  />
		    <p>이미지 ${memberInfo.profileImage}아이디 ${memberInfo.id}오리지날${memberInfo.profileImage}</p>
		    <br>
	<p>이름 : ${memberInfo.name }
	<p>자신을 소개 : ${memberInfo.profileText}
	<br><br><br>
	
	<!-- 모달 시작입니다요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	 <button id="myBtn" onClick="openModal()">정보 수정</button>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onClick="closeModal()">&times;</span>
			  <form name="modUserInfo" method="post"  action="${contextPath}/mypage/modUserInfo.do"   enctype="multipart/form-data">
    <table align="center">
    <tr>
			<td align="right">이름:&nbsp; </td>
			<td><input type="text" size="5" value="${memberInfo.name }" disabled name="name" /> </td>
		</tr>
		<tr>
			<td align="right">성별:&nbsp;  </td>
			<td><input type="text" size="67" value="${memberInfo.gender }"  maxlength="100" name="gender" disabled/></td>
		</tr>
		<tr>
			<td align="right">이메일:&nbsp;  </td>
			<td><input type="text" size="67" value="${memberInfo.email }" maxlength="100" name="email" /></td>
		</tr>
		<tr>
			<td align="right">Instagrm:&nbsp;  </td>
			<td><input type="text" size="67" value="${memberInfo.sns_i }" maxlength="100" name="sns_i" /></td>
		</tr>
		<tr>
			<td align="right">facebook:&nbsp;  </td>
			<td><input type="text" size="67" value="${memberInfo.sns_f }" maxlength="100" name="sns_f" /></td>
		</tr>
		<tr>
			<td align="right">blog:&nbsp;  </td>
			<td><input type="text" size="67" value="${memberInfo.sns_b }" maxlength="100" name="sns_b" /></td>
		</tr>
			<td align="right" valign="top"><br>프로필 컨텐츠:&nbsp; </td>
			<td><textarea name="profileText" rows="10" cols="65" maxlength="4000" >${memberInfo.profileText }</textarea> </td>
		</tr>
		<tr>
			<td align="right">프로필 이미지:  </td>
			<td> 
				<input type="file" accept="image/png"  name="profileImage"  onchange="readURL(this);" />
				<img  id="m_preview" src="#"   width=200 height=200/>
				<input type ="button" onclick="Goduke()" value="듀크로 돌아가기" />
			</td>
		</tr>
		<tr>
			<td align="right"> </td>
			<td>
			 <input  type= "hidden"  id="goduke" name="goduke" value="#" />
			 <input  type= "hidden"   name="originalFileName" value="${memberInfo.profileImage }" />
				<input type="hidden" value="${memberInfo.id }" name="id"/>
				<input type=submit value="수정하기" />
				
			</td>
		</tr>
    </table>
  </form>
		</div>
	</div>
		<!-- 모달 끛 --입니다요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
</div>

<br><br><br>	

================================================================================
<h1>내가 좋아하는 겔러리</h1>
================================================================================
<c:forEach var="favorite" items="${favoritelist}">
		
		<!-- 좋아요 리스트 증감 변수 -->
		<c:set var="a" value="${ a + 1}"/>
		
			<a href="${contextPath }/gallery/detail.do?num=${favoritelist.galleryNO}">
				<div class="row">
				  <div class="col-sm-6 col-md-4" style="width: 350px">
				    <div class="thumbnail">
				      <div class="caption"> 
				      <img src="${contextPath }/resources/image/${favoritelist.imageFileName}" height="240px" width="290px">
				        <p>제목:${favoritelist.title }</p>
				        <p>아이디: ${favoritelist.id }</p>
				        <p>카테고리: ${favoritelist.category }</p>
				        <p>해시태크: ${favoritelist.hashtag }</p>
				        <!-- 좋아요 값 출력 -->
					    <p>좋아요:${like.get(a-1)}</p><input type=button value="좋아요취소" onClick="fn_remove('${contextPath}/mypage/cancelFavorite.do', 
 																	'${favorite.id}','${favorite.galleryNO}')" />
				      </div>
				    </div>
				  </div>
				</div>	
			</a>	 
 
 
</c:forEach>

<br><br><br>
================================================================================
<h1>나의 갤러리</h1>
================================================================================
<c:forEach var="myGallery" items="${myGallery}">
<table border=0 width=100% cellpadding=10 cellspacing=10>
  <tr>
    <td>
	  타이틀:
   </td>
    <td>
	   <strong>${myGallery.title}</strong>
   </td>
   </tr>
  <tr>
    <td>
	 컨텐츠:
   </td>
    <td>
	   <strong>${myGallery.content}</strong>
   </td>
   </tr>
  <tr>
    <td>
	 이미지:
   </td>
    <td>
	   <strong>${myGallery.imageFileName}</strong>
   </td>
   </tr>
</table>
<input type=button value="게시글삭제" onClick="fn_remove('${contextPath}/mypage/deleteMyGallery.do', 
 																	'${myGallery.id}','${myGallery.galleryNO}')" />
 

</c:forEach>

<br><br><br>


</body>
</html>