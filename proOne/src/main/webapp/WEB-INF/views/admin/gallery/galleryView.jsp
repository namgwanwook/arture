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
<title>승인된 작품 상세페이지</title>
<style>
	#tr_btn_modify{
       display:none;
     }
     
     #preview{
     	width: 70%;
     }
</style>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" >
function backToList(obj){
	obj.action="${contextPath}/admin/gallery/galleryList.do";
	obj.submit();
  }

function fn_remove_gallery(url, galleryNO){
	var answer=confirm(galleryNO+"번 게시물\n정말로 삭제하시겠습니까?");
	   if(answer==true){
	      var form = document.createElement("form");
	      var gallery = document.createElement("input");
	      
	      gallery.name="galleryNO";
	      gallery.value= galleryNO;
	      
	      form.appendChild(gallery);
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
      			접수 번호
   				</td>
   				<td >
    				<input type="text"  value="${gallery.galleryNO }"  disabled />
   				</td>
  			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">
     			 제목 
   				</td>
   				<td>
    				<input type=text value="${gallery.title }"  name="title"  id="i_title" disabled />
   				</td>   
  			</tr>
  			<tr>
    			<td width="150" align="center" bgcolor="#FF9933">
     			 내용
   				</td>
   				<td>
    				<textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${gallery.content }</textarea>
    				
   				</td>  
  			</tr>
 

  			<tr>
	   			<td width="150" align="center" bgcolor="#FF9933">
	      		등록일자
			   	</td>
			   	<td>
			   		<input type=text name="writeDate" value="${imagesList.get(0).regDate}" disabled />
			   	</td>   
  			</tr>
			<c:if test="${not empty imagesList && imagesList!='null' }">
				<c:forEach var="item" items="${imagesList}" varStatus="status">
					<tr>
						<td width="150" align="center" bgcolor="#FF9933">
							이미지${status.count }
						</td>
						<td>
							<input type="hidden" name="originalFileName" value="${item.imageFileName }" /> 
							<img src="${contextPath}/imageList.do?galleryNO=${gallery.galleryNO}&imageFileName=${item.imageFileName}" id="preview" /><br>
						</td>
					</tr>
					
				</c:forEach>
			</c:if>

			<tr  id="tr_btn">
		   		<td colspan="2" align="center">
			      	<input type=button value="갤러리 삭제" onClick="fn_remove_gallery('${contextPath}/admin/gallery/removeGallery.do', ${gallery.galleryNO })">
			    	<input type=button value="목록" onClick="backToList(this.form)">
		   		</td>
		  	</tr>
		</table>
	</form>
</body>
</html>