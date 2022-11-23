<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${loginInfo.name } / 로그인정보</h3>
<%-- 
<form method='post' action='list.no'>
<div id='list-top' class='w-px1200'>
	<ul>
		<li>
		
			<select name='search' class='w-px100'> <!-- name줘야 전달가넝 -->
				<option value='all' ${page.search eq 'all'? 'selected':'' }>전체</option>
				
				<option value='title' ${page.search eq 'title'? 'selected':'' }>
				제목</option>
				<option value='content'${page.search eq 'content'? 'selected':'' }>내용</option>
				<option value='writer' ${page.search eq 'writer'? 'selected':'' }>작성자</option>
			</select>
		
		</li>
		<li><input type='text' value='${page.keyword }' name='keyword' class='w-px300'> </li>
		<li><a class='btn-fill' onclick='$("form").submit()'>검색</a></li>
	
	</ul>
	<ul><!-- 관리자인 경우만 글쓰기 가능 -->
		<c:if test='${loginInfo.admin eq "Y"}'>
		<li><a class='btn-fill' href='new.no'>글쓰기</a></li>
		</c:if>
	</ul>
</div>



</form>

 --%>
 
 <ul><!-- 관리자인 경우만 글쓰기 가능 -->
		<c:if test='${loginInfo.admin eq "Y"}'>
		<li><a class='btn-fill' href='new.no'>글쓰기</a></li>
		</c:if>
	</ul>
<table class='w-px1200 tb-list'>
<colgroup>
	<col width='100px'>
	<col>
	<col width='140px'>
	<col width='140px'>
	<col width='100px'>
</colgroup>
<tr><th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일자</th>
	<th>첨부파일</th>
</tr>
<c:forEach items='${list}' var='vo'>
<tr><td>${vo.notice_num}</td>
	
	<td>${vo.notice_title}</td>
	<td>${vo.notice_writer}</td>
	<td>${vo.notice_date}</td>
	<td>
		${empty vo.file_name ? '':'<i class="font-c fa-solid fa-paperclip"></i>' }
		
	</td>
</tr>
</c:forEach>


</table>

<script>


</script>

</body>
</html>