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
<h3>지원자 리스트/ 추후 관리자만 볼 수 있게 수정할거임</h3>
<form method='post' action='applicantList.apply'>
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
	<ul><!-- 관리자인 경우만 글쓰기 가능 -->
		<%-- <c:if test='${loginInfo.admin eq "Y"}'> --%>
		<li><a class='btn-fill' href='pass_check.apply'>합격자 리스트</a></li>
		<%-- </c:if> --%>
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
<tr><th>유형</th>
	<th>지원자번호</th>
	<th>이름</th>

	<th>전화번호</th>
	<th>합/불합</th>
	
</tr>
<c:forEach items='${applicants}' var='vo'>
<tr><td>${vo.recruit_num}</td>
	
	<td>${vo.apply_num }</td>
	<td style="text-align:left"><a href="fillout.apply?recruit_num=${vo.recruit_num }">
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
 	<td>
 	
 	<%-- <c:forEach items='${applicants}' var='vo'> --%>
 	<label>
	 	<input type="radio" name="apply_check" value="N"	 	
	 	<c:if test="${vo.apply_check eq 'N' }">checked</c:if>
	 		 	
	 	> 불합
		<input type="radio" name="apply_check" value="Y"
		<c:if test="${vo.apply_check eq 'Y' }">checked</c:if>
	 	
		> 합
 	</label>
 <%-- 	</c:forEach> --%>


 	
 	</td>
	
	
</tr>
</c:forEach>
</table>


<script>
function page(no) {
	$('[name=curPage]').val(no);
	$('form').submit();
}

</script>

</body>
</html>