<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>applyForm 페이지</title>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <style type="text/css">
      /* 폰트 */
      @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
   
      select {
         -moz-appearance:none;
         -webkit-appearance:none;
         appearance:none;
         
         font-family:"Noto Sansf KR", sans-serif;
         font-size: 1rem;
         font-weight: 400;
         line-height: 1.5;
         
         color: #444;
         background-color: #fff;
         
         padding: 0.6em 1.4em 0.5em 0.8em;
         margin: 0;
         
         border: 1px solid #aaa;
         border-radius: 0.5em;
         box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
      }
      select:hover {
         border-color: #888;
      }
      select:focus {
         border-color: #aaa;
         box-shadow: 0 0 1px 3px rgba(59, 153, 252, 0.7);
         box-shadow: 0 0 0 3px -moz-mac-focusring;
         color: #222;
         outline: none;
      }
      select:disabled {
         opacity: 0.5;
      }
      label {
         font-family: "Noto Sans KR", sans-serif;
         font-size: 1rem;
         font-weight: 600;
         line-height: 1.3;  
         color: #444;
         margin-right: 0.5em;
      }

   </style>
   <title>applyForm 페이지</title>
</head>
<body>
   <h1 style="text-align:center">신청하기</h1>
   <form name="apply_form.do" method="post" action="${contextPath}/applyForm/addNewArticle.do" enctype="multipart/form-data" accept-charset="UTF-8">
      <table border="0" align="center">
         <tr>
            <td align="right">작성자</td>
            <td colspan=2 align="left"><input  name="id" type="text" size="20" maxlength="100" value="${member.name }" readonly /></td>
         </tr>
         <tr>
            <td align="right">제목</td>
            <td colspan=2 align="left"><input  name="title" type="text" size="20" maxlength="150"/></td>
         </tr>
         <tr>
            <td aligh="right" valign="top">컨텐츠</td>
            <td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
         </tr>
         <tr>
            <td align="right">HashTag</td>
            <td colspan=2 align="left"><input name="hashtag" type="text" size="20" maxlength="150"/></td>
         </tr>
         <tr>
            <label for="category">
               카테고리
            </label>
            <select id="category" name="category">
               <option value="">-- 선택하세요 --</option>
                  <option value="category_child1">순수 미술</option>
                  <option value="category_child2">디자인</option>
                  <option value="category_child3">공예</option>
                  <option value="category_child4">사진</option>
                  <option value="category_child5">패션</option>
                  <option value="category_child6">기타</option>
            </select>
         </tr>
         <tr>
            <td align="center"><input multiple="multiple" type="file" name="file" accept="image/png,image/jpg,image/jpeg" /></td>
         </tr>
         <tr>
            <td align="right"></td>
            <td colspan="2"><input type="submit" value="보내기" /></td>
         </tr>

      </table>
   
   </form>
   
   
</body>
</html>