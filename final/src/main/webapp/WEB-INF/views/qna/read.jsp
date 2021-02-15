<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div align="center">
            <br/>
            <br/>
            	<table class="table" >
                   <tr>
                   		<td colspan="2" align="right">
                           <button type="button" onclick="location.href='qnaUpdateForm.do?qnano=${vo.qnano}' ">글수정</button>
                           <button type="button" onclick="location.href='qnaDelete.do?qnano=${vo.qnano}' ">글삭제</button>
                           <c:if test="${person.type=='m' or person.auth=='yes'}">
								<button type="button" onclick="location.href='replyInsertForm.do?qnano=${vo.qnano}' ">답변</button>
							</c:if>
                           
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
               <hr />
               <div align="right">
               <button type="button" onclick="location.href='qnaList.do' ">글목록</button>
               </div>
		</div>
			
		
</div>        


</body>
</html>