<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/approval.css?<%=new java.util.Date()%>' rel='stylesheet'>
<link href='js/approval.js?<%=new java.util.Date()%>' rel='stylesheet'>
<style>
</style>
</head>
<body>
<div>
<h2>보관함</h2>
<form id='form_deleteLocker' action='deleteLocker.ap?employee_id=${employee_id}&url=lockerList.ap'> 
<input type='hidden' name='employee_id' value='${employee_id }'>
<input type='hidden' name='url' value='lockerList.ap'>

<table id='width80' class="table table-striped table-hover w-px1600">

<colgroup>
	<col width='30px'>
	<col width='80px'>
	<col width='300px'>
	<col width='150px'>
</colgroup>

<tr>
	<th></th>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
</tr>
<c:forEach items='${lockerList}' var='l'>
<tr>
	<td><input type="checkbox" class='deleteCheck' name='deleteCheck' value='${l.ing_no}'></td>
	<td>${l.no}</td>
	<td><a onclick='location="lockerListDetail.ap?no=${l.no}&employee_id=${employee_id}&ing_no=${l.ing_no}"'>${l.document_title}</a></td>
	<td>${l.document_date}</td>
</tr>
</c:forEach>
</table>
</form>

<div id='btnFix'><a class='btn-empty' id='deleteLockerList'>삭제</a></div>
</div>

<script>
$('#deleteLockerList').click(function(){
	if(confirm('삭제하시겠습니까?'))
	$('#form_deleteLocker').submit();
});
</script>
</body>
</html>