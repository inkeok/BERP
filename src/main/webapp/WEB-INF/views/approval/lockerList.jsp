<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#lockerListTable{
	margin: 10px 0;
}
</style>
</head>
<body>
<div class='centerFrame'>
<h1>보관함</h1>
<form id='form_deleteLocker' action='deleteLocker.ap?employee_id=${employee_id}&url=lockerList.ap'> 
<input type='hidden' name='employee_id' value='${employee_id }'>
<input type='hidden' name='url' value='lockerList.ap'>

<table id='lockerListTable'>


<colgroup>
	<col width='50px'>
	<col width='150px'>
	<col width='100px'>
	<col width='100px'>
	<col width='100px'>
</colgroup>

<tr>
	<th></th>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>날짜</th>
</tr>
<c:forEach items='${lockerList}' var='l'>
<tr>
	<td><input type="checkbox" class='deleteCheck' name='deleteCheck' value='${l.ing_no}'></td>
	<td>${l.no}</td>
	<td><a onclick='location="lockerListDetail.ap?no=${l.no}&employee_id=${employee_id}&ing_no=${l.ing_no}"'>${l.document_title}</a></td>
	<td>${l.document_date}</td>
	<td>${l.ing_no}</td>
</tr>
</c:forEach>
</table>
</form>
<a class='sideBtn-empty' id='deleteLockerList'>삭제</a>
</div>
<script>
//let deleteChecks[] = document.querySelectorAll('.deleteCheck');
// document.querySelector('#deleteLockerList').onclick = function(){
// 	//if(deleteChecks[].length == 0) return;
// 	document.querySelector('#Form_deleteLocker').submit();	
// }

$('#deleteLockerList').click(function(){
// // 	console.log( 'deleteLocker.ap?email=${email}&url=lockerList.ap');
// // 	return;
	
// 	location='deleteLocker.ap?email=${email}&url=lockerList.ap';
	
// // 	$('#Form_deleteLocker').attr('action', 'deleteLocker.ap?email=${email}&url=lockerList.ap')
	$('#form_deleteLocker').submit();
});






</script>
</body>
</html>