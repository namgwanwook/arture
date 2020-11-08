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
	<!-- style.css로 링크 연결 -->
<link rel="stylesheet" href="${contextPath }/resources/css/reset.css">
<link rel="stylesheet" href="${contextPath }/resources/css/mypage.css">
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
       	var image = document.getElementById('profile');
       	image.setAttribute('src',e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
    var form = document.createElement("form");
	
	form.setAttribute("enctype","multipart/form-data");
    form.appendChild(input);
    document.body.appendChild(form); 
    form.method="post";
    form.action="${contextPath}/mypage/modprofileimage.do";
    form.submit();
	
}

function Goduke() {
    	var image = document.getElementById('profile');
    	image.setAttribute('src','${contextPath}/resources/image/duke.png');
    	var goduke = document.getElementById('goduke');
    	goduke.setAttribute('value','duke.png');
}

function confirmPassword(){
	if(document.getElementById("password").value!=document.getElementById("pwd").value){
		alert("잘못된 비밀번호입니다.")
	}else{
		var pass = document.getElementById('confirmPassword');
		var userinfo = document.getElementById('userinfo');
		pass.style.display = 'none';
		userinfo.style.display = 'block';
	}
}

function inputimage(){
	var proinput = document.getElementById('proinput');
	proinput.click();
	
}

</script>

</head>

<body>
<div class="mypage">
<!--  -->
<div class="myinfo">
	<div class="userinfo">
		<div class="profileimage">
			<div class="imagerapper">
				<input type="file" id="proinput" accept="image/png"  name="profileImage" enctype="multipart/form-data"  onchange="readURL(this)" style="display: none"  />
				<button onclick="inputimage()"><img src="${contextPath}/thumbnails.do?fileName=${member.profileImage}&id=${member.id}&originalFileName=${member.profileImage}" id="profile" ></img></button>			
			</div>
			<section class="userinfo">
				<div>
					<p id="username">${member.name}</p>
					<button id="myBtn" onClick="openModal()">프로필 관리</button>
				</div>
				<ul>
					<li>게시물   ${count.countgallery}</li><li>좋아요  ${count.countfavorite}</li>
				</ul>
				<div>${member.profileText}</div>
			</section>
		</div>
	</div>
</div>

	<br><br><br>
	
	<!-- 모달 시작입니다요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onClick="closeModal()">&times;</span>
			  <form name="modUserInfo" method="post"  action="${contextPath}/mypage/modUserInfo.do"   enctype="multipart/form-data">
    <table>
    <tr>
			<td align="right">이름:&nbsp; </td>
			<td><input type="text" size="5" value="${member.name }" disabled name="name" /> </td>
		</tr>
		<tr>
			<td align="right">성별:&nbsp;  </td>
			<td><input type="text" size="67" value="${member.gender }"  maxlength="100" name="gender" disabled/></td>
		</tr>
		<tr>
			<td align="right">이메일:&nbsp;  </td>
			<td><input type="text" size="67" value="${member.email }" maxlength="100" name="email" /></td>
		</tr>
		<tr>
			<td align="right">Instagrm:&nbsp;  </td>
			<td><input type="text" size="67" value="${member.sns_i }" maxlength="100" name="sns_i" /></td>
		</tr>
		<tr>
			<td align="right">facebook:&nbsp;  </td>
			<td><input type="text" size="67" value="${member.sns_f }" maxlength="100" name="sns_f" /></td>
		</tr>
		<tr>
			<td align="right">blog:&nbsp;  </td>
			<td><input type="text" size="67" value="${member.sns_b }" maxlength="100" name="sns_b" /></td>
		</tr>
			<td align="right" valign="top"><br>프로필 컨텐츠:&nbsp; </td>
			<td><textarea name="profileText" rows="10" cols="65" maxlength="4000" >${member.profileText }</textarea> </td>
		</tr>
		<tr>
			<td> 
				<input type ="button" onclick="Goduke()" value="듀크로 돌아가기" />
			</td>
		</tr>
		<tr>
			<td align="right"> </td>
			<td>
			<input type="hidden" value="${member.profileImage }" name="profileImage" id="goduke"/>
			 <input type="hidden" value="${member.id }" name="id" id="id"/>
			 <input type="hidden" value="${member.pwd }" name="pwd" id="pwd"/>
				<input type=submit value="수정하기" />
			</td>
		</tr>
    </table>
  </form>
		</div>
	</div>
		<!-- 모달 끛 --입니다요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<br><br><br>
================================================================================
<h1>나의 갤러리</h1>
================================================================================
<c:forEach var="myGallery" items="${myGallery}">
		
			<a href="${contextPath }/gallery/detail.do?num=${myGallery.galleryNO}">
				<div class="row">
				  <div class="col-sm-6 col-md-4" style="width: 350px">
				    <div class="thumbnail">
				      <div class="caption"> 
				      <img src="${contextPath }/resources/image/${myGallery.imageFileName}" height="240px" width="290px">
				        <p>제목:${myGallery.title }</p>
				        <p>아이디: ${myGallery.id }</p>
				        <p>카테고리: ${myGallery.category }</p>
				        <p>해시태크: ${myGallery.hashtag }</p>
				        
					   <input type=button value="삭제" onClick="fn_remove('${contextPath}/mypage/cancelFavorite.do','${myGallery.id}','${myGallery.galleryNO}')" />
				      </div>
				    </div>
				  </div>
				</div>	
			</a>	 
 
 
</c:forEach>

<br><br><br>	

 

================================================================================

<h1>내가 좋아하는 겔러리</h1>

================================================================================

<c:forEach var="favorite" items="${favoritelist}">
<div id="favoriteinfo">
		
		<c:set var="a" value="${ a + 1}"/>
			<a href="${contextPath }/gallery/gallery_detail.do?galleryNO=${favorite.galleryNO}">

				<div class="row">
				  <div class="col-sm-6 col-md-4" style="width: 350px">
				    <div class="thumbnail">
				      <div class="caption"> 
				      <img src="${contextPath }/resources/image/${favorite.imageFileName}" height="240px" width="290px">
			</a>	      
				        <p>제목:${favorite.title }</p>
				        <p>아이디: ${favorite.id }</p>
				        <p>카테고리: ${favorite.category }</p>
				        <p>해시태크: ${favorite.hashtag }</p>
				        
					   <p>좋아요:${like.get(a)}</p>
				      </div>
				    </div>
				  </div>
				</div>
 <input type=button value="좋아요취소" onClick="fn_remove('${contextPath}/mypage/cancelFavorite.do','${member.id}','${favorite.galleryNO}')" /> 

 
</div>
</c:forEach>
</div>

</div>
</body>
</html>