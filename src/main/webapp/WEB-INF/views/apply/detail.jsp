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
<style>
td {
text-align:left;
padding-left: 2rem;
}
</style> 

</head>
<body>
<h3>지원서 확인</h3>
<form method='post' action='insert.apply'  enctype='multipart/form-data'>
<h3>${vo.recruit_title}</h3>
<input type='hidden' name='recruit_num' value='${vo.recruit_num}'>
<table class='w-px1000'>

<tr><th>지원자번호</th>
<td> 
${vo.apply_num }
</td>
</tr>

<tr><th>이름</th>
<td> 
${vo.apply_name }
</td>
<tr>
<th>휴대폰번호</th>
<td>
${vo.apply_phone }
</td>
</tr>
<tr>
<th>이메일</th>
<td>
${vo.apply_email }
</td>
</tr>
<tr><th>첨부파일</th>
	<td>
		<div>
		<span id='file_name'>${vo.file_name }</span>
<%-- <input type="hidden" id='file_name' value="${vo.file_name }"> --%>

<c:if test="${not empty vo.file_name }">
<a id='download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
</c:if>
</div>
	</td>
</tr>

</table>
<div class='btnSet'>
<a class='btn-fill' href='modify.apply?apply_num=${vo.apply_num }'>지원서 수정 </a>
<a class='btn-fill' id='remove'>지원서 삭제</a>
<a class='btn-fill' href='applyList.apply'>목록으로</a>
</div>
</form>

<script>

$('#download').click(function(){
	
	$(this).attr('href'
			, 'download.apply?apply_num=${vo.apply_num }&url='+$(location).attr('href'));
	
});


$('#remove').click(function() {
	if(confirm('정말 삭제하시겠습니까?')) {
		
		location='delete.apply?apply_num=${vo.apply_num}';
	}
});
if(isImage("${vo.file_name}")) {
	$('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
	
}


</script>


</body>
</html>