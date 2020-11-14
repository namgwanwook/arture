<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Insert title here</title>
<style>
.mt40{
	margin-top:40px;
}
.mt60{
	margin-top:60px;
}
.mypage {
	width: 80%;
	height: auto;
	margin: 0px auto;
}

/* Modal */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: gray;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid black;
	width: 30%;
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	position: fixed;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
td{
	vertical-align:top;
}
.aside{
	 text-align: end;
}
.modinput{
	width: 100%;
	margin: 0px 0px 7px 15px;
	resize: none;
}
/*end Modal */

/* profileimage */
#m_preview {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: absolute;
}

.profileimage {
	width: 60%;
	height: auto;
	margin: auto;
	background: pink;
}

/* profileimage */
.mypage .myinfo {
	width: 100%;
	height: auto;
}

.mypage .myinfo .imageWrapper {
	width: 20%;
	float: left;
}

.imageWrapper #profile {
	width: 100%;
	height: 100%;
	cursor: pointer;
}

.imageWrapper button {
	background: #fff;
	width: 150px;
	border-radius: 50%;
	height: 150px;
	overflow: hidden;
	border: 1px solid #ddd;
}

.mypage .myinfo .userinfo {
	width: 50%;
	float: left;
	text-align: left;
}

#username {
	font-size: 25px;
	line-height: 60px;
}

i {
	font-size: 18px;
	cursor: pointer;
}

.mypage .myinfo .userinfo ul {
	display: inline-block;
	margin: 20px 0px;
}

.mypage .myinfo .userinfo ul li {
	float: left;
	margin-right: 30px;
}

.title_box {
	float: left;
	width: 100%;
	height: 35px;
	border-bottom: 2px solid #fff;
}

.title_box p {
	text-align: left;
	font-size: 25px;
	font-weight: bold;
}
#image_box{
	 width:20%;
	 margin:2.5%;
	 float:left;
}
p{
	padding-top : 4px;
}
.thumbnail{
	text-align: left;
}
.thumbnail .caption a {
	display: block;
    width: 100%;
    height: 230px;
    margin-bottom: 20px;
    overflow:hidden;
}
.thumbnail .caption p {
	line-height: 20px;
    padding-left: 5px;
}
    
.thumbnail .caption a img {
	height:100%;
}
</style>

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

window.onclick = function(event) {
	var myModal = document.getElementById('myModal');
    if (event.target == myModal) {
    	myModal.style.display = "none";
    }
}

</script>

</head>

<body>
	<div class="mypage">
		<!--  -->
		<div class="myinfo">
			<div class="imageWrapper">
				<input type="file" id="proinput" accept="image/*"
					name="profileImage" enctype="multipart/form-data"
					onchange="readURL(this)" style="display: none" />
				<button onclick="inputimage()">
					<img id="profile" src="${contextPath}/downProfile.do?profileImage=${member.profileImage}&id=${member.id}"></img>
				</button>
			</div>
			<section class="userinfo">
				<div>
					<p id="username">${member.name}
						<span><i class="fas fa-cog" onClick="openModal()"></i></span>
					</p>
				</div>
				<ul>
					<li>게시물 <span>${count.countgallery}</span></li>
					<li>좋아요 <span>${count.countfavorite}</span></li>
					<li>가입일자 <span>${member.joinDate}</span></li>
				</ul>
				<div>${member.profileText}</div>
			</section>
		</div>

		<br>
		<br>
		<br>

		<!-- 모달 시작입니다요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<div id="myModal" class="modal">
	<div class="modal-content">
		<form name="modUserInfo" method="post" action="${contextPath}/mypage/modUserInfo.do" enctype="multipart/form-data" autocomplete=off>
			<table>
				<tr>
					<td class="aside">이름</td>
					<td><input class="modinput" type="text" size="50" value="${member.name }"	disabled name="name" /></td>
				</tr>
				<tr>
					<td class="aside">성별</td>
					<td><input class="modinput" type="text" size="50" value="${member.gender }" maxlength="100" name="gender" disabled /></td>
				</tr>
				<tr>
					<td class="aside">이메일</td>
					<td><input class="modinput" type="text" size="50" value="${member.email }" maxlength="100" name="email" /></td>
				</tr>
				<tr>
					<td class="aside">Instagrm</td>
					<td><input class="modinput" type="text" size="50" value="${member.sns_i }" maxlength="100" name="sns_i" /></td>
				</tr>
				<tr>
					<td class="aside">facebook</td>
					<td><input class="modinput" type="text" size="50" value="${member.sns_f }" maxlength="100" name="sns_f" /></td>
				</tr>
				<tr>
					<td class="aside">blog</td>
					<td><input class="modinput" type="text" size="50" value="${member.sns_b }" maxlength="100" name="sns_b" /></td>
				</tr>
					<td class="aside"><p>소개</p></td>
					<td><textarea class="modinput" name="profileText" rows="10" cols="52" resize="none" maxlength="4000">${member.profileText }</textarea></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="hidden" value="${member.profileImage }" name="profileImage" id="goduke" /> 
						<input type="hidden" value="${member.id }" name="id" id="id" /> 
						<input type="hidden" value="${member.pwd }" name="pwd" id="pwd" />
						<i class="fas fa-user-circle" onclick="Goduke()"></i> 
						<input type=submit value="수정하기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
		<!-- 모달 끛 --입니다요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


		<br>
		<br>
		<br>
		<div class="title_box mt60">
			<p>My Gallery</p>
		</div>

		<c:forEach var="myGallery" items="${myGallery}">


			<div class="row">
				<div class="col-sm-6 col-md-4" id="image_box">
					<div class="thumbnail">
						<div class="caption">
							<a
								href="${contextPath }/gallery_detail/galleryDetail.do?galleryNO=${myGallery.galleryNO}">
								<img src="${contextPath }/download.do?fileName=${myGallery.imageFileName}&id=${myGallery.galleryNO }">
							</a>
							<p>제목:${myGallery.title }</p>
							<p>아이디: ${myGallery.id }</p>
							<p>카테고리: ${myGallery.category }</p>
							<p>해시태크: ${myGallery.hashtag }</p>	
						</div>
						<c:set var="likeNum" value="${ likeNum + 1}"/>
						<i class="fas fa-heart"> ${like.get(likeNum-1)}</i><i class="far fa-trash-alt" onClick="fn_remove('${contextPath}/mypage/deletemygallery.do','${myGallery.id}','${myGallery.galleryNO}')"></i>
					</div>
				</div>
			</div>



		</c:forEach>

		<br>
		<br>
		<br>


		<div class="title_box mt40">
			<p>Favorite</p>
		</div>

		<c:forEach var="favorite" items="${favoritelist}">
			<div id="favoriteinfo">
				<div class="row">
					<c:set var="a" value="${ a + 1}" />
					<div class="col-sm-6 col-md-4"  id="image_box">
						<div class="thumbnail">
							<div class="caption">
								<a
									href="${contextPath }/gallery_detail/galleryDetail.do?galleryNO=${favorite.galleryNO}">
									<img src="${contextPath }/download.do?fileName=${favorite.imageFileName}&id=${favorite.galleryNO }" height="240px" width="290px">
								</a>
							</div>
						</div>
						<i class="far fa-trash-alt" onClick="fn_remove('${contextPath}/mypage/cancelFavorite.do','${member.id}','${favorite.galleryNO}')"></i>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>

</body>
</html>