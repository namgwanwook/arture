<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
   request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${contextPath }/resources/js/main.js"></script>
<script src="${contextPath }/resources/js/jquery.scrollify.js"></script>

<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">

<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>



<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300">
 <%-- <link rel="stylesheet" href="${contextPath }/resources/css/gallery.css"> --%>
<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"> 
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Sans&display=swap"
	rel="stylesheet">
</head>
<script>

$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
})

function btn1(){
	var b1 = document.getElementById("mbtn1");
	b1.click();
}
function btn2(){
	var b2 = document.getElementById("mbtn2");
	b2.click();
}
function auto_grow(element) {
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}

</script>
<style>

.thumbnail {
  height: 430px;
  width: 330px;
  float: left;
  margin:50px 50px 50px 50px;
  border: solid 2px white;
  border-radius:10px; 
}
.gallery-caption p{
	text-align : left;
	font-size: 20px;
	padding-top: 12px;
}

.gallery-caption{
	padding-left: 24px;
}



#inner{
	width:100%;
	height:100%;
	overflow:hidden;
}
.inner img {
	width:100%;
	object-fit:contain;
}
#mainFooter {
	clear: both;
	padding: 5px;
	border: 0px solid #bcbcbc;
	color: #fff;
	background-color: #000;
	width:100%;
	height:100%;
}
.mBoxWrapper {
	height:85%;
}
.noticeDiv1 {
	text-align:left;
}
.noticeDiv2 {
	text-align:left;
}
textarea.autosize {
	-ms-overflow-style:none;
	scrollbar-width:none;
	resize:none;
	border:none;
	min-width:400px;
    min-height:500px;
}
textarea.autosize::-webkit-scrollbar {
	display:none;
}
.panel{
	width:100%;
	overflow:hidden;
}



</style>
<script>
   
</script>
<!-- overflow:hidden. 이미지 크기가 최대를 넘어서면 스크롤바를 자동으로 생성하지 않는다 -->
<body style="overflow: hidden;">
	<section class="panel home" data-section-name="home">

		<div class="inner">
			<img
				src="${contextPath }/imageList.do?galleryNO=${galleryList.get(0).galleryNO }&imageFileName=${galleryList.get(0).imageFileName }">
			<div class="vertical-center">

				<p class="cta">
					<!-- 여기에 갤러리로 이동할 경로 잡아야함. -->
					<a href="http://localhost:8090/proOne/gallery_detail/galleryDetail.do?galleryNO=${galleryList.get(0).galleryNO }" class="arrow">${galleryList.get(0).title }</a>
				</p>
			</div>
		</div>
	</section>
	<section class="panel panel1" data-section-name="second">
		<div class="inner">
			<img
				src="${contextPath }/imageList.do?galleryNO=${galleryList.get(1).galleryNO }&imageFileName=${galleryList.get(1).imageFileName }">

			<div class="vertical-center">
				<p class="cta">
					<!-- 여기에 갤러리로 이동할 경로 잡아야함. -->
					<a href="http://localhost:8090/proOne/gallery_detail/galleryDetail.do?galleryNO=${galleryList.get(1).galleryNO }" class="arrow">${galleryList.get(1).title }</a>
				</p>
			</div>
		</div>
	</section>
	<section class="panel panel2" data-section-name="third">
		<div class="inner">
			<img
				src="${contextPath }/imageList.do?galleryNO=${galleryList.get(2).galleryNO }&imageFileName=${galleryList.get(2).imageFileName }">

			<div class="vertical-center">
				<p class="cta">
					<!-- 여기에 갤러리로 이동할 경로 잡아야함. -->
					<a href="http://localhost:8090/proOne/gallery_detail/galleryDetail.do?galleryNO=${galleryList.get(2).galleryNO }" class="arrow">${galleryList.get(2).title }</a>
				</p>
			</div>
		</div>
	</section>
	<section class="panel panel3" data-section-name="fourth">
		<div class="inner">
			<div class="mBoxWrapper">
			
				<div class="left-box">
					<p class="word">UPCOMING</p>
					
						<!-- 갤러리 폼 -->
			     	 	<div class="thumbnail">
							<a class="gallery-form" href="${contextPath }/gallery_detail/galleryDetail.do?galleryNO=${galleryLike.galleryNO }"> 
			      				<img class="gallery-img" src="${contextPath }/imageList.do?galleryNO=${galleryLike.galleryNO }&imageFileName=${galleryLike.imageFileName }" alt="이미지" >
							</a><!-- end gallery-form -->
							
			         		<div class="gallery-caption">			         		
				            	<p>제목:<span>${galleryLike.title}</span></p>
				            	<p>아이디:<span>${galleryLike.id}</span></p>
					        	<p>카테고리:<span>${galleryLike.category}</span></p>
					        	<p>해시태그:<span>${galleryLike.hashtag}</span></p>			        				        
					        	<!-- 좋아요 값 출력 -->
						    	<p><span style="color:red"><i class="fas fa-heart"></i></span> ${like}</p>
				        	</div><!-- end caption -->
				      	</div><!-- end thumnail -->
	 
				</div>
	
	
	
				<div class="right-box">
					<p class="word">NOTICE</p>
					<!-- 공지사항에 글 없을시 공지사항이 없음 텍스트 출력 -->
					<!-- c tag 안에 주석달면 오류오류!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<c:choose>
						<c:when test="${noticeList == NULL || noticeList.size() == 0 }">
							<tr height="10">
								<td colspan="2">
									<p align="center">
										<b><span style="font-size: 9pt;">등록된 공지사항이 없습니다.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
	
						<c:when test="${noticeList != null && noticeList.size() > 0 }">
							<ul class="notice_list">
								<li>
									<button id="mbtn1" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter1" style="display:none"></button>
									<div class="noticeDiv1" onclick="btn1()">
										<p onclick="btn1()" class="n_title">${noticeList.get(0).title}</p>
										<p onclick="btn1()" class="n_content">${noticeList.get(0).content}</p>
									</div>
									<p class="n_date">${noticeList.get(0).writeDate }</p>
								</li>
								<li>
									<button id="mbtn2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter2" style="display:none"></button>
									<div class="noticeDiv2" onclick="btn2()">
										<p class="n_title">${noticeList.get(1).title}</p>
										<p class="n_content">${noticeList.get(1).content}</p>
									</div>
									<p class="n_date">${noticeList.get(1).writeDate }</p>
								</li>
							</ul>
							
	<!-- Modal 1 -->
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">${noticeList.get(0).title}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<textarea class="autosize" onkeydown="resize(this)" onkeyup="resize(this)" readonly disabled >${noticeList.get(0).content}</textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



	<!-- Modal 2 -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">${noticeList.get(1).title}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<textarea class="autosize" onkeydown="resize(this)" onkeyup="resize(this)" readonly disabled >${noticeList.get(1).content}</textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>													
						</c:when>
					</c:choose>
			
				</div><!-- 공지사항 -->
			</div><!-- 공지사항, comming soon wrap -->
			<div id="mainFooter">
			<h1>footer test</h1>
		</div>
		</div><!-- inner 박스 -->
		
		
	</section>
	

</body>
</html>