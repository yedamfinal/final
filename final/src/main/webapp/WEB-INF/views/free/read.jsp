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
                           <button type="button" onclick="location.href='noticeUpdateForm.do?defno=${vo.defno}' ">글수정</button>
                           <button type="button" onclick="location.href='noticeDelete.do?defno=${vo.defno}' ">글삭제</button>
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
               <button type="button" onclick="location.href='noticeList.do?type=notice' ">글목록</button>
               </div>
		</div>
		
		<!-- 댓글 -->
		<hr />
		<ul>
			<li>
				<div>
					<p>첫번째 댓글 작성자</p>
					<p>첫번째 댓글</p>
				</div>
			</li>
			<li>
				<div>
					<p>두번째 댓글 작성자</p>
					<p>두번째 댓글</p>
				</div>
			</li>
			<li>
				<div>
					<p>세번째 댓글 작성자</p>
					<p>세번째 댓글</p>
				</div>
			</li>
		</ul>

		<div>
			<p>
				<label>댓글 작성자</label> <input type="text">
			</p>
			<p>
				<textarea rows="5" cols="50"></textarea>
			</p>
			<p>
				<button type="button">댓글 작성</button>
			</p>
		</div>
		<!-- 댓글 -->
		
</div>        


</body>
</html>