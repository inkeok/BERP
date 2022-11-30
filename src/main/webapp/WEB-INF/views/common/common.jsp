<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/styles.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>
<style>

body{
	width : 1600px;
}

td {
	color: #b1b1b1;
}

</style>
</head>
<body>
	<!-- <h2 class="center hrlist">코드관리</h2> -->
	<form action="common.cd">

		<div class="card mb-4">
	<div class="card-header">                                
	    코드관리
	</div>	
   <div class="card-body">
       <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
       	<div class="dataTable-top">
       		<div class="dataTable-dropdown">
       			<input type='hidden' name='code' id='code'>
       			<label>
       				<select class="dataTable-selector" name="code_title" onchange='$("#code").val("code_title"); $("form").submit()'>
       				<option class="title" value="all">인사코드</option>
						<c:forEach items='${code_titles}' var='c'>
							<option ${code_title eq c.code_title ? 'selected' : ''} 
									value='${c.code_title}'>${c.code_title}
							</option>
						</c:forEach>
					</select>
					
<!-- 					<select class="dataTable-selector" name="code_value" onchange='$("#code").val("code_value"); $("form").submit()'> -->
<!--        				<option value="all">문서코드</option> -->
<%-- 						<c:forEach items='${code_values}' var='c'> --%>
<%-- 							<option ${code_value eq c.code_value ? 'selected' : ''}  --%>
<%-- 									value='${c.code_value}'>${c.code_value} --%>
<!-- 							</option> -->
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
					
					<select class="dataTable-selector" name="code_used" onchange='$("#code").val("code_used"); $("form").submit()'>
       				<option value="all">고용형태코드</option>
						<c:forEach items='${code_usedd}' var='c'>  <!-- 드롭다운이름 처리 -->
							<option ${code_used eq c.code_used ? 'selected' : ''} 
									value='${c.code_used}' >${c.code_used}
							</option>
						</c:forEach>
					</select>
					
<!-- 					<select class="dataTable-selector" name="code_name" onchange='$("#code").val("code_name"); $("form").submit()'> -->
<!--        				<option value="all">근무구분코드</option> -->
<%-- 						<c:forEach items='${code_name}' var='c'> --%>
<%-- 							<option ${code_name eq c.code_name ? 'selected' : ''}  --%>
<%-- 									value='${c.code_name}'>${c.code_name} --%>
<!-- 							</option> -->
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
    			</label>
			</div>
		</div>
	
		</div>
<div class="dataTable-container">
<table id="datatablesSimple" class="dataTable-table">
	<thead>
	    <tr>
	     <th data-sortable="" style="width: 10%;">
	    	<span class="dataTable-sorter">인사코드</span>
	    </th>
        <th data-sortable="" style="width: 10%;">
        	<span class="dataTable-sorter">문서코드</span>
       	</th>
     	<th data-sortable="" style="width: 10%;">
     		<span class="dataTable-sorter">고용형태코드</span>
   		</th>
   		<th data-sortable="" style="width: 10%;">
     		<span class="dataTable-sorter">근무구분코드</span>
   		</th>
   		<th data-sortable="" style="width: 10%;">
   			<span class="dataTable-sorter">코드생성일</span>
		</th>
		<th data-sortable="" style="width: 13%;">
			<span class="dataTable-sorter">코드생성자</span>
		</th>
		</tr>
	</thead>   
      	<c:forEach items="${list}" var="vo">
            
            <tr><td><a href='common.detail?code_value=${vo.code_value}'>${vo.code_comment}</a></td>
            	<td>${vo.code_value}</td>
            	<td>${vo.code_used}</td>
            	<td>${vo.code_name}</td>
            	<td>${vo.code_birth}</td>
            	<td>${vo.code_maker_name}</td>
           	</tr>
           	</c:forEach>
        </table>
        </div><div class="dataTable-bottom"><div class="dataTable-info"></div></div>
        </div>
    </div>
</div>
</form>
 
</body>
</html>