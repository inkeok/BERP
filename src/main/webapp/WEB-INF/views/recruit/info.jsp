<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->

</head>
<body>
<h3>채용공고 디테일</h3>

<table class='w-px1000'>

<tr><th class='w-px140'>유형</th>
	<td>
		${vo.employee_pattern }
	</td>
</tr>
<tr><th>채용시작일</th>
<td>
${vo.recruit_start }
</td>
</tr>
<tr><th>채용종료일</th>
<td>
${vo.recruit_end }
</td>
</tr>



<tr><th class='w-px140'>제목</th>
	<td>
	${vo.recruit_title }
	
	</td>
</tr>
<tr><th>내용</th>
	<td>
	${vo.recruit_content }



</td>
</tr>
<tr><th>첨부파일</th>
	<td>
	
<div>
<span id='file_name'>${vo.file_name }</span>
<c:if test="${not empty vo.file_name }">
<a id='download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
</c:if>
</div>
</td>
</tr>
</table>
<div>
<a href='list.rec' class='btn-fill'>목록으로 </a>

<!-- 관리자로 로긴 한 경우만 수정ㅅ/삭제 가능 -->
<%-- <c:if test='${loginInfo.admin eq "Y" }'> --%>
<a class='btn-fill' href='modify.rec?recruit_num=${vo.recruit_num }'>정보수정 </a>
<a class='btn-fill' id='remove'>정보삭제</a>
<%-- </c:if> --%>
</div>


<script>


$('#remove').click(function() {
	if(confirm('정말 삭제?')) {
		
		location='delete.rec?recruit_num=${vo.recruit_num}';
	}
});
if(isImage("${vo.file_name}")) {
	$('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
	
}

</script>


</body>
</html>







