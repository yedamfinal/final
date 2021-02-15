<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div align="center">
            <br/>
            <br/>
            	<table class="table" >
               		
                   <tr>
                   		<td colspan="2" align="right">
                           <button class="btn btn-outline-secondary" type="button" onclick="location.href='communityUpdateForm.do?defno=${vo.defno}' ">글수정</button>
                           <button class="btn btn-outline-secondary" type="button" onclick="location.href='communityDelete.do?defno=${vo.defno}' ">글삭제</button>
                       </td>
                   </tr>
                   <tr>
                       <td width="900px">
                        제목: ${vo.title}
                    </td>
                    <td>
                        작성자: ${vo.writer}
                    </td>
                   </tr>
                   <tr height="500px">
                       <td colspan="2" valign="top">
                           ${vo.content}
                       </td>
                   </tr>
               </table>
               <hr />
               <c:if test="${not empty vo.deffile}">
               		<div align="left">
						<h6>첨부파일 : <a href="download/${vo.deffile}">${vo.deffile}</a></h6>
					</div>
			   </c:if>
			   <hr />
               <div align="right">
               <button type="button" class="btn btn-outline-secondary" onclick="location.href='communityList?type=free' ">글목록</button>
               </div>
		</div>
		
		<!-- 댓글 -->
		<hr />
		<ul id="reUl">
			
		</ul>

		<div id="commentIn">
			<p>
				<textarea rows="5" cols="100" id="comment"></textarea>
			</p>
			<p>
				<button class="btn btn-outline-secondary" id="commentButton">댓글 작성</button>
			</p>
		</div>
		
		<div id="commentUpdateHome">
			<div id="commentUpdate">
				<p>
					<textarea rows="5" cols="100" id="updateTextarea"></textarea>
				</p>
				<p>
					<button class="btn btn-outline-secondary" id="updateButton">수정</button>
					<button class="btn btn-outline-secondary" id="updateCancel">취소</button>
				</p>
			</div>
			<div id="recommentIn">
				<p>
					<textarea rows="5" cols="100" id="recomment"></textarea>
				</p>
				<p>
					<button class="btn btn-outline-secondary" id="recommentButton">답댓글 작성</button>
				</p>
			</div>
		</div>
		<!-- 댓글 -->
		
</div>        


</body>
<script type="text/javascript">
//버튼이벤트
$("#commentButton").on('click',addComment);
$("#recommentButton").on('click',addReComment);
$("#updateButton").on('click',commentUpdate);
$("#updateCancel").on('click',updateCancel);

//댓글 수정창 숨김
$('#commentUpdateHome').hide();

function formHide(){
	$('#commentUpdateHome').append($('#commentUpdate'));
	$('#commentUpdateHome').append($('#recommentIn'));
}

//댓글 리스트
let commentStart = ${comment};
for(var c of commentStart){
	makeComment(c);
}

//댓글 리스트 받아오기
function commentList(){
	$.ajax({
		url:'commentList.ajax',
		type:'post',
		data:{
			defno : '${vo.defno}'
		},
		success:function(list){
			formHide();
			$('#reUl').empty();
			for(var c of list){
				makeComment(c);
			}
		}
	});
}
//댓글등록
function addComment(){
	let comment= $('#comment').val();
	
	$.ajax({
		url:'addComment.do',
		type:'post',
		data:{
			recontent : comment,
			writer : '${person.id}',
			defno : '${vo.defno}'
		},
		success:commentList
	});
}

//댓글 만들기
function makeComment(re){
	let div,top,body,no;	
	top = $('<p />').html(re.writer+" | <span>"+re.redate + " </span>");
	/* top.append($('<button />').html('답글').click(function(){
		$().after() 대댓글
	})) */
	if(re.writer=='${person.id}'){//글쓴이랑 로그인id랑 같으면 수정삭제
		top.append($('<button />').addClass('pull-right btn btn-outline-secondary btn-sm').html('삭제').click(function(){
			reDelete(re.reno)
		}))
		top.append($('<button />').addClass('pull-right btn btn-outline-secondary btn-sm').html('수정').click(function(){
			reUpdateForm(re.reno,re.recontent)
		}))
		
	}
	top.append($('<button />').addClass('pull-right btn btn-outline-secondary btn-sm').html('답댓글').click(function(){
		rereInsertForm(re);
	}))
	let tap = '';
	/* for(var i=0; i<Number(re.reClass); i++){
		
		tap += '&nbsp&nbsp&nbsp&nbsp';
	} */
	if(Number(re.reClass)>0){
		tap += '&nbsp&nbsp&nbsp&nbspㄴ';
	}
	body = $('<h4 />').attr('id','body'+re.reno).addClass('text-body').html(tap+re.recontent);
	div = $('<div />').attr('id','re'+re.reno).append(top,body);
	$('#reUl').append(div);
	$('#comment').val('')
}

//댓글 삭제
function reDelete(no){
	$.ajax({
		url:'commentDelete.do',
		type:'post',
		data:{
			reno : no
		},
		success:function(result){
			if(result=='success'){
				commentList();
			}
		}
	});
}

//댓글 수정폼
function reUpdateForm(no,content){
	formHide();
	$('#updateTextarea').data('no',no).val(content);
	$('#re'+no).after($('#commentUpdate'));
	$('#commentUpdate').show();
}

//댓글 수정
function commentUpdate(){
	let no = $('#updateTextarea').data('no');
	let text = $('#updateTextarea').val();
	
	$.ajax({
		url:'commentUpdate.do',
		type:'post',
		data:{
			reno : no,
			recontent : text
		},
		success:function(result){
			if(result=='success'){
				commentList();
				formHide();
			}
		}
	});
}

//수정 취소
function updateCancel(){
	$('#updateTextarea').val('');
	formHide();
}

//답댓글 
function rereInsertForm(re){
	formHide();
	$('#recomment').data('re',re);
	$('#re'+re.reno).after($('#recommentIn'));
}
//답댓글 등록
function addReComment(){
	let comment= $('#recomment').val();
	let re = $('#recomment').data('re');
	let writer ='${person.id}';
	re.recontent=comment;
	re.writer=writer;
	delete re.redate;
	console.log(re,comment);
	
	$.ajax({
		url:'addReComment.do',
		type:'post',
		data:re,
		success:function(result){
			if(result=='success'){
				commentList();
				$('#recomment').val('');
				formHide();
			}
		}
	});
}

</script>
</html>