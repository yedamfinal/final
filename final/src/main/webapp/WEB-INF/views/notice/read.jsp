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
            <div align="right">
            <button type="button" onclick="location.href='noticeUpdateForm.do?defno=${vo.defno}' ">글수정</button>
            <button type="button" onclick="location.href='noticeDelete.do?defno=${vo.defno}' ">글삭제</button>
            </div>
            	<table class="table" >
               		
                   <tr>
                       <td width="900px">
                        제목: ${vo.title}
                    </td>
                    <td>
                        작성자: ${vo.writer}
                    </td>
                   </tr>
                   <tr height="500px">
                       <td style="word-break:break-word; white-space: pre-wrap; table-layout: fixed;" >
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
		
		
		
</div>        


</body>
</html>