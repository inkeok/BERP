<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form id='postForm' method='post' action='insertPost.ap' enctype='multipart/form-data'>
	<input type='hidden' name='document_submit' value='y'>
	<input type='hidden' name='employee_id' value='${loginInfo.employee_id}'>
	<input type='hidden' name='department_id' value='${loginInfo.department_id}'>
	<input type='hidden' name='company_cd' value='${loginInfo.company_cd}'>
	
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
<input type='button' class='sideBtn-fill' value='submit' id='postSubmit'>
<input type='button' class='sideBtn-empty' value='cancel' onclick='location="submitList.ap"'>
</div>
</div>
<script>
document.querySelector('#postSubmit').onclick = function(){
	document.querySelector('#postForm').submit();	
}
</script>
</body>
</html>