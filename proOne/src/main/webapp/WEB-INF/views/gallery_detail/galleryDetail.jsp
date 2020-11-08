<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- 
<c:set var="gallery"  value="${galleryMap.gallery}"  />
 --%>
<c:set var="imageFileList"  value="${galleryMap.imageFileList}"  />


<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/gallery_detail.css"/>

<!-- script -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   

     function backToList(obj){
       obj.action="${contextPath}/gallery/gallery.do";
       obj.submit();
     }
 
    function fn_enable(obj){
       document.getElementById("i_title").disabled=false;
       document.getElementById("i_content").disabled=false;
       document.getElementById("i_imageFileName").disabled=false;
       document.getElementById("tr_file_upload").style.display="block";
       document.getElementById("tr_btn").style.display="none";
    }
 
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }  
    
     function fn_favorite(url,galleryNO,id){
          
          var form = document.createElement("form");
         var i_id = document.createElement("input");
         var i_galleryNO = document.createElement("input");
         var favoriteBtn = document.getElementById("favoriteBtn").style.disabled=true;
         
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
   /*  function fn_favorite(galleryNO,id){
          var _id=$(id);
           var _galleryNO = $(galleryNO);
          $.ajax({
             type:"post",
             async:false,  
             url:"${contextPath}/mypage/addFavorite.do",
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
       }    */
 </script>

</head>
<body>
   <div id="detailWrapper">
      <div class="gallery_info">
         <p class="gd_category">${gallery.category }</p>
         <p class="gd_title">${gallery.title }</p>
         
         <p class="gd_content">${gallery.content }</p>
         
         <p class="gd_hashtag">${gallery.hashtag }</p>
          
      </div>
      <div class="artist_info">
         <div class="card" tabindex="0">
              <span class="card__infoicon">
                <i class="fa fa-info"></i>
              </span>
              <h1 class="card__title"><span>Artist </span>${artist.name}</h1>
              <p class="card__description">저는 이순신입니다. 즐거운 감상하세요^_^</p>
              <c:if test="${not empty artist.sns_i && artist.sns_i !='null' }">
               <img src="${contextPath}/resources/image/insta_b.png"/><span class="sns_id"><a href="#">  ${artist.sns_i}</a></span>
               </c:if>
               <c:if test="${not empty artist.sns_f && artist.sns_f !='null' }">
               <img src="${contextPath}/resources/image/facebook_b.png"/><span class="sns_id">  ${artist.sns_f} </span>
               </c:if>
               <c:if test="${not empty artist.sns_b && artist.sns_b !='null' }">
               <img src="${contextPath}/resources/image/blog_b.png"/><span class="sns_id">  ${artist.sns_b} </span>
            </c:if>
            </div>
            
         <div class="gd_artist">
            
         </div>
         
      </div>
      
   </div>
   
   
   <div id="imageWrapper">
         <c:if test="${not empty imageFileList && imageFileList!='null' }">
           <c:forEach var="item" items="${imageFileList}" varStatus="status" >
              <div>
                 <input  type= "hidden"   name="originalFileName" value="${item.imageFileName }" />
                 <img src="${contextPath}/imageList.do?galleryNO=${gallery.galleryNO}&imageFileName=${item.imageFileName}" id="preview"  />
              </div>
            </c:forEach>
          </c:if>
      
   </div>
   <input type="button" id="favoriteBtn" value="좋아요" onClick="fn_favorite('${contextPath}/mypage/addFavorite.do','${gallery.galleryNO}','${member.id}')"/>
   <%-- <input type="button" id="favoriteBtn" value="좋아요" onClick="fn_favorite('${gallery.galleryNO}','${member.id}')"/> --%>
   <input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)">
   
   
   
</body>
</html>