<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#postForm{
	margin: 10px 0;
}
</style>
</head>
<body>
<div class='centerFrame'>
<form id='postForm' method='post' action='insertPost.ap?email=${loginInfo.email}&url=submitList.ap' enctype='multipart/form-data'>
	<input type='hidden' name='employee_id' value='${loginInfo.employee_id}'>
	<input type='hidden' name='department_id' value='${loginInfo.department_id}'>
	<input type='hidden' name='company_cd' value='${loginInfo.company_cd}'>
	
	
	<select id='department_name' name='department_name'>
	<option value='부서'>부서</option>
	<c:forEach items='${departments}' var='d'>
	<option ${department_name eq d.department_name ? 'selected' : ''} value='${d.department_name}'>
	${d.department_name}</option>
	</c:forEach>	
	</select>
	
	<select id='' name='approver_id'>
	<option value='-1'>결재자</option>
	<c:forEach items='${departmentEmployee}' var='de'>
	<option value='${de.employee_id}'>${de.position} ${de.name}</option>
	</c:forEach>
	</select>
	
	
	<table id='postTable'>
		<tr><th>제목</th>
			<td><input type='text' id='document_title' name='document_title'></td>
		</tr>
		<tr><th>내용</th>
			<td><textarea id='textarea' name='document_content'></textarea></td>
		</tr>
		<tr><th height='30px'>첨부파일</th>
			<td>
				<input type="file" id='file' name='file'>
			</td>
		</tr>
	</table>
</form>
<div id='postBtn'>
<a class='sideBtn-fill' id='postSubmit'>Submit</a>
<a class='sideBtn-empty' id='postCancel'>Cancel</a>
</div>
</div>
<script>
document.querySelector('#postSubmit').onclick = function(){
	document.querySelector('#postForm').submit();	
}

//취소 버튼 선택 시 
$('#postCancel').click(function(){
	if(confirm('임시보관함에 저장할까요?')){
		$('#postForm').attr('action', 'insertLocker.ap?email=${loginInfo.email}');
		$('#postForm').submit();
	}else{
		location = 'submitList.ap?email=${loginInfo.email}'
	}
})

//부서선택 시 그에 맞게 정보를 다시 가져옴
$('#department_name').change(function(){
	$('#postForm').attr('action', 'post.ap');
	$('#postForm').submit();
});



</script>
</body>
</html>