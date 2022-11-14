<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table { margin: 0 auto;  border-collapse: collapse; }
table tr { height: 46px }
table.tb-list tr { height: 38px }
table th, table td { border:1px solid #b0b0b0; }
table td { padding: 6px 10px }
table th { background-color: #f6f6f6 }
/*td에 말줄임 표시 */
table.tb-list {table-layout: fixed;}
table.tb-list td{
	overflow: hidden; text-overflow:ellipsis; white-space: nowrap;}

table a:hover, .grid a:hover { font-weight: bold; }
a { cursor: pointer; }
a:link, a:visited { text-decoration: none;  color:inherit; }
</style>
</head>
<body>
<h3>공지사항</h3>
<form method='post' action='list.no'>
<div id='list-top' class='w-px1200'>
	<ul>
		<li>
		
			<select name='search' class='w-px100'> <!-- name줘야 전달가넝 -->
				<option value='all' ${page.search eq 'all'? 'selected':'' }>유형</option>				
			
			</select>
		
		</li>
		<li><input type='text' value='${page.keyword }' name='keyword' class='w-px300'> </li>
		<li><a class='btn-fill' onclick='$("form").submit()'>검색</a></li>
	
	</ul>
	<ul><!-- 관리자인 경우만 글쓰기 가능 -->
		<%-- <c:if test='${loginInfo.admin eq "Y"}'> --%>
		<li><a class='btn-fill' href='new.rec'>글쓰기</a></li>
		<%-- </c:if> --%>
	</ul>
</div>
<input type='hidden' name='curPage' value='1'>
</form>

<!-- 테이블시작 -->
<table class='w-px1200 tb-list'>
<colgroup>
	<col width='100px'>
	<col>
	<col width='140px'>
	<col width='140px'>
	<col width='100px'>
</colgroup>
<tr><th>유형</th>
	<th>제목</th>
	<th>접수기간</th>
	
</tr>
<c:forEach items='${recruitList}' var='vo'>
<tr><td>${vo.code_name}</td>
	
	
	<td><a href="detail.rec?recruit_num=${vo.recruit_num }">
	${vo.recruit_title }
	</a>
	</td>
	
	<td>${vo.recruit_start}~${vo.recruit_end }</td>
	
	
</tr>
</c:forEach>
</table>
<div class='btnSet'>

</div>
<script>
function page(no) {
	$('[name=curPage]').val(no);
	$('form').submit();
}

</script>

</body>
</html>