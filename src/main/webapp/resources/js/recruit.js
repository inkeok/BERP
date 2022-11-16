/**
 * 공통으로 사용할 함수들
 */


$(function(){

	
	//선택한 파일을 미리보기되도록 이미지로 보이게 처리
	$('#attach-file').change(function(){
		console.log( this.files[0] );
		var attached = this.files[0];
		if( attached ){ //선택한 파일이 있는 경우
			$('#file_name').text( attached.name ); //선택한 파일명 보이게
			$('#delete-file').css('display', 'inline'); //삭제버튼 보이게
			
			//미리보기 태그가 있으면 
			if( $('#preview').length > 0 ){
				//해당 파일이 이미지파일인지 확인
				if( isImage( attached.name ) ){
					$('#preview').html( '<img>' );
					var reader = new FileReader();
					reader.onload = function( e ){
						$('#preview img').attr('src', e.target.result );						
					}
					reader.readAsDataURL( attached );
				}else
					$('#preview').html('');
			}	
		}else{
			$('#file_name').text('');		//선택한 파일명 안보이게
			$('#delete-file').css('display', 'none');	//파일삭제 이미지도 안보이게
		}
	});
	
	$('#delete-file').click(function(){
		$('#file_name').text('');		//선택한 파일명 안보이게
		$('#attach-file').val('');		//선택한 file태그를 초기화
		$(this).css('display', 'none');	//파일삭제 이미지도 안보이게
		$('#preview').html('');//첨부된 이미지 미리보기 없애기
	});
	
	
	
	
});

	


	//여러개 파일첨부 처리 - board - new.jsp 
	//동적으로 생성한 태그에 대한 이벤트 처리는 문서에
	$(document).on('change', '.attach-file', function(){	
	
	var attached = this.files[0];
	var $div = $(this).closest('div.align');
	if(attached) {
		//원래있던 첨부파일은 삭제 대상 
		removedFile($div);
		
		//파일 첨부관련 태그를 복제 (선택파일명이 없을 때만)
		if($div.children('.file-name').text()=='')		copyFileTag();
		
		$div.children('.file-name').text(attached.name);// 파일명이 보이게
		$div.children('.delete-file').css('display', 'inline');
		
		//선ㄴ택한 파일이 이미지인 경우 미리보이게
		if($div.children('.preview').length>0) {
			if(isImage(attached.name)){
				$div.children('.preview').html('<img>');
				var reader = new FileReader();
				reader.onload = function(e) {
					$div.find('.preview img').attr('src', e.target.result);
				}
				reader.readAsDataURL(attached);
			}else 
				//$div.children('.preview').html('');
				$div.children('.preview').empty();
		}
	}else {
		$div.remove();
	}
	
}).on('click', '.delete-file', function(){
	var $div = $(this).closest('div.align');
	
	removedFile($div); //삭제클릭한 첨부파일의 id관리
	$div.remove();
});

//삭제클릭한 첨부파일의 id를 관리할 함수 
function removedFile($div) {
	var removed = $('[name=removed]').val(); //
	console.log(1, removed);
	if(removed=='') 	//removed에 데이터 없으면 
		removed = []; // 배열을 만든다
	else	//데이터가 있다면 
		removed = removed.indexOf(',')==-1 ? [removed] : removed.split(','); 
	console.log(2, removed);
	//데이터가 있다면 	removed에서 ,기준으로 데이터 끊어내고 다시 담음
	//데이터가 한개면 []이렇게
	
	if($div.data('file')) 
		removed.push(String($div.data('file')));//div가 가지고 있는 data의 file속성의 값을 추가(push)
	//타입을 문자로 바꿔서 추가해줘야함 <String
	console.log(3, removed);
	
	//removed = new Set(removed); //집합객체 Set : 중복 없앰(교집합을 없앰) 합집합
	removed = Array.from(new Set(removed)); //집합데이터를 다시 배열데이터로 만든다
	console.log(4, removed);
	console.log('file>',removed);
	
	$('[name=removed]').val(removed); 
	console.log('최종>', $('[name=removed]').val());
	
	
}


//첨부파일 관련 태그 복제 함수
function copyFileTag() {
	var $div = $('div.align').last();
	$div.after ($div.clone());
	//console.log('복제>', $('div.align').last().find('.attach-file').val());
	
	//복제된 태그 초기화
	$div = $('div.align').last();
	$div.find('.attach-file').val('');
}




//이미지파일인지 확인하는 함수
function isImage( filename ){
	//KOAS_SeatInfo.txt, abc.png, abc.jpg, abc.gif, ...
	var ext = filename.substring( filename.lastIndexOf('.')+1 );
	var imgs = [ 'png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp' ];
	if( imgs.indexOf( ext ) == -1 ) return false;
	else 							return true;
}



//input 태그에 입력값이 있는지 확인
function emptyCheck(){
	var ok = true;
	$('.chk').each(function(){
		if( $(this).val()=='' ){
			var item = $(this).attr('placeholder')
						? $(this).attr('placeholder') : $(this).attr('title');
			alert(item + ' 입력하세요!');
			$(this).focus();
			ok = false;
			return ok;			
		}
	});
	return ok;
}


//여러개 파일첨부 처리 - board - new.jsp
$('.attach-file').change(function(){
	var attached = this.files[0];
	var $div = $(this).closest('div.align');
	if(attached) {
		$div.children('.file-name').text(attached.name);// 파일명이 보이게
		$div.children('.delete-file').css('display', 'inline');
	}
});

//지도 팝업효과 태그 ->항상 가운데 두기
function center(tag, back) {
	var width = Math.max ($(window).width(), $('body').prop('scrollWidth'));
	var height = Math.max ($(window).width(), $('body').prop('scrollHeight'));
	back.css({'width':width, 'height':height});
	
	var left = ($(window).width() - tag.width())/2 + $(window).scrollLeft();
	var top = ($(window).height() - tag.height())/2 + $(window).scrollTop();
	tag.removeClass('center').css({'left':left, 'top':top, 'position':'absolute'});
	
	
}

function loading(is) {
	$('.loading').css('display', is ? 'block':'none');
}
