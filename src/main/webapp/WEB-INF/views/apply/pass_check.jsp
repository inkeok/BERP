<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>

 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src='js/apply_pic.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
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
<h3>합격자리스트</h3>
<h3>${vo.recruit_title }</h3>
<form method='post' action='pass_check.apply'>
<div id='list-top' class='w-px1200'>
	<ul>
		<li>
		
			<select name='recruit_num' class='w-px100' onchange='$("form").submit()'> <!-- name줘야 전달가넝 -->
				<option value='all'>전체 유형</option>
				<c:forEach items='${recruit_list}' var='re'>
				
				<option 
				${recruit_num eq re.recruit_num ? 'selected' : '' } 				
				value='${re.recruit_num}' 				
				> 
				${re.recruit_title}</option>
				
				
				</c:forEach>
				
			</select>
		
		</li>
		
	
	</ul>
	
</div>
</form>


<!-- 테이블시작 -->
<table class='w-px1200 tb-list'>
<colgroup>
	<col width='100px'>
	<col>
	<col width='200px'>
	
</colgroup>
<tr>
<th>유형</th>
<th>공고</th>
	<th>지원자번호</th>
	<th>이름</th>

	<th>전화번호</th>
	
</tr>
<c:forEach items='${applicants}' var='vo'>
<tr>
<td>${vo.recruit_num}</td>
<td>${vo.recruit_title}</td>
	
	<td>${vo.apply_num }</td>
	<td style="text-align:left"><a href="register_em.apply?apply_num=${vo.apply_num }">
	${vo.apply_name }
	</a>
	</td>
	<%-- 
	<td>
	 <fmt:formatDate value="${vo.recruit_start}" pattern="yyyy-MM-dd"/>
	~
	 <fmt:formatDate value="${vo.recruit_end}" pattern="yyyy-MM-dd"/>
	
	</td>
	 --%>
 	<td>${vo.apply_phone }</td>
	
	
</tr>
</c:forEach>
</table>


<script>
if(isImage("${vo.apply_pic_name}")) {
	$('#pic_name').after('<span id="preview_pic"><img src="${vo.apply_pic_path}"</span>' );
	
}


</script>

</body>
</html>