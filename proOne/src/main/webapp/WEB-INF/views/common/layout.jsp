<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<style>
	body{
		margin: 0;
		padding: 0;
		background-color:#000;
		color:#fff;
	}
      #container {
        width: 100%;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
      	width:100%;
		height:100px;
		margin:0 auto;
        background-color: transparent; 
      }
      #content {
        width: 100%;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        color:#fff;
        background-color: #000;
      }
      
    </style>

<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>