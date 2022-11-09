<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix='tiles'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<link rel='stylesheet' type='text/css' href='/css/app.css?<%=new java.util.Date()%>'>
</head>
<body>
<tiles:insertAttribute name='container'/>
</body>
</html>