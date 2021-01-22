<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
               <div align="right">
               <button type="button" onclick="location.href='noticeList.do?type=notice' ">글목록</button>
               </div>
        </div>
</div>        


</body>
</html>