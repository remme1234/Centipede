<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>


<!DOCTYPE html>
<html>
	<head>
  		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="nav"/>
  	</head>
	<body>
	<div style="margin-top: 100px;">
		<%-- <tiles:insertAttribute name="left"/> --%>
		<tiles:insertAttribute name="content"/>
 		<tiles:insertAttribute name="footer"/>
	</div>
	</body>
</html>