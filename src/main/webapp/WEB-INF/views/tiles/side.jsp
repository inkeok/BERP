<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix='tiles'%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>    
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>B ERP</title>
<link href='css/common.css?<%=new java.util.Date()%>' rel='stylesheet'> 

</head>
<body>

<tiles:insertAttribute name='side'/>
<tiles:insertAttribute name='container'/>

</body>
</html>