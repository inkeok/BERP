<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<script src='js/apply_pic.js?<%=new java.util.Date() %>'></script>
<script src='js/apply.js?<%=new java.util.Date() %>'></script>

</head>
<body>
<h3>지원서 수정!!!!!!!!!!!!!</h3>

<form method='post' action='update.apply'  enctype='multipart/form-data'>
<!-- 
<form method='post' action='fillout.apply'  enctype='multipart/form-data'>
 -->
<h3>${recruit.recruit_title}</h3>
<input type='hidden' name='apply_num' value="${vo.apply_num }">
<input type='hidden' name='file_name' value="${vo.file_name }">
<input type='hidden' name='pic_file_name' value="${vo.apply_pic_name }">

<table class='w-px1000'>
<tr><th>이름</th>
<td> 
<input type='text' class="chk" name='apply_name' value="${vo.apply_name }">
</td>


<td rowspan='3' style="width:100px">
<div class='align'>
		<label>
			<input type='file' name='pic_name' id='attach-file-pic'>
			
		</label>
		<span id='pic_file_name'>${vo.apply_pic_name}</span>
		<span id='preview_pic'></span>
		<!-- //첨부파일이 있는 경우 삭제 이미지가 보이게 처리 -->
		<a id='delete-file-pic' style='display:${empty vo.apply_pic_name ? "none" : "inline"}'><i class="font-r fa-solid fa-trash-can"></i></a>
		
		</div>

</td>
<tr>
<th>휴대폰번호</th>
<td>
<input type='text'  class="chk" name='apply_phone' value="${vo.apply_phone }">
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input type='text'  class="chk" name='apply_email' value="${vo.apply_email }">
</td>
</tr>


<tr><th>첨부파일</th>
	<td colspan= '2' class='text-left'>
		<div class='align'>
		<label>
			<input type='file' name='file' id='attach-file'>
			<a><i class="font-b fa-solid fa-file-circle-plus"></i></a>
		</label>
		<span id='file_name'>${vo.file_name}</span>
		<span id='preview'></span>
		<!-- //첨부파일이 있는 경우 삭제 이미지가 보이게 처리 -->
		<a id='delete-file' style='display:${empty vo.file_name ? "none" : "inline"}'><i class="font-r fa-solid fa-trash-can"></i></a>
		
		</div>
	</td>
</tr>


 

</table>
<div class='btnSet'>
	<a class='btn-fill' id='save'>저장</a>
	<a class='btn-empty' onclick="history.go(-1)">취소</a>
</div>
</form>

<script>

$('#save').click(function(){
	$('[name=file_name]').val( $('#file_name').text() );
	if( emptyCheck() ) $('form').submit();
});
if(isImage("${vo.file_name}")) {
	$('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
	
}


if(isImage("${vo.apply_pic_name}")) {
	$('#pic_name').after('<span id="preview_pic"><img src="${vo.apply_pic_path}"</span>' );
	
}





</script>


</body>
</html>