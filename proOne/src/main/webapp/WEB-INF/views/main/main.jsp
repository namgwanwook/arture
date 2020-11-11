<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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

   <link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Sans&display=swap" rel="stylesheet">
</head>
<script>
var scroll = function(){
    
    var $nav = null,
        $cnt = null,
        moveCnt = null,
        moveIndex = 0,
        moveCntTop = 0,
        winH = 0,
        time = false; // 새로 만든 변수

    $(document).ready(function(){
        init();
        initEvent();
    });
    
    var init = function(){
        $cnt = $(".content");
     
    };
    
    var initEvent = function(){
        $("html ,body").scrollTop(0);
        winResize();
        $(window).resize(function(){
            winResize();
        });
      
        $cnt.on("mousewheel", function(e){
            if(time === false){ // time 변수가 펄스일때만 휠 이벤트 실행
              wheel(e);
            }
        });
    };
        
    var winResize = function(){
        winH = $(window).height();
        $cnt.children("div").height(winH);
        $("html ,body").scrollTop(moveIndex.scrollTop);
    };
    
    var wheel = function(e){
        time = true // 휠 이벤트가 실행 동시에 트루로 변경
        if(e.originalEvent.wheelDelta < 0){
            if(moveIndex < 3){
                moveIndex += 1;
                moving(moveIndex);
            };
        }else{
            if(moveIndex > 0){
                moveIndex -= 1;
                moving(moveIndex);
            };
        };
    };
    
    var moving = function(index){
        moveCnt = $cnt.children("div").eq(index);
        moveCntTop = moveCnt.offset().top;
         $("html ,body").stop().animate({
            scrollTop: moveCntTop
        }, 1000, function(){
          time = false; // 휠 이벤트가 끝나면 펄스로 변경
        });
    };
    
};
scroll();
</script>
<style>
#headerWrapper {
    width: 100%;
    position: fixed;
    top: 0;
    height: 100px;
    margin: 0 auto;
    z-index: 10;
    background-color: transparent;
}
.boxWrapper {
   width:100%;
   height:500px;
}

/* .image_box{
   margin: 0 auto;
   width: 100%;
   height: 960px;
   background: black;
   float:left;
}
.image_box img {
   width:100%;
} */
.content{
   position: absolute;
    top: 0;
}
.content div{
   position:relative;
   overflow:hidden;
}
.content div img {
   width:100%;
}
.content .cnt01 p,.cnt02 p, .cnt03 p{
   position:absolute;
   top:50%;
   margin-top:-40px;
   text-align:center;
   width:100%;
   font-size:80px;
   font-weight:bold;
   color:#fff
}

.content .cnt04 p{
   position:relaive!important;
}
.content .cnt04 p.word {
   font-size:40px;
   font-weight:bold;
   text-align: left;
   margin: 90px 0 60px 10%;
    color:#000;
}
.left-box {
  height:600px;
  float: left;
  width: 50%;
  background:#eee;
}

.right-box {
  height:600px;
  float: right;
  width: 50%;
  background:#fff;
}

.right-box ul.notice_list{
   margin-left:10%;
}
.right-box ul.notice_list li {
   width: 36%;
    padding-right: 12%;
    float:left;
}
.right-box ul.notice_list li p {
   text-align:left;
}

.right-box ul.notice_list li p.n_title{
   font-size:25px;
   color:#000;
   margin-bottom:40px;
   font-weight:bold;
}
.right-box ul.notice_list li p.n_content{
   display:inline-block;
   font-size:16px;
   color:#aaa;
   line-height:25px;
   max-height:150px;
   overflow:hidden;
   white-wrap:normal;
   text-overflow:ellipsis;
   
}
.right-box ul.notice_list p.n_content:hover {
   color:#000;
}
.right-box ul.notice_list p.n_date{
   font-size:16px;
   color:#aaa;
   margin-top:40px;
}
.apply_box {
   width:100%;
   height:200px;
}
.apply_box button{
   display:block;
   width:150px;
   height:50px;
   background-color:red;
   border-radius:50px;
   border:0;
   margin:0 auto;
}
</style>
<script>
   
</script>
<body>
   <div class="mainWrapper">
   <div class="content">
       <div class="cnt01"><p>CONTENT01</p>
          <img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(0).galleryNO }&imageFileName=${galleryList.get(0).imageFileName }">
       </div>
       <div class="cnt02"><p>CONTENT02</p>
       <img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(1).galleryNO }&imageFileName=${galleryList.get(1).imageFileName }">
       </div>
       <div class="cnt03"><p>CONTENT03</p>
       <img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(2).galleryNO }&imageFileName=${galleryList.get(2).imageFileName }">
       </div>
   
   
   <%-- <div class="image_box" style="overflow:auto">
      <!-- galleryNO랑 applyNO랑 같으면 출력? 보다 -->
      <!-- 이미지 src에 경로\최근 첫 번째(0) 갤러리NO폴더명\폴더안의 첫 번째 이미지 -->
      <img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(0).galleryNO }&imageFileName=${galleryList.get(0).imageFileName }">
   </div>
   
   <div class="image_box" style="overflow:auto">
      <img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(1).galleryNO }&imageFileName=${galleryList.get(1).imageFileName }">
   </div>
   
   <div class="image_box" style="overflow:auto">
      
      <img src="${contextPath }/mainImage.do?galleryNO=${galleryList.get(2).galleryNO }&imageFileName=${galleryList.get(2).imageFileName }">
   </div> --%>
   
   <div class="cnt04">
      <div class="left-box">
         <p class="word">UPCOMING</p>
      </div>
      
      
      <div class="right-box">
         <p class="word">NOTICE</p>
            
            
            <!-- 공지사항에 글 없을시 공지사항이 없음 텍스트 출력 --> <!-- c tag 안에 주석달면 오류오류!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            <c:choose>
               <c:when test="${noticeList == NULL || noticeList.size() == 0 }">
                  <tr height="10">
                     <td colspan="2">
                        <p align="center">
                           <b><span style="font-size:9pt;">등록된 공지사항이 없습니다.</span></b>
                        </p>
                     </td>
                  </tr>
               </c:when>
            
               <c:when test="${noticeList != null && noticeList.size() > 0 }">
               <ul class="notice_list">
               <li>
                  <a href="#">
                     <p class="n_title">${noticeList.get(0).title}</p>
                     <p class="n_content">${noticeList.get(0).content}</p>
                  </a>
                  <p class="n_date">${noticeList.get(0).writeDate }</p>
               </li>
               <li>   
                  <a href="#">
                     <p class="n_title">${noticeList.get(1).title}</p>
                     <p class="n_content">${noticeList.get(1).content}</p>
                  </a>
                  <p class="n_date">${noticeList.get(1).writeDate }</p>
               </li>   
               </div>
               </c:when>
               
            </c:choose>
            <div class="apply_box">
            <button><a href="${contextPath }/applyForm/applyForm.do">신청하기</a></button>
            </div>
      </div><!-- 공지사항 박스 -->

   </div><!-- content end -->
   </div><!-- mainWrapper end -->
   
</body>
</html>