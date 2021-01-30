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
                           <button type="button" onclick="location.href='communityUpdateForm.do?defno=${vo.defno}' ">글수정</button>
                           <button type="button" onclick="location.href='communityDelete.do?defno=${vo.defno}' ">글삭제</button>
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
               <button type="button" onclick="location.href='communityList?type=free' ">글목록</button>
               </div>
		</div>
		
		<!-- 댓글 -->
		<hr />
		<ul id="reUl">
			
		</ul>

		<div id="commentIn">
			<p>
				<textarea rows="5" cols="50" id="comment"></textarea>
			</p>
			<p>
				<button id="commentButton">댓글 작성</button>
			</p>
		</div>
		<div id="commentUpdate">
			<p>
				<textarea rows="5" cols="50" id="updateTextarea"></textarea>
			</p>
			<p>
				<button id="updateButton">수정</button>
				<button id="updateCancel">취소</button>
			</p>
		</div>
		<!-- 댓글 -->
		
</div>        


</body>
<script type="text/javascript">
//버튼이벤트
$("#commentButton").on('click',addComment);
$("#updateButton").on('click',commentUpdate);
$("#updateCancel").on('click',updateCancel);

//댓글 수정창 숨김
$('#commentUpdate').hide();
//댓글 리스트
let commentList = ${comment};
for(var c of commentList){
	console.log(c)
	makeComment(c);
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
		success:makeComment
	});
}

//댓글 만들기
function makeComment(re){
	let div,top,body,no;	
	top = $('<p />').html(re.writer+" <span>"+re.redate+"</span>");
	/* top.append($('<button />').html('답글').click(function(){
		$().after() 대댓글
	})) */
	if(re.writer=='${person.id}'){//글쓴이랑 로그인id랑 같으면 수정삭제
		top.append($('<button />').html('수정').click(function(){
			reUpdateForm(re.reno,re.recontent)
		}))
		top.append($('<button />').html('삭제').click(function(){
			reDelete(re.reno)
		}))
	}
	body = $('<p />').attr('id','body'+re.reno).html(re.recontent);
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
				$('#re'+no).remove();
			}
		}
	});
}

//댓글 수정폼
function reUpdateForm(no,content){
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
				$('#body'+no).html(text);
				$('#commentUpdate').hide();
			}
		}
	});
}

//수정 취소
function updateCancel(){
	$('#updateTextarea').val('');
	$('#commentUpdate').hide();
}

</script>
</html>