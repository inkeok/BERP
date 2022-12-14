
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Insert title here</title>

<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date()%>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<script src='js/apply_pic.js?<%=new java.util.Date()%>'></script>
<script src='js/apply.js?<%=new java.util.Date()%>'></script>

<style>
.hrlist {
	margin: 1rem 0;
	color: #000000;
	font-size: 38px;
	font-family: 'Noto Sans KR' !important;
}
table {
	margin-top: 30px;
	/* 	border-top-left-radius: 20px; */
	/*     border-top-right-radius: 20px; */
	padding-bottom: 2rem;
	border-radius: 15px;
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
td {
	text-align: left;
	padding-left: 30px;
	
}

th {
	background: #12192c;
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
.kk-btn {
	padding: 1em 1.8em;
	font-size: 10px;
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
footer{
top:50%
}
.btnSet{
text-align:center;
	margin-top: 30px;
}

#preview_pic img{
	width:100%!important;

	z-index: 9999;
}

.valid {
color: green;
font-size: 14px;
font-weight: bold;
}

.invalid {
color: red;
font-size: 14px;
font-weight: bold;
}

#delete-file-pic, #attach-file, #delete-file, #attach-file-pic {
display: none;}

</style>
</head>
<body>
	<!-- <h2 class="center hrlist">??????</h2> -->

	<form method='post' action='insert.apply' enctype='multipart/form-data'>
		<!-- 
<form method='post' action='fillout.apply'  enctype='multipart/form-data'>
 -->
		<h3 class="center hrlist">${recruit.recruit_title} ????????? ??????</h3>
		<input type='hidden' name='recruit_num' value='${recruit.recruit_num}'>
		<hr>
		<table class='w-px1000'>
			<colgroup>
				<col width="200px">
				<col width="350px">
			</colgroup>
			<tr>
				<th>??????</th>
				<td><input style="width: 200px;" type='text' class="chk" name='apply_name'
					placeholder="??????"></td>

				<!-- ?????? ?????? -->
				<td rowspan='3' style="padding:0; margin: 0; width: 150px; border: 1px solid #bbb; text-align: center;">
					<!-- <div class='align'> -->
					<div>
						<label> 
						<input type='file' name='pic_name' id='attach-file-pic'>
							<a><i class="font-b fa-solid fa-file-circle-plus"></i>???????????? ??????</a>
						</label> 
					</div>
				<div>
						
						
						<span id='preview_pic'></span>
				
				</div>
						
						<a id='delete-file-pic'><i
							class="font-r fa-solid fa-trash-can"></i></a>
				<!-- 	</div> -->


				</td>
			</tr>

			<tr>
				<th>???????????????</th>
				<td><input style="width: 200px;" type='text' class="chk" name='apply_phone'
					placeholder="?????????"><a class='kk-btn' id='btn-id'>????????????</a>
					<div class='valid'>?????????????????? ???????????????</div></td>
			</tr>
			<tr>
				<th>?????????</th>
				<td><input style="width: 200px;" type='text' class="chk" name='apply_email'
					placeholder="?????????">
					<div class='valid'>????????? ???????????????</div></td>
			</tr>
			<tr>
				<th>????????????</th>
				<td colspan='2' class='text-left'>
					<div class='align'>
						<label> <input type='file' name='file' id='attach-file'>
							<a><i class="font-b fa-solid fa-file-circle-plus"></i></a>
						</label> <span id='file_name'></span> <a
							id='delete-file'><i class="font-r fa-solid fa-trash-can"></i></a>
					</div>
				</td>
			</tr>

			<tr>
				<th>????????? ????????????</th>
				<td colspan='2'><input type='password' class="chk"
					name='apply_pw' id="apply_pw" placeholder="????????????">
					<div class='valid'>???????????? ???????????????</div> <!-- <span id="passEqual1">????????????</span> -->

				</td>
			</tr>
			<tr>
				<th>???????????? ??????</th>
				<td colspan='2'><input type='password' class="chk"
					name='apply_pw_ck' id="apply_pw_ck" placeholder="???????????? ??????">
					<div class='valid'>???????????? ???????????????</div> <!-- <span id="passEqual2">????????? ????????????</span> -->

				</td>

			</tr>


		</table>
		<div class='btnSet'>
			<a class='new-btn' id='save'>??????</a> 
			<a class='new-btn' href='applyList.apply'>??????</a>
		</div>
	</form>

	<script>
		/* $('#save').click(function(){
		 $('form').submit(); //?????? ?????? : if( emptyCheck() ) 
		 }); */
		$('#save').click(function() {
			if ($('[name=apply_name]').val() == '') {
				alert('????????? ???????????????!');
				$('[name=apply_name]').focus();
				return;
			}

			var apply_phone = $('[name=apply_phone]');
			if (apply_phone.hasClass('chked')) {
				//??????????????? ??????
				if (apply_phone.siblings('div').hasClass('invalid')) {
					alert('???????????? ??????!\n' + member.id.unUsable.desc);
					apply_phone.focus();
					return;
				}

			} else {
				//?????????????????? ?????? ??????
				//????????? ???????????? ???????????? ??????
				if (tagIsInValid(apply_phone))
					return;
				else {
					//???????????? ??????????????? ?????????????????? ?????? ??????
					alert('???????????? ??????!\n' + member.id.valid.desc);
					apply_phone.focus();
					return;
				}
			}

			if (tagIsInValid($('[name=apply_pw]')))
				return;
			if (tagIsInValid($('[name=apply_pw_ck]')))
				return;
			if (tagIsInValid($('[name=apply_email]')))
				return;

			if (emptyCheck())
				$('form').submit();
		});

		
		
		function tagIsInValid(tag) {
			var status = member.tag_status(tag);
			if (status.code == 'invalid') {
				alert('????????? ?????? ??????\n' + status.desc);
				tag.focus();
				return true;
				;
			} else
				return false;

		}

		$('#btn-id').click(function() {
			phone_check();
		});
		//????????? ????????????
		function phone_check() {
			var apply_phone = $('[name=apply_phone]');
			//?????? ???????????? ????????? ?????? ????????? ?????? ?????? 
			if (apply_phone.hasClass('chked'))
				return;
			var status = member.tag_status(apply_phone);
			if (status.code == 'invalid') {
				alert('???????????? ?????????\n' + status.desc);
				apply_phone.focus();
			} else {
				$.ajax({//????????????
					url : 'phone_check',
					data : {
						apply_phone : apply_phone.val()
					},
					success : function(response) {
						console.log(response)
						//1, ???????????? , 0 ???????????? <controller?????? ?????????
						response = response ? member.id.usable
								: member.id.unUsable;
						apply_phone.siblings('div').text(response.desc)
								.removeClass('invalid valid').addClass(
										response.code);
						apply_phone.addClass('chked');

					},
					error : function(req, text) {
						alert(text + ':' + req.status);
					}

				});
			}
		}

		$('.chk').keyup(
				function(e) {
					//????????? ???????????? enter??? ????????? ???????????? ?????? 
					if ($(this).attr('name') == 'apply_phone'
							&& e.keyCode == 13) {
						phone_check();
					} else {
						$(this).removeClass('chked');
						var status = member.tag_status($(this));
						$(this).siblings('div').text(status.desc).removeClass(
								'valid invalid').addClass(status.code);

					}

				});
	</script>


</body>
</html>