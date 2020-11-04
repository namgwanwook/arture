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
	
	function openProfile(){
		var myModal = document.getElementById('myModal');
		myModal.style.display="block";
	}
	
	function closeProfile(){
		// Get the modal
		document.getElementsByClassName("close")[0].style.display="block";
		document.getElementById('myModal').style.display = "none";
	}
		

     function backToList(obj){
	    obj.action="${contextPath}/member/listMembers.do";
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
				  <h1 class="card__title"><span>Artist </span>${member.name}</h1>
				  <p class="card__description">저는 이순신입니다. 즐거운 감상하세요^_^</p>
				  <c:if test="${not empty member.sns_i && member.sns_i !='null' }">
					<img src="${contextPath}/resources/image/insta_b.png"/><span class="sns_id"><a href="#">  ${member.sns_i}</a></span>
					</c:if>
					<c:if test="${not empty member.sns_f && member.sns_f !='null' }">
					<img src="${contextPath}/resources/image/facebook_b.png"/><span class="sns_id">  ${member.sns_f} </span>
					</c:if>
					<c:if test="${not empty member.sns_b && member.sns_b !='null' }">
					<img src="${contextPath}/resources/image/blog_b.png"/><span class="sns_id">  ${member.sns_b} </span>
				</c:if>
				</div>
				
			<div class="gd_artist">
				
			</div>
			
			
				<!-- <!-- Trigger/Open The Modal 
			    <button class="profileBtn" onClick="openProfile()">Open Profile</button>
			 
			    The Modal
			    <div id="myModal" class="modal">
			 
			      Modal content
			      <div class="modal-content">
			        <span class="close" onClick="closeProfile()">&times;</span>                                                               
			        <p>Some text in the Modal..</p>
			      </div>
      
   				 </div> -->
			
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
	
	
	
	
	<%-- <form name="frmArticle" method="post" action="${contextPath}"
		enctype="multipart/form-data">
		<table border=0 align="center">
			<tr>
				<td width=150 align="center" bgcolor=#FF9933>글번호</td>
				<td><input type="text" value="${gallery.galleryNO }" disabled />
					    <input type="hidden" name="articleNO" value="${gallery.galleryNO}"  />
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">작성자</td>
				<td><input type=text value="${member.name }" name="writer"
					disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">제목</td>
				<td><input type=text value="${gallery.title }" name="title"
					id="i_title" disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">내용</td>
				<td><textarea rows="20" cols="60" name="content" id="i_content"
						disabled />${gallery.content }</textarea></td>
			</tr>
			
			 <c:if test="${not empty imageFileList && imageFileList!='null' }">
				  <c:forEach var="item" items="${imageFileList}" varStatus="status" >
					    <tr>
						    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
						      이미지${status.count }
						   </td>
						   <td>
						     <input  type= "hidden"   name="originalFileName" value="${item.imageFileName }" />
						    <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${item.imageFileName}" id="preview"  /><br>
						   </td>   
						  </tr>  
						  <tr>
						    <td>
						       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
						    </td>
						 </tr>
					</c:forEach>
			 </c:if>
 	 		

			<c:choose>
				<c:when
					test="${not empty gallery.imageFileName && gallery.imageFileName!='null' }">
					<tr>
						<td width="150" align="center" bgcolor="#FF9933">
							이미지</td>
						<td><input type="hidden" name="originalFileName"
							value="${gallery.imageFileName }" /> <img
							src="${contextPath}/download.do?galleryNO=${gallery.galleryNO}&imageFileName=${gallery.imageFileName}"
							id="preview" /><br></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr id="tr_file_upload">
						<td width="150" align="center" bgcolor="#FF9933">
							이미지</td>
						<td><input type="hidden" name="originalFileName"
							value="${gallery.imageFileName }" /></td>
					</tr>
					<tr>
						<td></td>
						<td><img id="preview" /><br> <input type="file"
							name="imageFileName " id="i_imageFileName" disabled
							onchange="readURL(this);" /></td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">등록일자</td>
				<td><input type=text
					value="<fmt:formatDate value="${gallery.regDate}" />" disabled />
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">카테고리</td>
				<td><input type=text value="${gallery.category }"
					name="category" id="i_category" disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">해쉬태그</td>
				<td><input type=text value="${gallery.hashtag }" name="hashtag"
					id="i_hashtag" disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">인스타그램</td>
				<td><input type=text value="${member.sns_i }" name="sns_i"
					id="i_hashtag" disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">페이스북</td>
				<td><input type=text value="${member.sns_f}" name="sns_f"
					id="i_hashtag" disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">네이버블로그</td>
				<td><input type=text value="${member.sns_b}" name="sns_b"
					id="i_hashtag" disabled /></td>
			</tr>
			<tr id="tr_btn">
				<td colspan="2" align="center"><input type=button
					value="리스트로 돌아가기" onClick="backToList(this.form)"></td>
			</tr>
		</table>
	</form> --%>
</body>
</html>