<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
.pagination {
	width: 1101px;
	background: #12192c;
	justify-content: center;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

.pagination li {
	margin-right: 14px;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
	cursor: pointer;
}

.w-px1600 {
	width: 1600px;
}

.center {
	text-align: center;
}

.hrlist {
	margin: 1rem 0;
	color: #000000;
	font-size: 38px;
	font-family: 'Noto Sans KR' !important;
}

table {
	margin-top: 5px;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

td a {
	color: #323232;
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #000000;
}

th {
	text-align: center;
}

th {
	background-color: #12192c;
	color: #fff;
}

tbody tr:hover, td:hover {
	background-color: rgba(255, 255, 255, 0.5);
}

tbody td {
	position: relative;
}

tbody td:hover:before {
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}

.new-btn {
	padding: 1em 1.8em;
	font-size: 14px;
	font-weight: 400;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 4px;
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: none;
	color: #ffffff;
	margin-bottom: 10px;
	background: #12192c;
	position: relative;
	left: 4%;
}

.button-second {
	background: #2b32b2;
	box-shadow: 0 3px 25px rgba(48, 37, 223, 0.7);
}

select {
	position: relative;
	left: 22%;
	width: 180px;
	padding: .7em 1.9em;
	font-family: inherit;
	background: url('imgs/arrow.jfif') no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	box-shadow: 0 1px 25px rgba(0, 0, 0, 0.2);
	border: 2px solid #fff[];
	border-radius: 3px;
}

select::-ms-expand {
	display: none;
}

td button {
	padding: .5em 1.3em;
	font-size: 14px;
	font-weight: 400;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 4px;
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: none;
	color: #ffffff;
	background: #63666c;
}

td button:nth-child(1) {
	margin-right: 10px;
}
</style>
</head>
<body>
	<h2 class="center hrlist">사원별 급여조회</h2>

	<form method="post" action="list.sa" class="list">

		<div id='list-top' class='w-px1200'>
			<ul>
				<li><select name='department_id' onchange='$("form").submit()'>
						<!-- name줘야 전달가넝 -->
						<option value='-1'>전체 유형</option>
						<c:forEach items='${departments}' var='c'>
							<option
								${department_name eq c.department_name ? 'selected' : '' }
								value='${c.department_id}'>${c.department_name }</option>
						</c:forEach>

				</select></li>


			</ul>

		</div>
		<div class="w-px1600">
			<table class="table-hover">
				<colgroup>
					<col width="140px" />
					<col width="100px" />
					<col width="100px" />
					<col width="80px" />
					<col width="130px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="250px" />

				</colgroup>

				<thead>
					<tr>
						<th>사번</th>
						<th>부서명</th>
						<th>사원명</th>
						<th>관리자</th>
						<th>입사일자</th>
						<th>직급</th>
						<th>업무형태</th>
						<th>기본급여</th>
						<th>정보수정</th>
					</tr>

				</thead>
				<c:forEach items="${list}" var="vo">
					<tbody>
						<tr class="tr-start">
							<td>${vo.employee_id}</td>
							<td>${vo.department_name}</td>
							<td>${vo.name}</td>
							<td>${vo.admin}</td>
							<td>${vo.hire_date}</td>
							<td>${vo.position_name}</td>
							<td>${vo.employee_pattern_name}</td>
							<td>$${vo.salary}</td>
							<td><button type="button"
									onclick='location.href="modify.sa?id=${vo.employee_id}"'
									class=''>정보수정</button>
								<button type="button"
									onclick='location.href="bonus.sa?id=${vo.employee_id}"'
									class=''>상여금지급</button></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</form>
	<div style="text-align: -webkit-center;">
		<ul class="pagination">

		</ul>
	</div>
</body>
<script>
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".tr-start").mouseover(function() {
			$(this).next("ul").toggleClass("hide");
		});
	});

	function pagination() {
		var req_num_row = 9;
		var $tr = jQuery('tbody tr');
		var total_num_row = $tr.length;
		var num_pages = 0;
		if (total_num_row % req_num_row == 0) {
			num_pages = total_num_row / req_num_row;
		}
		if (total_num_row % req_num_row >= 1) {
			num_pages = total_num_row / req_num_row;
			num_pages++;
			num_pages = Math.floor(num_pages++);
		}

		jQuery('.pagination').append("<li><a class=\"prev\">Previous</a></li>");

		for (var i = 1; i <= num_pages; i++) {
			jQuery('.pagination').append("<li><a>" + i + "</a></li>");
			jQuery('.pagination li:nth-child(2)').addClass("active");
			jQuery('.pagination a').addClass("pagination-link");
		}

		jQuery('.pagination').append("<li><a class=\"next\">Next</a></li>");

		$tr.each(function(i) {
			jQuery(this).hide();
			if (i + 1 <= req_num_row) {
				$tr.eq(i).show();
			}
		});

		jQuery('.pagination a').click('.pagination-link', function(e) {
			e.preventDefault();
			$tr.hide();
			var page = jQuery(this).text();
			var temp = page - 1;
			var start = temp * req_num_row;
			var current_link = temp;

			jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");

			for (var i = 0; i < req_num_row; i++) {
				$tr.eq(start + i).show();
			}

			if (temp >= 1) {
				jQuery('.pagination li:first-child').removeClass("disabled");
			} else {
				jQuery('.pagination li:first-child').addClass("disabled");
			}

		});

		jQuery('.prev').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:first-child').removeClass("active");
		});

		jQuery('.next').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:last-child').removeClass("active");
		});

	}

	jQuery('document').ready(function() {
		pagination();

		jQuery('.pagination li:first-child').addClass("disabled");

	});
</script>
</html>