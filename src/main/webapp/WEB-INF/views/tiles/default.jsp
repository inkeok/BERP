<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix='tiles'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<link rel='icon' type='image/x-icon' href='imgs/hanul.ico'>
<link href='css/common.css?<%=new java.util.Date()%>' rel='stylesheet'> 
<link href='css/app.css?<%=new java.util.Date()%>' rel='stylesheet'> 
<script src='js/app.js?<%=new java.util.Date()%>'></script>
<script src='js/common.js?<%=new java.util.Date()%>'></script>
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<tiles:insertAttribute name='container'/>
</body>
</html>