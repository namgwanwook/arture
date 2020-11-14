<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	body {
		-ms-overflow-style: none; 
	  	margin:0;
	  	padding:0;
	}
	
	/* chrome etc */
	body::-webkit-scrollbar { 
	    display: none !important; 
	}
	
	 #container {
        width: 100%;
        margin: 0px auto;        
        text-align:center;
   
      }
      #header {
        background-color: #000;
      }
      #sidebar-left {
        width: 17%;
        height:600px;
        float: left;
        background-color: #eee;
        font-size:18px;
      }
      #content {
        width: 83%;
        float: left;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
         background-color: black;
      }
      
    </style>

<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
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