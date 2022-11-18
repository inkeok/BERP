<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<div class="row mb-4" style= "width : 1200px">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex">
								<div class="flex-grow-1 align-self-center">
									<div class="text-muted">
										<p class="mb-2" id="times"></p>
										<form method='post' action='workList'>
		<div id='list-top' class='w-px1200'>
			<ul>
				<li>부서명</li>
				<li><select name='department_id' class='w-px200'
					onchange='$("form").submit()'>
						<option value='-1'>전체 부서</option>
						<c:forEach items='${departments}' var='d'>
							<option ${department_id eq d.department_id ? 'selected' : ''}
								value='${d.department_id}'>${d.department_name}</option>
						</c:forEach>
				</select></li>
			</ul>


		</div>
	</form>

									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 align-self-center">
							<div class="text-lg-center mt-4 mt-lg-0">
								<div class="row">
									<div class="col-4">
										<div></div>
									</div>
									<div class="col-4">
										<div></div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 d-none d-lg-block">
							<div class="clearfix mt-4 mt-lg-0"></div>
						</div>
					</div>
					<!-- end row -->
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mb-5" style= "width : 1200px">
		<div class="col-xl-12">
			<div class="card">
				<div class="card-body">
					<div class="clearfix">
						<div class="card-body">
							<div class="d-flex align-items-center mb-3">
								<div class="avatar-xs me-3">
									<span
										class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
										<i class="bx bx-task"></i>
									</span>
								</div>
								<h5 class="font-size-16 mb-0">근무 내역</h5>

							</div>

							<!--  work_result table 에서 가져온다 -->
							<table class="table table-sm">
								<thead>
									<tr>
										<th scope="col">근무 일자</th>
										<th scope="col">사번</th>
										<th scope="col">부서</th>
										<th scope="col">출근시간</th>
										<th scope="col">퇴근시간</th>
										<th scope="col">근무구분코드</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items='${workList}' var='vo'>
										<tr>
											<td><fmt:formatDate value="${vo.work_date}"
													dateStyle="full" pattern="yyyy년MM월dd일" /></td>
											<td>${vo.employee_id}</td>
											<td>${vo.department_name}</td>
											<td>${vo.start_work}</td>
											<td>${vo.end_work}</td>
											<td>${vo.work_status}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>











